import LLVMC

@frozen
public struct LLVMFunction: LLVMValue {
    
    @usableFromInline
    internal let _rawValue: LLVMValueRef
    
    public let context: LLVMContext
    
    @inlinable
    internal init(_rawValue: LLVMValueRef, in context: LLVMContext) {
        self._rawValue = _rawValue
        self.context = context
    }
    
    @inlinable
    public var opaqueValue: LLVMOpaqueValue { LLVMOpaqueValue(_rawValue: _rawValue, in: context) }
}

extension LLVMFunction: Equatable {
    
    @inlinable
    public static func == (lhs: LLVMFunction, rhs: LLVMFunction) -> Bool { lhs._rawValue == rhs._rawValue }
}

extension LLVMFunction: Hashable {
    
    @inlinable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(_rawValue)
    }
}

