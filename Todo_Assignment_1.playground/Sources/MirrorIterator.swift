import Foundation

public func iterate<C, R>(t: C, block: (String, Any) -> R) {
    let mirror = Mirror(reflecting: t)
    for case let (label?, value) in mirror.children {
        block(label, value)
    }
}
