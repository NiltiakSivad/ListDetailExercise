import Foundation
import RxSwift
import Moya

class ProCompanyService: BaseService {
    var provider: MoyaProvider<ProCompanyEndpoint>

    override init() {
        provider = MoyaProvider<ProCompanyEndpoint>()
        super.init()
    }

    func get() -> Observable<[ProCompany]> {
        return self.provider.rx.request(ProCompanyEndpoint.get)
            .map([ProCompany].self, using: self.decoder)
            .asObservable()
            .map { companies in
                return companies
        }
    }
}
