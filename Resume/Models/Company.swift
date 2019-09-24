//  Copyright © 2019 mgontar. All rights reserved.

import Foundation

final class Company {
    private(set) var name: String?
    private(set) var location: String?
    private(set) var jobTitles: [String]?
    private(set) var responsibilities: String?
    private(set) var projects: [Project]?

    init(name: String? = nil, location: String? = nil, jobTitles: [String]? = nil, responsibilities: String? = nil, projects: [Project]? = nil) {
        self.name = name
        self.location = location
        self.jobTitles = jobTitles
        self.responsibilities = responsibilities
        self.projects = projects
    }
}
