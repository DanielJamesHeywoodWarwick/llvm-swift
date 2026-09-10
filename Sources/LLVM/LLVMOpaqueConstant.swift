import LLVMC

@frozen
public struct LLVMOpaqueConstant: LLVMConstant {
    
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
    public var opaqueConstant: LLVMOpaqueConstant { self }
}

extension LLVMOpaqueConstant: Equatable {
    
    @inlinable
    public static func == (lhs: LLVMOpaqueConstant, rhs: LLVMOpaqueConstant) -> Bool { lhs._rawValue == rhs._rawValue }
}

extension LLVMOpaqueConstant: Hashable {
    
    @inlinable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(_rawValue)
    }
}

