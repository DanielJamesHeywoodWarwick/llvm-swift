import LLVMC

public protocol LLVMType {
    
    var opaqueType: LLVMOpaqueType { get }
}

extension LLVMType {
    
    @inlinable
    internal var _rawType: LLVMTypeRef { opaqueType._rawType }
    
    @inlinable
    internal var _context: LLVMContext { opaqueType._context }
}
