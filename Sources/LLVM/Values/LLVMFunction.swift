import LLVMC

public class LLVMFunction: LLVMValue {
    
    @usableFromInline
    internal let _module: LLVMModule
    
    @inlinable
    internal init(_rawValue: LLVMValueRef, in module: LLVMModule) {
        _module = module
        super.init(_rawValue: _rawValue)
    }
    
    @inlinable
    public func appendBasicBlock() -> LLVMBasicBlock {
        LLVMBasicBlock(_rawBlock: LLVMAppendBasicBlockInContext(_module._context._rawContext, _rawValue, ""), in: _module)
    }
}
