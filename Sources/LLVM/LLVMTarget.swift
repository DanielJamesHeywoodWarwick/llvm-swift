import LLVMC

@frozen
public struct LLVMTarget {
    
    @usableFromInline
    internal let _rawTarget: LLVMTargetRef
}

extension LLVMTarget: Hashable {}

extension LLVMTarget: CustomReflectable {
    
    @inlinable
    public var customMirror: Mirror { Mirror(self, children: [:]) }
}
