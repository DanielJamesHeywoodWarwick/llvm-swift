import LLVMC

public protocol LLVMValue {
    
    var opaqueValue: LLVMOpaqueValue { get }
}

extension LLVMValue {
    
    @inlinable
    internal var _context: LLVMContext { opaqueValue._context }
    
    @inlinable
    internal var _rawValue: LLVMValueRef { opaqueValue._rawValue }
    
    @inlinable
    internal var _rawContext: LLVMContextRef { _context._rawContext }
}
