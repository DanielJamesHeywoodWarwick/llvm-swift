import LLVMC

public protocol LLVMValue {
    
    var opaqueValue: LLVMOpaqueValue { get }
}

extension LLVMValue {
    
    @inlinable
    public var context: LLVMContext { opaqueValue.context }
    
    @inlinable
    internal var _rawValue: LLVMValueRef { opaqueValue._rawValue }
}
