public protocol LLVMInstruction: LLVMValue {
    
    var opaqueInstruction: LLVMOpaqueInstruction { get }
}

extension LLVMInstruction {
    
    @inlinable
    public var opaqueValue: LLVMOpaqueValue {
        LLVMOpaqueValue(_rawValue: opaqueInstruction._rawValue, in: opaqueInstruction._context)
    }
}
