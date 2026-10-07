import LLVMC

public struct LLVMOpaqueInstruction: LLVMInstruction {
    
    @usableFromInline
    internal let _rawValue: LLVMValueRef
    
    @usableFromInline
    internal let _context: LLVMContext
    
    @inlinable
    internal init(_rawValue: LLVMValueRef, in context: LLVMContext) {
        self._rawValue = _rawValue
        _context = context
    }
    
    @inlinable
    public var opaqueInstruction: LLVMOpaqueInstruction { self }
}

extension LLVMOpaqueInstruction: Equatable {
    
    @inlinable
    public static func == (lhs: LLVMOpaqueInstruction, rhs: LLVMOpaqueInstruction) -> Bool { lhs._rawValue == rhs._rawValue }
}

extension LLVMOpaqueInstruction: Hashable {
    
    @inlinable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(_rawValue)
    }
}

extension LLVMOpaqueInstruction: CustomReflectable {
    
    @inlinable
    public var customMirror: Mirror { Mirror(self, children: [:]) }
}
