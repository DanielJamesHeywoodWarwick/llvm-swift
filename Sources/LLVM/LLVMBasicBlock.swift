import LLVMC

@frozen
public struct LLVMBasicBlock {
    
    @usableFromInline
    internal let _rawBlock: LLVMBasicBlockRef
    
    public let module: LLVMModule
    
    @inlinable
    internal init(_rawBlock: LLVMBasicBlockRef, in module: LLVMModule) {
        self._rawBlock = _rawBlock
        self.module = module
    }
}

extension LLVMBasicBlock: Equatable {
    
    @inlinable
    public static func == (lhs: LLVMBasicBlock, rhs: LLVMBasicBlock) -> Bool { lhs._rawBlock == rhs._rawBlock }
}

extension LLVMBasicBlock: Hashable {
    
    @inlinable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(_rawBlock)
    }
}
