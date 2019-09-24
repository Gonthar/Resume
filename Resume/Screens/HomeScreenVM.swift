//  Copyright © 2019 mgontar. All rights reserved.

import UIKit
import RxCocoa
import RxSwift

class HomeScreenVM: ViewModelForViewController {
    var disposeBag: DisposeBag = DisposeBag()
    lazy var personalData: BehaviorRelay<PersonalData> = BehaviorRelay<PersonalData>(value: self.getMockValues())
    lazy var personalPhoto: BehaviorRelay<UIImage> = BehaviorRelay<UIImage>(value: self.getMockPhoto())

    init() {}

    func viewController() -> UIViewController {
        return HomeScreenVC(viewModel: self)
    }

    private func getMockValues() -> PersonalData {
        return PersonalData(
            name: "Maciej Gontar",
            jobTitles: ["iOS Developer", "Mobile Team Lead"]
        )
    }

    private func getMockPhoto() -> UIImage {
        return UIImage(imageLiteralResourceName: "personal_photo")
    }
}
