import LLVMC

@frozen
public struct LLVMTarget {
    
    @usableFromInline
    internal let _rawTarget: LLVMTargetRef
}

extension LLVMTarget: Equatable {
    
    @inlinable
    public static func == (lhs: LLVMTarget, rhs: LLVMTarget) -> Bool { lhs._rawTarget == rhs._rawTarget }
}

extension LLVMTarget: Hashable {
    
    @inlinable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(_rawTarget)
    }
}
