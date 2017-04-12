// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "Leaderboard",
    dependencies: [    
    	.Package(url: "https://github.com/PerfectlySoft/Perfect-HTTPServer.git", majorVersion: 2),
    	.Package(url: "https://github.com/PerfectlySoft/Perfect-RequestLogger.git", majorVersion: 1),
    	.Package(url: "https://github.com/SwiftORM/SQLite-StORM.git", majorVersion: 1),
    ] 
)
