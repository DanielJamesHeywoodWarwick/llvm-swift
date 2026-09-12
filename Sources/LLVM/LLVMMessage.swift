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

extension LLVMMessage: Equatable {
    
    @inlinable
    public static func == (lhs: LLVMMessage, rhs: LLVMMessage) -> Bool { lhs.description == rhs.description }
}

extension LLVMMessage: Hashable {
    
    @inlinable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(description)
    }
}

extension LLVMMessage: CustomStringConvertible {
    
    @inlinable
    public var description: String { String(cString: _rawMessage) }
}

extension LLVMMessage: CustomDebugStringConvertible {
    
    @inlinable
    public var debugDescription: String { "LLVMMessage(\(description.debugDescription))" }
}

extension LLVMMessage: CustomReflectable {
    
    @inlinable
    public var customMirror: Mirror { Mirror(self, children: [:]) }
}
