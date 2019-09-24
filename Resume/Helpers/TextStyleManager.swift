//  Created by mgontar on 22/09/2019.

import UIKit

enum LabelStyle {
    case header
    case title
    case regular
}

enum FontSize: CGFloat {
    case huge = 26
    case large = 20
    case standard = 16
    case small = 14
}

enum FontWeight: String {
    case light = "Montserrat-Light"
    case regular = "Montserrat-Regular"
    case semibold = "Montserrat-SemiBold"
    case bold = "Montserrat-Bold"
}

extension UIFont {
    class func defaultFont(size: CGFloat, weight: FontWeight) -> UIFont {
        return UIFont(name: weight.rawValue, size: size)!
    }

    class func defaultFont(size: FontSize, weight: FontWeight) -> UIFont {
        return UIFont.defaultFont(size: size.rawValue, weight: weight)
    }
}

extension UILabel {
    func applyStyle(_ style: LabelStyle) {
        switch style {
        case .header:
            font = UIFont.defaultFont(size: .huge, weight: .bold)
        case .title:
            font = UIFont.defaultFont(size: .large, weight: .regular)
        case .regular:
            font = UIFont.defaultFont(size: .standard, weight: .regular)
        }
    }
}
