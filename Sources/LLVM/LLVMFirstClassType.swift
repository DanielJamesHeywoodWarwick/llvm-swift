public protocol LLVMFirstClassType: LLVMType {
    
    var opaqueFirstClassType: LLVMOpaqueFirstClassType { get }
}

extension LLVMFirstClassType {
    
    @inlinable
    public var opaqueType: LLVMOpaqueType {
        LLVMOpaqueType(_rawType: opaqueFirstClassType._rawType, in: opaqueFirstClassType.context)
    }
}
