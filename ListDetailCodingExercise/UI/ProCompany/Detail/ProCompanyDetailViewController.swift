import Foundation
import UIKit

class ProCompanyDetailViewController: UIViewController {
    var company: ProCompanyViewModel?

    @IBOutlet weak var companyNameLabel: UILabel?
    @IBOutlet weak var specialtyLabel: UILabel?
    @IBOutlet weak var ratingLabel: UILabel?

    @IBOutlet weak var locationLabel: UILabel?
    @IBOutlet weak var servicesLabel: UILabel?

    @IBOutlet weak var overviewTextView: UITextView?

    @IBOutlet weak var stackView: UIStackView?

    private lazy var emailButton: CallToActionButton = {
        let emailButton = CallToActionButton()
        emailButton.setTitle("EMAIL", for: .normal)
        emailButton.delegate = self
        return emailButton
    }()

    private lazy var callButton: CallToActionButton = {
        let callButton = CallToActionButton()
        callButton.setTitle("CALL", for: .normal)
        callButton.delegate = self
        return callButton
    }()

    override func viewDidLoad() {
        self.title = "Details"
        companyNameLabel?.text = company?.companyName
        specialtyLabel?.text = company?.specialty
        ratingLabel?.text = company?.formattedRating
        locationLabel?.text = company?.primaryLocation
        servicesLabel?.text = company?.servicesOffered
        overviewTextView?.text = company?.companyOverview

        stackView?.addArrangedSubview(callButton)
        stackView?.addArrangedSubview(emailButton)
    }

    override func viewDidLayoutSubviews() {
        overviewTextView?.setContentOffset(.zero, animated: false)
    }
}

extension ProCompanyDetailViewController: CallToActionButtonDelegate {
    func callToActionButtonClicked(_ button: CallToActionButton) {
        guard let company = company else { return }

        if button == callButton {
            print("phone = <\(company.phoneNumber)>")
        } else if button == emailButton {
            print("email = <\(company.email)>")
        }
    }
}
