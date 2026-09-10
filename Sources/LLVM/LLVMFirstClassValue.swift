public protocol LLVMFirstClassValue: LLVMValue {
    
    var opaqueFirstClassValue: LLVMOpaqueFirstClassValue { get }
}

extension LLVMFirstClassValue {
    
    @inlinable
    public var opaqueValue: LLVMOpaqueValue {
        LLVMOpaqueValue(_rawValue: opaqueFirstClassValue._rawValue, in: opaqueFirstClassValue._context)
    }
}
