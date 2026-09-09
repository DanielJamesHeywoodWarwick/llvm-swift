import LLVMC

public protocol LLVMValue {
    
    var opaqueValue: LLVMOpaqueValue { get }
}

extension LLVMValue {
    
    @inlinable
    internal var _rawValue: LLVMValueRef { opaqueValue._rawValue }
}
