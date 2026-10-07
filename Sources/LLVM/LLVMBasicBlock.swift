import LLVMC

public class LLVMBasicBlock {
    
    @usableFromInline
    internal enum _Container {
        case context(LLVMContext)
        case module(LLVMModule)
    }
    
    @usableFromInline
    internal let _rawBlock: LLVMBasicBlockRef
    
    @usableFromInline
    internal let _container: _Container
    
    @inlinable
    internal init(_rawBlock: LLVMBasicBlockRef, in module: LLVMModule) {
        self._rawBlock = _rawBlock
        _container = .module(module)
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

extension LLVMBasicBlock: Equatable {
    
    @inlinable
    public static func == (lhs: LLVMBasicBlock, rhs: LLVMBasicBlock) -> Bool { lhs._rawBlock == rhs._rawBlock }
}

extension LLVMBasicBlock: Hashable {
    
    @inlinable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(_rawBlock)
    }
}

extension LLVMBasicBlock: CustomReflectable {
    
    @inlinable
    public var customMirror: Mirror { Mirror(self, children: [:]) }
}
