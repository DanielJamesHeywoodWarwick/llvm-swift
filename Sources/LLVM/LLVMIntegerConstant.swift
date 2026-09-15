import LLVMC

@frozen
public struct LLVMIntegerConstant: LLVMInteger, LLVMConstant {
    
    @usableFromInline
    internal let _rawValue: LLVMValueRef
    
    public let context: LLVMContext
    
    @inlinable
    public init(_ value: Bool, in context: LLVMContext) {
        self._rawValue = LLVMConstInt(LLVMInt1TypeInContext(context._rawContext), value ? 1 : 0, 0)
        self.context = context
    }
    
    @inlinable
    public init(_ value: Int8, in context: LLVMContext) {
        self._rawValue = LLVMConstInt(
            LLVMInt8TypeInContext(context._rawContext),
            UInt64(bitPattern: Int64(value)),
            0
        )
        self.context = context
    }
    
    @inlinable
    public init(_ value: Int16, in context: LLVMContext) {
        self._rawValue = LLVMConstInt(
            LLVMInt16TypeInContext(context._rawContext),
            UInt64(bitPattern: Int64(value)),
            0
        )
        self.context = context
    }
    
    @inlinable
    public init(_ value: Int32, in context: LLVMContext) {
        self._rawValue = LLVMConstInt(
            LLVMInt32TypeInContext(context._rawContext),
            UInt64(bitPattern: Int64(value)),
            0
        )
        self.context = context
    }
    
    @inlinable
    public init(_ value: Int64, in context: LLVMContext) {
        self._rawValue = LLVMConstInt(LLVMInt64TypeInContext(context._rawContext), UInt64(bitPattern: value), 0)
        self.context = context
    }
    
    @inlinable
    public init(_ value: UInt8, in context: LLVMContext) {
        self._rawValue = LLVMConstInt(LLVMInt8TypeInContext(context._rawContext), UInt64(value), 0)
        self.context = context
    }
    
    @inlinable
    public init(_ value: UInt16, in context: LLVMContext) {
        self._rawValue = LLVMConstInt(LLVMInt16TypeInContext(context._rawContext), UInt64(value), 0)
        self.context = context
    }
    
    @inlinable
    public init(_ value: UInt32, in context: LLVMContext) {
        self._rawValue = LLVMConstInt(LLVMInt32TypeInContext(context._rawContext), UInt64(value), 0)
        self.context = context
    }
    
    @inlinable
    public init(_ value: UInt64, in context: LLVMContext) {
        self._rawValue = LLVMConstInt(LLVMInt64TypeInContext(context._rawContext), value, 0)
        self.context = context
    }
    
    @inlinable
    public var opaqueInteger: LLVMOpaqueInteger { LLVMOpaqueInteger(_rawValue: _rawValue, in: context) }
    
    @inlinable
    public var opaqueConstant: LLVMOpaqueConstant { LLVMOpaqueConstant(_rawValue: _rawValue, in: context) }
    
    @inlinable
    public var opaqueFirstClassValue: LLVMOpaqueFirstClassValue {
        LLVMOpaqueFirstClassValue(_rawValue: _rawValue, in: context)
    }
}

extension LLVMIntegerConstant: Equatable {
    
    @inlinable
    public static func == (lhs: LLVMIntegerConstant, rhs: LLVMIntegerConstant) -> Bool {
        lhs._rawValue == rhs._rawValue
    }
}

extension LLVMIntegerConstant: Hashable {
    
    @inlinable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(_rawValue)
    }
}

extension LLVMIntegerConstant: CustomReflectable {
    
    @inlinable
    public var customMirror: Mirror { Mirror(self, children: [:]) }
}
