import Foundation
import RxSwift
import MapKit

class ProCompanyRepository {
    let proCompanyService = ProCompanyService()

    func getProCompanies() -> Observable<ProCompanyListViewModel> {
        return proCompanyService.get().map { companies in
            return ProCompanyListViewModel(companies: companies)
        }
    }
}
