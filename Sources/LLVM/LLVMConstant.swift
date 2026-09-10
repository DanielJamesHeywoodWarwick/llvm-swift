public protocol LLVMConstant: LLVMFirstClassValue {
    
    var opaqueConstant: LLVMOpaqueConstant { get }
}

extension LLVMConstant {
    
    @inlinable
    public var opaqueFirstClassValue: LLVMOpaqueFirstClassValue {
        LLVMOpaqueFirstClassValue(_rawValue: opaqueConstant._rawValue, in: opaqueConstant.context)
    }
}
