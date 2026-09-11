import LLVMC

@frozen
public struct LLVMTargetTriple {
    
    @usableFromInline
    internal final class _Storage {
        
        @usableFromInline
        internal let rawMessage: UnsafeMutablePointer<CChar>
        
        @inlinable
        internal init(rawMessage: UnsafeMutablePointer<CChar>) {
            self.rawMessage = rawMessage
        }
        
        @inlinable
        deinit {
            LLVMDisposeMessage(rawMessage)
        }
    }
    
    @usableFromInline
    internal let _storage: _Storage
    
    @inlinable
    internal init(_rawMessage: UnsafeMutablePointer<CChar>) {
        self._storage = _Storage(rawMessage: _rawMessage)
    }
    
    @inlinable
    public static var `default`: LLVMTargetTriple { LLVMTargetTriple(_rawMessage: LLVMGetDefaultTargetTriple()) }
}
