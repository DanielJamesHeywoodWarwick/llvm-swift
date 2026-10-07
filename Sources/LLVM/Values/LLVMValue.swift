import LLVMC

public class LLVMValue {
    
    @usableFromInline
    internal let _rawValue: LLVMValueRef
    
    @inlinable
    internal init(_rawValue: LLVMValueRef) {
        self._rawValue = _rawValue
    }
}

extension LLVMValue: Equatable {
    
    @inlinable
    public static func == (lhs: LLVMValue, rhs: LLVMValue) -> Bool { lhs._rawValue == rhs._rawValue }
}

extension LLVMValue: Hashable {
    
    @inlinable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(_rawValue)
    }
}

extension LLVMValue: CustomReflectable {
    
    @inlinable
    public var customMirror: Mirror { Mirror(self, children: [:]) }
}
