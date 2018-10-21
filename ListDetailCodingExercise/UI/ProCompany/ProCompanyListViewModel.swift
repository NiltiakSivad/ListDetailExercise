import Foundation

struct ProCompanyListViewModel {
    var companies = [ProCompanyViewModel]()

    var count: Int {
        return companies.count
    }

    init(companies: [ProCompany]) {
        self.companies = companies.map { company in
            return ProCompanyViewModel(proCompany: company)
        }
        self.companies.sort { (company1, company2) -> Bool in
            return company1.companyName < company2.companyName
        }
    }

    func getCompany(at index: Int) -> ProCompanyViewModel? {
        if companies.count > index {
            return companies[index]
        }
        return nil
    }
}
