public protocol LLVMInstruction: LLVMValue {
    
    var opaqueInstruction: LLVMOpaqueInstruction { get }
}

extension LLVMInstruction {
    
    @inlinable
    public var customMirror: Mirror { Mirror(self, children: [:]) }
}
