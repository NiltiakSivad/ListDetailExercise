import Foundation
import UIKit

protocol CallToActionButtonDelegate: class {
    func callToActionButtonClicked(_ button: CallToActionButton)
}

class CallToActionButton: UIButton {
    weak var delegate: CallToActionButtonDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
        commonInit()
    }

    @objc func buttonClicked() {
        delegate?.callToActionButtonClicked(self)
    }

    private func commonInit() {
        self.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        self.titleLabel?.textColor = .white
        self.backgroundColor = ApplicationColor.callToAction.value
        self.addTarget(self, action: #selector(buttonClicked), for: UIControl.Event.touchDown)
    }
}
