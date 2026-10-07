import LLVMC

public class LLVMValue {
    
    @usableFromInline
    internal enum _Container {
        case context(LLVMContext)
        case module(LLVMModule)
    }
    
    @usableFromInline
    internal let _rawValue: LLVMValueRef
    
    @usableFromInline
    internal var _container: _Container
    
    @inlinable
    internal init(_rawValue: LLVMValueRef, in context: LLVMContext) {
        self._rawValue = _rawValue
        _container = .context(context)
    }
    
    @inlinable
    internal init(_rawValue: LLVMValueRef, in module: LLVMModule) {
        self._rawValue = _rawValue
        _container = .module(module)
    }
}

extension LLVMValue: Equatable {
    
    @inlinable
    public static func == (lhs: LLVMValue, rhs: LLVMValue) -> Bool { lhs._rawValue == rhs._rawValue }
}

extension LLVMValue: Hashable {
    
    @inlinable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(_rawValue)
    }
}

extension LLVMValue: CustomReflectable {
    
    @inlinable
    public var customMirror: Mirror { Mirror(self, children: [:]) }
}
