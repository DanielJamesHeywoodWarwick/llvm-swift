import LLVMC

@frozen
public struct LLVMIntegerType: LLVMFirstClassType {
    
    @usableFromInline
    internal let _rawType: LLVMTypeRef
    
    @usableFromInline
    internal let _context: LLVMContext
    
    @inlinable
    public init(bitWidth: Int, in context: LLVMContext) {
        precondition(1...8388608 ~= bitWidth, "Expected a bit width between 1 and 8388608, but got \(bitWidth)")
        _rawType = LLVMIntTypeInContext(context._rawContext, UInt32(bitWidth))
        _context = context
    }
    
    @inlinable
    public var opaqueFirstClassType: LLVMOpaqueFirstClassType {
        LLVMOpaqueFirstClassType(_rawType: _rawType, in: _context)
    }
}

extension LLVMIntegerType: Equatable {
    
    @inlinable
    public static func == (lhs: LLVMIntegerType, rhs: LLVMIntegerType) -> Bool { lhs._rawType == rhs._rawType }
}

extension LLVMIntegerType: Hashable {
    
    @inlinable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(_rawType)
    }
}

extension LLVMIntegerType: CustomReflectable {
    
    @inlinable
    public var customMirror: Mirror { Mirror(self, children: [:]) }
}
