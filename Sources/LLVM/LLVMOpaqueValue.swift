import LLVMC

@frozen
public struct LLVMOpaqueValue: LLVMValue {
    
    @usableFromInline
    internal let _rawValue: LLVMValueRef
    
    @usableFromInline
    internal let _context: LLVMContext
    
    @inlinable
    internal init(_rawValue: LLVMValueRef, in context: LLVMContext) {
        self._rawValue = _rawValue
        _context = context
    }
    
    @inlinable
    public var opaqueValue: LLVMOpaqueValue { self }
}

extension LLVMOpaqueValue: Equatable {
    
    @inlinable
    public static func == (lhs: LLVMOpaqueValue, rhs: LLVMOpaqueValue) -> Bool { lhs._rawValue == rhs._rawValue }
}

extension LLVMOpaqueValue: Hashable {
    
    @inlinable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(_rawValue)
    }
}
