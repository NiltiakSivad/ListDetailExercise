import Foundation
import UIKit
import Moya

class BaseService {
    let decoder = JSONDecoder()
    let encoder = JSONEncoder()

    init() {
        decoder.dateDecodingStrategy = .iso8601
    }
}
