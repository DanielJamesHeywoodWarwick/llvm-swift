// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "llvm-swift",
    products: [.library(name: "LLVM", targets: ["LLVM"])],
    dependencies: [.package(url: "https://github.com/apple/swift-system", from: "1.0.0")],
    targets: [
        .target(
            name: "LLVM",
            dependencies: [.product(name: "SystemPackage", package: "swift-system"), "LLVMC"]
        ),
        .systemLibrary(name: "LLVMC", pkgConfig: "llvm", providers: [.brew(["llvm"])])
    ]
)
