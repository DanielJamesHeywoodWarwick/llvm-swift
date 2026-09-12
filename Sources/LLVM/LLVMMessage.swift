import LLVMC

@frozen
public struct LLVMMessage {
    
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
    internal var _rawMessage: UnsafeMutablePointer<CChar> { _storage.rawMessage }
}

extension LLVMMessage: CustomReflectable {
    
    @inlinable
    public var customMirror: Mirror { Mirror(self, children: ["rawMessage": _rawMessage], displayStyle: .struct) }
}
