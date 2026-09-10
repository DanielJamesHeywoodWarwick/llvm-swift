import LLVMC

@frozen
public struct LLVMBuilder {
    
    @usableFromInline
    internal final class _Storage {
        
        @usableFromInline
        internal let rawBuilder: LLVMBuilderRef
        
        @usableFromInline
        internal let context: LLVMContext
        
        @inlinable
        internal init(in context: LLVMContext) {
            rawBuilder = LLVMCreateBuilderInContext(context._rawContext)
            self.context = context
        }
        
        @inlinable
        deinit {
            LLVMDisposeBuilder(rawBuilder)
        }
    }
    
    @usableFromInline
    internal let _storage: _Storage
    
    @inlinable
    public init(in context: LLVMContext) {
        _storage = _Storage(in: context)
    }
    
    @inlinable
    internal var _rawBuilder: LLVMBuilderRef { _storage.rawBuilder }
    
    @inlinable
    internal var _context: LLVMContext { _storage.context }
}

extension LLVMBuilder: Equatable {
    
    @inlinable
    public static func == (lhs: LLVMBuilder, rhs: LLVMBuilder) -> Bool { lhs._rawBuilder == rhs._rawBuilder }
}

extension LLVMBuilder: Hashable {
    
    @inlinable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(_rawBuilder)
    }
}
