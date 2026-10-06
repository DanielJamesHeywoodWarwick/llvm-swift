import LLVMC

@frozen
public struct LLVMFunction: LLVMValue {
    
    @usableFromInline
    internal let _rawValue: LLVMValueRef
    
    @usableFromInline
    internal let _module: LLVMModule
    
    @inlinable
    internal init(_rawValue: LLVMValueRef, in module: LLVMModule) {
        self._rawValue = _rawValue
        _module = module
    }
    
    @inlinable
    public func appendBasicBlock() -> LLVMBasicBlock {
        LLVMBasicBlock(_rawBlock: LLVMAppendBasicBlockInContext(_rawContext, _rawValue, ""), in: _module)
    }
    
    @inlinable
    public var opaqueValue: LLVMOpaqueValue { LLVMOpaqueValue(_rawValue: _rawValue, in: _context) }
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

extension LLVMFunction: CustomDebugStringConvertible {
    
    @inlinable
    public var debugDescription: String { "LLVMFunction()" }
}

extension LLVMFunction: CustomReflectable {
    
    @inlinable
    public var customMirror: Mirror { Mirror(self, children: [:]) }
}
