import LLVMC

@frozen
public struct LLVMOpaqueFirstClassType: LLVMFirstClassType {
    
    @usableFromInline
    internal let _rawType: LLVMTypeRef
    
    public let context: LLVMContext
    
    @inlinable
    internal init(_rawType: LLVMTypeRef, in context: LLVMContext) {
        self._rawType = _rawType
        self.context = context
    }
    
    @inlinable
    public var opaqueFirstClassType: LLVMOpaqueFirstClassType { self }
}

extension LLVMOpaqueFirstClassType: Equatable {
    
    @inlinable
    public static func == (lhs: LLVMOpaqueFirstClassType, rhs: LLVMOpaqueFirstClassType) -> Bool {
        lhs._rawType == rhs._rawType
    }
}

extension LLVMOpaqueFirstClassType: Hashable {
    
    @inlinable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(_rawType)
    }
}
