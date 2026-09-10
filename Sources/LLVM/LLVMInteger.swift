public protocol LLVMInteger: LLVMFirstClassValue {
    
    var opaqueInteger: LLVMOpaqueInteger { get }
}

extension LLVMInteger {
    
    @inlinable
    public var opaqueFirstClassValue: LLVMOpaqueFirstClassValue {
        LLVMOpaqueFirstClassValue(_rawValue: opaqueInteger._rawValue, in: opaqueInteger.context)
    }
}
