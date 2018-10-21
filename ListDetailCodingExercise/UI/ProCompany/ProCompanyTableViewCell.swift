import Foundation
import UIKit

class ProCompanyTableViewCell: UITableViewCell {
    static let reuseId = "proCompanyCell"

    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!

    func setCompanyData(_ company: ProCompanyViewModel) {
        companyNameLabel?.text = company.companyName
        ratingLabel?.text = company.formattedRating
        ratingLabel.textColor = company.ratingTextColor
    }
}
