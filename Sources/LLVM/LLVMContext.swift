import LLVMC

@frozen
public struct LLVMContext {
    
    @usableFromInline
    internal final class _Storage {
        
        @usableFromInline
        internal let rawContext = LLVMContextCreate() as LLVMContextRef
        
        @inlinable
        internal init() {}
        
        @inlinable
        deinit {
            LLVMContextDispose(rawContext)
        }
    }
    
    @usableFromInline
    internal let _storage = _Storage()
    
    @inlinable
    public init() {}
    
    @inlinable
    internal var _rawContext: LLVMContextRef { _storage.rawContext }
}

extension LLVMContext: Equatable {
    
    @inlinable
    public static func == (lhs: LLVMContext, rhs: LLVMContext) -> Bool {
        lhs._rawContext == rhs._rawContext
    }
}

extension LLVMContext: Hashable {
    
    @inlinable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(_rawContext)
    }
}
