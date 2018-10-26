import Foundation

struct ProCompanyListViewModel {

    // Maybe use CompanySpecialityHashKey?
    var companiesDict: [String: [ProCompanyViewModel]]

    var keys: [String]

    init(companies: [ProCompany]) {
        self.keys = Array(Set(companies.map { company in
            return company.specialty
        }))

        let companies = companies.map { company in
            return ProCompanyViewModel(proCompany: company)
            }.sorted { (company1, company2) -> Bool in
                return company1.companyName < company2.companyName
        }

        self.companiesDict = [String: [ProCompanyViewModel]]()

        companies.forEach { company in
            if self.companiesDict[company.specialty] == nil {
                self.companiesDict[company.specialty] = [ProCompanyViewModel]()
                self.companiesDict[company.specialty]?.append(company)
            } else {
                self.companiesDict[company.specialty]?.append(company)
            }
        }
        self.keys.sort { (speciality1, speciality2) -> Bool in
            return speciality1 < speciality2
        }
    }
}
