import LLVMC

public class LLVMFunctionType: LLVMType {
    
    @inlinable
    public init(
        returnType: LLVMFirstClassType,
        parameterTypes: some Sequence<LLVMFirstClassType>,
        isVariableArgument: Bool = false,
        in context: LLVMContext
    ) {
        var rawParameterTypes = parameterTypes.map { type in type._rawType as LLVMTypeRef? }
        super.init(
            _rawType: rawParameterTypes.withUnsafeMutableBufferPointer { buffer in
                guard let parameterCount = UInt32(exactly: buffer.count) else {
                    preconditionFailure("Expected at most \(UInt32.max) parameters, but got \(buffer.count)")
                }
                return LLVMC.LLVMFunctionType(returnType._rawType, buffer.baseAddress, parameterCount, isVariableArgument ? 1 : 0)
            },
            in: context
        )
    }
}
