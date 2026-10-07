
/*
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

public struct LLVMOpaqueValue: LLVMValue {
    
    @usableFromInline
    internal let _rawValue: LLVMValueRef
    
    @usableFromInline
    internal let _context: LLVMContext
    
    @inlinable
    internal init(_rawValue: LLVMValueRef, in context: LLVMContext) {
        self._rawValue = _rawValue
        _context = context
    }
    
    @inlinable
    public var opaqueValue: LLVMOpaqueValue { self }
}

extension LLVMOpaqueValue: Equatable {
    
    @inlinable
    public static func == (lhs: LLVMOpaqueValue, rhs: LLVMOpaqueValue) -> Bool { lhs._rawValue == rhs._rawValue }
}

extension LLVMOpaqueValue: Hashable {
    
    @inlinable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(_rawValue)
    }
}

extension LLVMOpaqueValue: CustomReflectable {
    
    @inlinable
    public var customMirror: Mirror { Mirror(self, children: [:]) }
}

public protocol LLVMConstant: LLVMFirstClassValue {
    
    var opaqueConstant: LLVMOpaqueConstant { get }
}

extension LLVMConstant {
    
    @inlinable
    public var opaqueFirstClassValue: LLVMOpaqueFirstClassValue {
        LLVMOpaqueFirstClassValue(_rawValue: opaqueConstant._rawValue, in: opaqueConstant._context)
    }
}

public protocol LLVMFirstClassValue: LLVMValue {
    
    var opaqueFirstClassValue: LLVMOpaqueFirstClassValue { get }
}

extension LLVMFirstClassValue {
    
    @inlinable
    public var opaqueValue: LLVMOpaqueValue {
        LLVMOpaqueValue(_rawValue: opaqueFirstClassValue._rawValue, in: opaqueFirstClassValue._context)
    }
}

public struct LLVMFunction: LLVMValue {
    
    @usableFromInline
    internal let _rawValue: LLVMValueRef
    
    @usableFromInline
    internal let _module: LLVMModule
    
    @inlinable
    internal init(_rawValue: LLVMValueRef, in module: LLVMModule) {
        self._rawValue = _rawValue
        _module = module
    }
    
    @inlinable
    public func appendBasicBlock() -> LLVMBasicBlock {
        LLVMBasicBlock(_rawBlock: LLVMAppendBasicBlockInContext(_rawContext, _rawValue, ""), in: _module)
    }
    
    @inlinable
    public var opaqueValue: LLVMOpaqueValue { LLVMOpaqueValue(_rawValue: _rawValue, in: _context) }
}

extension LLVMFunction: Equatable {
    
    @inlinable
    public static func == (lhs: LLVMFunction, rhs: LLVMFunction) -> Bool { lhs._rawValue == rhs._rawValue }
}

extension LLVMFunction: Hashable {
    
    @inlinable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(_rawValue)
    }
}

extension LLVMFunction: CustomReflectable {
    
    @inlinable
    public var customMirror: Mirror { Mirror(self, children: [:]) }
}

public struct LLVMOpaqueInteger: LLVMInteger {
    
    @usableFromInline
    internal let _rawValue: LLVMValueRef
    
    @usableFromInline
    internal let _context: LLVMContext
    
    @inlinable
    internal init(_rawValue: LLVMValueRef, in context: LLVMContext) {
        self._rawValue = _rawValue
        _context = context
    }
    
    @inlinable
    public var opaqueInteger: LLVMOpaqueInteger { self }
}

extension LLVMOpaqueInteger: Equatable {
    
    @inlinable
    public static func == (lhs: LLVMOpaqueInteger, rhs: LLVMOpaqueInteger) -> Bool { lhs._rawValue == rhs._rawValue }
}

extension LLVMOpaqueInteger: Hashable {
    
    @inlinable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(_rawValue)
    }
}

extension LLVMOpaqueInteger: CustomReflectable {
    
    @inlinable
    public var customMirror: Mirror { Mirror(self, children: [:]) }
}

public struct LLVMOpaqueInstruction: LLVMInstruction {
    
    @usableFromInline
    internal let _rawValue: LLVMValueRef
    
    @usableFromInline
    internal let _context: LLVMContext
    
    @inlinable
    internal init(_rawValue: LLVMValueRef, in context: LLVMContext) {
        self._rawValue = _rawValue
        _context = context
    }
    
    @inlinable
    public var opaqueInstruction: LLVMOpaqueInstruction { self }
}

extension LLVMOpaqueInstruction: Equatable {
    
    @inlinable
    public static func == (lhs: LLVMOpaqueInstruction, rhs: LLVMOpaqueInstruction) -> Bool { lhs._rawValue == rhs._rawValue }
}

extension LLVMOpaqueInstruction: Hashable {
    
    @inlinable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(_rawValue)
    }
}

extension LLVMOpaqueInstruction: CustomReflectable {
    
    @inlinable
    public var customMirror: Mirror { Mirror(self, children: [:]) }
}

public struct LLVMOpaqueFirstClassValue: LLVMFirstClassValue {
    
    @usableFromInline
    internal let _rawValue: LLVMValueRef
    
    @usableFromInline
    internal let _context: LLVMContext
    
    @inlinable
    internal init(_rawValue: LLVMValueRef, in context: LLVMContext) {
        self._rawValue = _rawValue
        _context = context
    }
    
    @inlinable
    public var opaqueFirstClassValue: LLVMOpaqueFirstClassValue { self }
}

extension LLVMOpaqueFirstClassValue: Equatable {
    
    @inlinable
    public static func == (lhs: LLVMOpaqueFirstClassValue, rhs: LLVMOpaqueFirstClassValue) -> Bool {
        lhs._rawValue == rhs._rawValue
    }
}

extension LLVMOpaqueFirstClassValue: Hashable {
    
    @inlinable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(_rawValue)
    }
}

extension LLVMOpaqueFirstClassValue: CustomReflectable {
    
    @inlinable
    public var customMirror: Mirror { Mirror(self, children: [:]) }
}

public struct LLVMOpaqueConstant: LLVMConstant {
    
    @usableFromInline
    internal let _rawValue: LLVMValueRef
    
    @usableFromInline
    internal let _context: LLVMContext
    
    @inlinable
    internal init(_rawValue: LLVMValueRef, in context: LLVMContext) {
        self._rawValue = _rawValue
        _context = context
    }
    
    @inlinable
    public var opaqueConstant: LLVMOpaqueConstant { self }
}

extension LLVMOpaqueConstant: Equatable {
    
    @inlinable
    public static func == (lhs: LLVMOpaqueConstant, rhs: LLVMOpaqueConstant) -> Bool { lhs._rawValue == rhs._rawValue }
}

extension LLVMOpaqueConstant: Hashable {
    
    @inlinable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(_rawValue)
    }
}

extension LLVMOpaqueConstant: CustomReflectable {
    
    @inlinable
    public var customMirror: Mirror { Mirror(self, children: [:]) }
}

public struct LLVMIntegerConstant: LLVMInteger, LLVMConstant {
    
    @usableFromInline
    internal let _rawValue: LLVMValueRef
    
    @usableFromInline
    internal let _context: LLVMContext
    
    @inlinable
    public init(_ value: Bool, in context: LLVMContext) {
        _rawValue = LLVMConstInt(LLVMInt1TypeInContext(context._rawContext), value ? 1 : 0, 0)
        _context = context
    }
    
    @inlinable
    public init(_ value: Int8, in context: LLVMContext) {
        _rawValue = LLVMConstInt(LLVMInt8TypeInContext(context._rawContext), UInt64(bitPattern: Int64(value)), 0)
        _context = context
    }
    
    @inlinable
    public init(_ value: Int16, in context: LLVMContext) {
        _rawValue = LLVMConstInt(LLVMInt16TypeInContext(context._rawContext), UInt64(bitPattern: Int64(value)), 0)
        _context = context
    }
    
    @inlinable
    public init(_ value: Int32, in context: LLVMContext) {
        _rawValue = LLVMConstInt(LLVMInt32TypeInContext(context._rawContext), UInt64(bitPattern: Int64(value)), 0)
        _context = context
    }
    
    @inlinable
    public init(_ value: Int64, in context: LLVMContext) {
        _rawValue = LLVMConstInt(LLVMInt64TypeInContext(context._rawContext), UInt64(bitPattern: value), 0)
        _context = context
    }
    
    @inlinable
    public init(_ value: UInt8, in context: LLVMContext) {
        _rawValue = LLVMConstInt(LLVMInt8TypeInContext(context._rawContext), UInt64(value), 0)
        _context = context
    }
    
    @inlinable
    public init(_ value: UInt16, in context: LLVMContext) {
        _rawValue = LLVMConstInt(LLVMInt16TypeInContext(context._rawContext), UInt64(value), 0)
        _context = context
    }
    
    @inlinable
    public init(_ value: UInt32, in context: LLVMContext) {
        _rawValue = LLVMConstInt(LLVMInt32TypeInContext(context._rawContext), UInt64(value), 0)
        _context = context
    }
    
    @inlinable
    public init(_ value: UInt64, in context: LLVMContext) {
        _rawValue = LLVMConstInt(LLVMInt64TypeInContext(context._rawContext), value, 0)
        _context = context
    }
    
    @inlinable
    public var opaqueInteger: LLVMOpaqueInteger { LLVMOpaqueInteger(_rawValue: _rawValue, in: _context) }
    
    @inlinable
    public var opaqueConstant: LLVMOpaqueConstant { LLVMOpaqueConstant(_rawValue: _rawValue, in: _context) }
    
    @inlinable
    public var opaqueFirstClassValue: LLVMOpaqueFirstClassValue { LLVMOpaqueFirstClassValue(_rawValue: _rawValue, in: _context) }
}

extension LLVMIntegerConstant: Equatable {
    
    @inlinable
    public static func == (lhs: LLVMIntegerConstant, rhs: LLVMIntegerConstant) -> Bool { lhs._rawValue == rhs._rawValue }
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

public protocol LLVMInteger: LLVMFirstClassValue {
    
    var opaqueInteger: LLVMOpaqueInteger { get }
}

extension LLVMInteger {
    
    @inlinable
    public var opaqueFirstClassValue: LLVMOpaqueFirstClassValue {
        LLVMOpaqueFirstClassValue(_rawValue: opaqueInteger._rawValue, in: opaqueInteger._context)
    }
}

public protocol LLVMInstruction: LLVMValue {
    
    var opaqueInstruction: LLVMOpaqueInstruction { get }
}

extension LLVMInstruction {
    
    @inlinable
    public var opaqueValue: LLVMOpaqueValue {
        LLVMOpaqueValue(_rawValue: opaqueInstruction._rawValue, in: opaqueInstruction._context)
    }
}
*/
