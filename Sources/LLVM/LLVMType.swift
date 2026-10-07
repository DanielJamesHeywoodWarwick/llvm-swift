import LLVMC

public class LLVMType {
    
    @usableFromInline
    internal let _rawType: LLVMTypeRef
    
    @usableFromInline
    internal let _context: LLVMContext
    
    @inlinable
    internal init(_rawType: LLVMTypeRef, in context: LLVMContext) {
        self._rawType = _rawType
        _context = context
    }
}

public class LLVMFirstClassType: LLVMType {}

public class LLVMIntegerType: LLVMFirstClassType {
    
    @inlinable
    public init(bitWidth: Int, in context: LLVMContext) {
        precondition(1...8388608 ~= bitWidth, "Expected a bit width between 1 and 8388608, but got \(bitWidth)")
        super.init(_rawType: LLVMIntTypeInContext(context._rawContext, UInt32(bitWidth)), in: context)
    }
}


extension LLVMType: Equatable {
    
    @inlinable
    public static func == (lhs: LLVMType, rhs: LLVMType) -> Bool { lhs._rawType == rhs._rawType }
}

extension LLVMType: Hashable {
    
    @inlinable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(_rawType)
    }
}

extension LLVMType: CustomReflectable {
    
    @inlinable
    public var customMirror: Mirror { Mirror(self, children: [:]) }
}
