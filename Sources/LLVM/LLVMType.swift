import LLVMC

public protocol LLVMType {
    
    var opaqueType: LLVMOpaqueType { get }
}

extension LLVMType {
    
    @inlinable
    public var context: LLVMContext { opaqueType.context }
    
    @inlinable
    internal var _rawType: LLVMTypeRef { opaqueType._rawType }
}
