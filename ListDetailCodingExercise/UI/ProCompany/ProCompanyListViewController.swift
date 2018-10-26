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
        guard let companies = companies, companies.keys.count > indexPath.section else { return }
        let key = companies.keys[indexPath.section]
        if let companies = companies.companiesDict[key] {
            guard companies.count > indexPath.row else { return }
            detailViewController.company = companies[indexPath.row]
            navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}

extension ProCompanyListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return companies?.keys[section]
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return companies?.keys.count ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let companies = companies, companies.keys.count > section else { return 0 }

        let key = companies.keys[section]
        return companies.companiesDict[key]?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let defaultCell = UITableViewCell()
        guard let companies = companies, companies.keys.count > indexPath.section else { return defaultCell }

        if let cell = tableView.dequeueReusableCell(withIdentifier: ProCompanyTableViewCell.reuseId)
            as? ProCompanyTableViewCell {
            let key = companies.keys[indexPath.section]

            guard let companies = companies.companiesDict[key], companies.count > indexPath.row else { return defaultCell }
            cell.setCompanyData(companies[indexPath.row])
            return cell
        }
        return defaultCell
    }
}
