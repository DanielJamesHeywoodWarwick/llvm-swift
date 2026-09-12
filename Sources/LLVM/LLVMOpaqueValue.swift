import LLVMC

@frozen
public struct LLVMOpaqueValue: LLVMValue {
    
    @usableFromInline
    internal let _rawValue: LLVMValueRef
    
    public let context: LLVMContext
    
    @inlinable
    internal init(_rawValue: LLVMValueRef, in context: LLVMContext) {
        self._rawValue = _rawValue
        self.context = context
    }
    
    @inlinable
    public var opaqueValue: LLVMOpaqueValue { self }
}

extension LLVMOpaqueValue: Equatable {
    
    @inlinable
    public static func == (lhs: LLVMOpaqueValue, rhs: LLVMOpaqueValue) -> Bool { lhs._rawValue == rhs._rawValue }
}

extension LLVMOpaqueValue: Hashable {
    
    @inlinable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(_rawValue)
    }
}

extension LLVMOpaqueValue: CustomReflectable {
    
    @inlinable
    public var customMirror: Mirror { Mirror(self, unlabeledChildren: EmptyCollection() as EmptyCollection<Void>) }
}
