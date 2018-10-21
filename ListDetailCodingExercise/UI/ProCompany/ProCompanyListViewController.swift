import UIKit

class ProCompanyListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView?

    var presenter: ProCompanyListPresenter?

    var companies: ProCompanyListViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Pros"

        presenter = ProCompanyListPresenter(self)
        presenter?.loadProCompanies()

        tableView?.delegate = self
        tableView?.dataSource = self

        let nib = UINib(nibName: String(describing: ProCompanyTableViewCell.self), bundle: nil)
        tableView?.register(nib, forCellReuseIdentifier: ProCompanyTableViewCell.reuseId)

        tableView?.tableFooterView = UIView()  // Hides empty table view lines
    }
}

extension ProCompanyListViewController: ProCompanyViewable {
    func showProCompanies(_ companies: ProCompanyListViewModel) {
        self.companies = companies
        tableView?.reloadData()
    }
}

extension ProCompanyListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // I really *really* hate this, but in the interest of time, I did not implement the coordinator pattern
        let detailViewController = ProCompanyDetailViewController()
        detailViewController.company = companies?.getCompany(at: indexPath.row)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

extension ProCompanyListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let companies = companies else { return 0 }
        return companies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let defaultCell = UITableViewCell()
        guard let companies = companies else { return defaultCell }

        if let cell = tableView.dequeueReusableCell(withIdentifier: ProCompanyTableViewCell.reuseId)
            as? ProCompanyTableViewCell, let company = companies.getCompany(at: indexPath.row) {
            cell.setCompanyData(company)
            return cell
        }
        return defaultCell
    }
}
