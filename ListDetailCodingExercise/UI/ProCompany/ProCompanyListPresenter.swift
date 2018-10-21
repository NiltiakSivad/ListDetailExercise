import Foundation
import RxSwift

class ProCompanyListPresenter {
    private let proCompanyRepository = ProCompanyRepository()
    private var view: ProCompanyViewable!
    private let disposeBag = DisposeBag()

    init(_ view: ProCompanyViewable) {
        self.view = view
    }

    func loadProCompanies() {
        proCompanyRepository.getProCompanies()
            .subscribe(onNext: { companies in
                self.view.showProCompanies(companies)
            }, onCompleted: {})
            .disposed(by: disposeBag)
    }
}
