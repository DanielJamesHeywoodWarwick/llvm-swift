import LLVMC

@frozen
public struct LLVMModule {
    
    @usableFromInline
    internal final class _Storage {
        
        @usableFromInline
        internal let rawModule: LLVMModuleRef
        
        @usableFromInline
        internal let context: LLVMContext
        
        @inlinable
        internal init(id: String, in context: LLVMContext) {
            self.rawModule = LLVMModuleCreateWithNameInContext(id, context._rawContext)
            self.context = context
        }
        
        @inlinable
        deinit {
            LLVMDisposeModule(rawModule)
        }
    }
    
    @usableFromInline
    internal let _storage: _Storage
    
    @inlinable
    public init(id: String, sourceFileName: String, in context: LLVMContext) {
        self._storage = _Storage(id: id, in: context)
        var sourceFileName = sourceFileName
        sourceFileName.withUTF8 { buffer in
            LLVMSetSourceFileName(_storage.rawModule, buffer.baseAddress, buffer.count)
        }
    }
    
    @inlinable
    public func addFunction(
        _ name: String,
        returnType: LLVMFirstClassType,
        parameterTypes: some Sequence<LLVMFirstClassType>,
        isVariableArgument: Bool = false
    ) -> LLVMFunction {
        precondition(returnType.context == context, "The return type is not in the same context as the module")
        precondition(
            parameterTypes.allSatisfy { type in type.context == context },
            "The parameter types are not all in the same context as the module"
        )
        var rawParameterTypes = parameterTypes.map { type in type._rawType as LLVMTypeRef? }
        return LLVMFunction(
            _rawValue: LLVMAddFunction(
                _rawModule,
                name,
                rawParameterTypes.withUnsafeMutableBufferPointer { buffer in
                    guard let parameterCount = UInt32(exactly: buffer.count) else {
                        preconditionFailure("Expected at most \(UInt32.max) parameters, but got \(buffer.count)")
                    }
                    return LLVMFunctionType(
                        returnType._rawType,
                        buffer.baseAddress, parameterCount,
                        isVariableArgument ? 1 : 0
                    )
                }
            ),
            in: self
        )
    }
    
    @inlinable
    public var context: LLVMContext { _storage.context }
    
    @inlinable
    internal var _rawModule: LLVMModuleRef { _storage.rawModule }
}

extension LLVMModule: Equatable {
    
    @inlinable
    public static func == (lhs: LLVMModule, rhs: LLVMModule) -> Bool { lhs._rawModule == rhs._rawModule }
}

extension LLVMModule: Hashable {
    
    @inlinable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(_rawModule)
    }
}

extension LLVMModule: CustomReflectable {
    
    @inlinable
    public var customMirror: Mirror { Mirror(self, children: [:]) }
}
