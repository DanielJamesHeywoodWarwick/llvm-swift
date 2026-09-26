import LLVMC

@frozen
public struct LLVMOpaqueType: LLVMType {
    
    @usableFromInline
    internal let _rawType: LLVMTypeRef
    
    @usableFromInline
    internal let _context: LLVMContext
    
    @inlinable
    internal init(_rawType: LLVMTypeRef, in context: LLVMContext) {
        self._rawType = _rawType
        _context = context
    }
    
    @inlinable
    public var opaqueType: LLVMOpaqueType { self }
}

extension LLVMOpaqueType: Equatable {
    
    @inlinable
    public static func == (lhs: LLVMOpaqueType, rhs: LLVMOpaqueType) -> Bool { lhs._rawType == rhs._rawType }
}

extension LLVMOpaqueType: Hashable {
    
    @inlinable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(_rawType)
    }
}

extension LLVMOpaqueType: CustomReflectable {
    
    @inlinable
    public var customMirror: Mirror { Mirror(self, children: [:]) }
}
