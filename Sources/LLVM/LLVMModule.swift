import SystemPackage
import LLVMC

public class LLVMModule {
    
    @usableFromInline
    internal let _rawModule: LLVMModuleRef
    
    @usableFromInline
    internal let _context: LLVMContext
    
    @inlinable
    public init(id: String, sourceFileName: String, in context: LLVMContext) {
        _rawModule = LLVMModuleCreateWithNameInContext(id, context._rawContext)
        _context = context
        var sourceFileName = sourceFileName
        sourceFileName.withUTF8 { buffer in
            LLVMSetSourceFileName(_rawModule, buffer.baseAddress, buffer.count)
        }
    }
    
    @inlinable
    deinit {
        LLVMDisposeModule(_rawModule)
    }
    
    @inlinable
    internal var _rawContext: LLVMContextRef { _context._rawContext }
}

extension LLVMModule: Equatable {
    
    @inlinable
    public static func == (lhs: LLVMModule, rhs: LLVMModule) -> Bool { lhs._rawModule == rhs._rawModule }
}

extension LLVMModule: Hashable {
    
    @inlinable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(_rawModule)
    }
}

extension LLVMModule: CustomReflectable {
    
    @inlinable
    public var customMirror: Mirror { Mirror(self, children: [:]) }
}
