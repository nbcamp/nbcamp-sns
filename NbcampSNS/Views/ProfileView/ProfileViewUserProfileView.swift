import UIKit

final class ProfileViewUserProfileView: UIStackView {
    private lazy var userProfileImageView = {
        let userProfileImageView = UIImageView()
        userProfileImageView.image = .init(named: "userpic")
        userProfileImageView.frame.size = .init(width: 88, height: 88)
        return userProfileImageView
    }()

    private lazy var statusHStackView = {
        let statusHStackView = UIStackView(arrangedSubviews: [
            (7, "post"), (0, "follower"), (3, "following"),
        ].map { value, labelText in
            let valueLabel = UILabel()
            let nameLabel = UILabel()
            valueLabel.text = "\(value)"
            valueLabel.textAlignment = .center
            valueLabel.font = .systemFont(ofSize: 16, weight: .bold)
            nameLabel.text = labelText
            nameLabel.textAlignment = .center
            nameLabel.font = .systemFont(ofSize: 14)
            let vStackView = UIStackView(arrangedSubviews: [
                valueLabel, nameLabel,
            ])
            vStackView.axis = .vertical
            vStackView.spacing = 2
            return vStackView
        })

        statusHStackView.axis = .horizontal
        statusHStackView.alignment = .center
        statusHStackView.distribution = .fillEqually
        return statusHStackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addArrangedSubview(userProfileImageView)
        addArrangedSubview(statusHStackView)
        userProfileImageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        spacing = 40
    }

    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
