//  Copyright © 2019 mgontar. All rights reserved.

import Foundation

final class Project {
    private(set) var name: String?
    private(set) var scopes: [String]?
    private(set) var tech: [String]?

    init(name: String? = nil, scopes: [String]? = nil, tech: [String]? = nil) {
        self.name = name
        self.scopes = scopes
        self.tech = tech
    }
}
