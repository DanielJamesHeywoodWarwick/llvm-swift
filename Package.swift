// swift-tools-version: 6.3

import PackageDescription

let package = Package(
    name: "llvm swift",
    targets: [
        .systemLibrary(
            name: "LLVMC",
            providers: [.apt(["llvm"]), .brew(["llvm"]), .yum(["llvm"])]
        )
    ]
)
