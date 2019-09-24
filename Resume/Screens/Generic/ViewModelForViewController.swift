//  Created by mgontar on 22/09/2019.

import RxCocoa
import RxSwift

protocol ViewModelForViewController: class {
    var disposeBag: DisposeBag { get }
    func viewController() -> UIViewController
}
