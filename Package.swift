// swift-tools-version: 6.3

import PackageDescription

let package = Package(
    name: "llvm-swift",
    products: [.library(name: "LLVM", targets: ["LLVM"])],
    targets: [
        .target(name: "LLVM", dependencies: ["LLVMC"]),
        .target(
            name: "LLVMC",
            cSettings: [
                .define("__STDC_CONSTANT_MACROS"),
                .define("__STDC_FORMAT_MACROS"),
                .define("__STDC_LIMIT_MACROS")
            ],
            linkerSettings: [.linkedLibrary("LLVM-22")]
        )
    ]
)
