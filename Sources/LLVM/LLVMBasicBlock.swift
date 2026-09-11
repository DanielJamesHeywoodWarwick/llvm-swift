import LLVMC

@frozen
public struct LLVMBasicBlock {
    
    @usableFromInline
    internal let _rawBasicBlock: LLVMBasicBlockRef
    
    public let module: LLVMModule
    
    @inlinable
    internal init(_rawBasicBlock: LLVMBasicBlockRef, in module: LLVMModule) {
        self._rawBasicBlock = _rawBasicBlock
        self.module = module
    }
}

extension LLVMBasicBlock: Equatable {
    
    @inlinable
    public static func == (lhs: LLVMBasicBlock, rhs: LLVMBasicBlock) -> Bool { lhs._rawBasicBlock == rhs._rawBasicBlock }
}

extension LLVMBasicBlock: Hashable {
    
    @inlinable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(_rawBasicBlock)
    }
}
