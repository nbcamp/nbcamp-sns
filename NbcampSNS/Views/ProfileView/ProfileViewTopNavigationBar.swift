import UIKit

final class ProfileViewTopNavigationBar: UIStackView {
    var backButtonTapped: (() -> Void)?

    private lazy var backButton = {
        let backButton = UIButton()
        backButton.setImage(.init(systemName: "chevron.left"), for: .normal)
        backButton.transform = .init(scaleX: 1.3, y: 1.3)
        backButton.tintColor = .label
        backButton.addTarget(self, action: #selector(_backButtonTapped), for: .touchUpInside)
        return backButton
    }()

    private lazy var titleLabel = {
        let titleLabel = UILabel()
        titleLabel.text = "nbcamp"
        titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
        titleLabel.textAlignment = .center
        return titleLabel
    }()

    private lazy var menuButton = {
        let menuButton = UIButton()
        menuButton.setImage(.init(named: "menu"), for: .normal)
        menuButton.tintColor = .label
        return menuButton
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addArrangedSubview(backButton)
        addArrangedSubview(titleLabel)
        addArrangedSubview(menuButton)
        backButton.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        titleLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
        menuButton.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        axis = .horizontal
        alignment = .center
        distribution = .fill
        isLayoutMarginsRelativeArrangement = true
        layoutMargins = .init(top: 16, left: 16, bottom: 16, right: 16)
    }

    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc private func _backButtonTapped() {
        backButtonTapped?()
    }
}
