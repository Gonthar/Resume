//  Copyright © 2019 mgontar. All rights reserved.

import Foundation

public func methodNotImplemented(file: StaticString = #file, line _: UInt = #line, function: String = #function) -> Never {
    fatalError("`\(function)` has not been implemented in \(file)")
}
