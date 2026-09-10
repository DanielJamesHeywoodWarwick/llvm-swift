import LLVMC

public protocol LLVMType {
    
    var opaqueType: LLVMOpaqueType { get }
}

extension LLVMType {
    
    @inlinable
    internal var _rawType: LLVMTypeRef { opaqueType._rawType }
}
