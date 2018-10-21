import Foundation
import Moya

enum ProCompanyEndpoint {
    case get
}

extension ProCompanyEndpoint: TargetType {
    var headers: [String: String]? {
        return nil
    }

    // Should abstract out API urls to environment variables in xcconfig
    var baseURL: URL { return URL(string: "https://api.myjson.com/bins/")! }

    var path: String {
        switch self {
        case .get:
            return "172x7c"
        }
    }

    var method: Moya.Method {
        switch self {
        case .get:
            return .get
        }
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        switch self {
        case .get:
            return .requestPlain
        }
    }
}
