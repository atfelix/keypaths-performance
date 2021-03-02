// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "keypaths",
	dependencies: [
		.package(name: "Benchmark", url: "https://github.com/google/swift-benchmark", from: "0.1.0")
	],
	targets: [
		.target(
			name: "keypaths",
			dependencies: [
				.product(name: "Benchmark", package: "Benchmark")
			]
		),
		.testTarget(
			name: "keypathsTests",
			dependencies: ["keypaths"]
		)
	]
)
