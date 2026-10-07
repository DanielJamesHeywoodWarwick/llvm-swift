import LLVMC

public class LLVMBuilder {
    
    @usableFromInline
    internal enum _Container {
        case context(LLVMContext)
        case module(LLVMModule)
    }
    
    @usableFromInline
    internal let _rawBuilder: LLVMBuilderRef
    
    @usableFromInline
    internal var _container: _Container
    
    @inlinable
    public init(in context: LLVMContext) {
        _rawBuilder = LLVMCreateBuilderInContext(context._rawContext)
        _container = .context(context)
    }
    
    @inlinable
    deinit {
        LLVMDisposeBuilder(_rawBuilder)
    }
    
    @inlinable
    public func position(atEndOf block: LLVMBasicBlock) {
        precondition(_context == block._context, "The block is not in the same context as the builder")
        LLVMPositionBuilderAtEnd(_rawBuilder, block._rawBlock)
        if case let .module(module) = _container {
            _container = .module(module)
        }
    }
    
    @inlinable
    public func buildReturn(of value: LLVMValue) -> LLVMValue {
        let rawValue = LLVMBuildRet(_rawBuilder, value._rawValue) as LLVMValueRef
        return switch _container {
        case let .context(context):
            LLVMValue(_rawValue: rawValue, in: context)
        case let .module(module):
            LLVMValue(_rawValue: rawValue, in: module)
        }
    }
    
    @inlinable
    internal var _context: LLVMContext {
        switch _container {
        case let .context(context):
            context
        case let .module(module):
            module._context
        }
    }
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

extension LLVMBuilder: CustomReflectable {
    
    @inlinable
    public var customMirror: Mirror { Mirror(self, children: [:]) }
}
