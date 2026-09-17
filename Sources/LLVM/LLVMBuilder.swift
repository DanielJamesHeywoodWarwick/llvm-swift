import LLVMC

@frozen
public struct LLVMBuilder {
    
    @usableFromInline
    internal final class _Storage {
        
        @usableFromInline
        internal let rawBuilder: LLVMBuilderRef
        
        @usableFromInline
        internal let context: LLVMContext
        
        @inlinable
        internal init(in context: LLVMContext) {
            rawBuilder = LLVMCreateBuilderInContext(context._rawContext)
            self.context = context
        }
        
        @inlinable
        deinit {
            LLVMDisposeBuilder(rawBuilder)
        }
    }
    
    @usableFromInline
    internal let _storage: _Storage
    
    @inlinable
    public init(in context: LLVMContext) {
        _storage = _Storage(in: context)
    }
    
    @inlinable
    public func position(atEndOf block: LLVMBasicBlock) {
        LLVMPositionBuilderAtEnd(_rawBuilder, block._rawBlock)
    }
    
    @inlinable
    public func buildReturn(of value: LLVMFirstClassValue) -> LLVMInstruction {
        precondition(value.context == context, "The value is not in the same context as the builder")
        return LLVMOpaqueInstruction(_rawValue: LLVMBuildRet(_rawBuilder, value._rawValue), in: context)
    }
    
    @inlinable
    public var context: LLVMContext { _storage.context }
    
    @inlinable
    internal var _rawBuilder: LLVMBuilderRef { _storage.rawBuilder }
}

extension LLVMBuilder: Equatable {
    
    @inlinable
    public static func == (lhs: LLVMBuilder, rhs: LLVMBuilder) -> Bool { lhs._rawBuilder == rhs._rawBuilder }
}

extension LLVMBuilder: Hashable {
    
    @inlinable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(_rawBuilder)
    }
}

extension LLVMBuilder: CustomReflectable {
    
    @inlinable
    public var customMirror: Mirror { Mirror(self, children: [:]) }
}
