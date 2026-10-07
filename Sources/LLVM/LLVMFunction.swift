import LLVMC

public class LLVMFunction: LLVMValue {
    
    @inlinable
    public func appendBasicBlock(_ name: String = "") -> LLVMBasicBlock {
        guard case let .module(module) = _container else {
            preconditionFailure("The function is not in a module")
        }
        return LLVMBasicBlock(_rawBlock: LLVMAppendBasicBlockInContext(module._rawContext, _rawValue, name), in: module)
    }
}
