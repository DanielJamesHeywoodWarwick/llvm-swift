import LLVMC

@frozen
public struct LLVMTargetTriple {
    
    @usableFromInline
    internal let _message: LLVMMessage
    
    @inlinable
    internal init(_rawMessage: UnsafeMutablePointer<CChar>) {
        self._message = LLVMMessage(_rawMessage: _rawMessage)
    }
    
    @inlinable
    public static var `default`: LLVMTargetTriple { LLVMTargetTriple(_rawMessage: LLVMGetDefaultTargetTriple()) }
}
