import LLVMC

@frozen
public struct LLVMOpaqueFirstClassValue: LLVMFirstClassValue {
    
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
    public var opaqueFirstClassValue: LLVMOpaqueFirstClassValue { self }
}

extension LLVMOpaqueFirstClassValue: Equatable {
    
    @inlinable
    public static func == (lhs: LLVMOpaqueFirstClassValue, rhs: LLVMOpaqueFirstClassValue) -> Bool {
        lhs._rawValue == rhs._rawValue
    }
}

extension LLVMOpaqueFirstClassValue: Hashable {
    
    @inlinable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(_rawValue)
    }
}
