import LLVMC

public class LLVMIntegerType: LLVMType {
    
    public let bitWidth: Int
    
    @inlinable
    public init(bitWidth: Int, in context: LLVMContext) {
        precondition(1...8388608 ~= bitWidth, "Expected a bit width between 1 and 8388608, but got \(bitWidth)")
        self.bitWidth = bitWidth
        super.init(_rawType: LLVMIntTypeInContext(context._rawContext, UInt32(bitWidth)), in: context)
    }
    
    @inlinable
    public override var customMirror: Mirror { Mirror(self, children: ["bitWidth": bitWidth]) }
}
