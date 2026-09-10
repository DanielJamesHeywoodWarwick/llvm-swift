import LLVMC

@frozen
public struct LLVMOpaqueInteger: LLVMInteger {
    
    @usableFromInline
    internal let _rawValue: LLVMValueRef
    
    @usableFromInline
    internal let _context: LLVMContext
    
    @inlinable
    internal init(_rawValue: LLVMValueRef, in context: LLVMContext) {
        self._rawValue = _rawValue
        self._context = context
    }
    
    @inlinable
    public var opaqueInteger: LLVMOpaqueInteger { self }
}

extension LLVMOpaqueInteger: Equatable {
    
    @inlinable
    public static func == (lhs: LLVMOpaqueInteger, rhs: LLVMOpaqueInteger) -> Bool { lhs._rawValue == rhs._rawValue }
}

extension LLVMOpaqueInteger: Hashable {
    
    @inlinable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(_rawValue)
    }
}
