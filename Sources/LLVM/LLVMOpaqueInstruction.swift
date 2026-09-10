import LLVMC

@frozen
public struct LLVMOpaqueInstruction: LLVMInstruction {
    
    @usableFromInline
    internal let _rawValue: LLVMValueRef
    
    public let context: LLVMContext
    
    @inlinable
    internal init(_rawValue: LLVMValueRef, in context: LLVMContext) {
        self._rawValue = _rawValue
        self.context = context
    }
    
    @inlinable
    public var opaqueInstruction: LLVMOpaqueInstruction { self }
}
