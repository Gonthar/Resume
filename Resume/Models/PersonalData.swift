//  Copyright © 2019 mgontar. All rights reserved.

import Foundation

final class PersonalData {
    private(set) var name: String?
    private(set) var jobTitles: [String]?

    init(name: String? = nil, jobTitles: [String]? = nil) {
        self.name = name
        self.jobTitles = jobTitles
    }
}
