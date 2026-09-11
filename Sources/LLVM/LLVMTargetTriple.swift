import LLVMC

@frozen
public struct LLVMTargetTriple {
    
    public let message: LLVMMessage
    
    @inlinable
    internal init(_rawMessage: UnsafeMutablePointer<CChar>) {
        self.message = LLVMMessage(_rawMessage: _rawMessage)
    }
    
    @inlinable
    public static var `default`: LLVMTargetTriple { LLVMTargetTriple(_rawMessage: LLVMGetDefaultTargetTriple()) }
}
