import Foundation
import UIKit

enum ApplicationColor {
    case callToAction
}

extension ApplicationColor {
    var value: UIColor {
        var instanceColor: UIColor?

        switch self {
        case .callToAction:
            instanceColor = UIColor(named: "callToAction")
        }
        return instanceColor ?? .black
    }
}
