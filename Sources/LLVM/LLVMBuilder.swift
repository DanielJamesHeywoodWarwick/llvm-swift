import LLVMC

public class LLVMBuilder {
    
    @usableFromInline
    internal let _rawBuilder: LLVMBuilderRef
    
    @usableFromInline
    internal let _context: LLVMContext
    
    @inlinable
    public init(in context: LLVMContext) {
        _rawBuilder = LLVMCreateBuilderInContext(context._rawContext)
        _context = context
    }
    
    @inlinable
    deinit {
        LLVMDisposeBuilder(_rawBuilder)
    }
    
    @inlinable
    public func position(atEndOf block: LLVMBasicBlock) {
        LLVMPositionBuilderAtEnd(_rawBuilder, block._rawBlock)
    }
    
    @inlinable
    public func buildReturn(of value: LLVMFirstClassValue) -> LLVMInstruction {
        precondition(value._context == _context, "The value is not in the same context as the builder")
        return LLVMOpaqueInstruction(_rawValue: LLVMBuildRet(_rawBuilder, value._rawValue), in: _context)
    }
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
