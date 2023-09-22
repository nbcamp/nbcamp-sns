import UIKit

final class ProfileViewUserProfileView: UIStackView {
    private lazy var topHStackView = {
        let topHStackView = UIStackView(arrangedSubviews: [
            userProfileImageView, statusHStackView
        ])
        userProfileImageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        topHStackView.spacing = 40
        return topHStackView
    }()
    
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
    
    private lazy var userTextVStackView = {
        let userTextVStackView = UIStackView(arrangedSubviews: [
            usernameLabel, introduceLabel
        ])
        userTextVStackView.axis = .vertical
        return userTextVStackView
    }()
    
    private lazy var usernameLabel = {
        let usernameLabel = UILabel()
        usernameLabel.text = "르탄이"
        usernameLabel.font = .systemFont(ofSize: 14, weight: .bold)
        return usernameLabel
    }()

    private lazy var introduceLabel = {
        let introduceLabel = UILabel()
        introduceLabel.text = """
        iOS Developer 🍎
        spartacodingclub.kr
        """
        introduceLabel.numberOfLines = 0
        introduceLabel.font = .systemFont(ofSize: 14, weight: .regular)
        return introduceLabel
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addArrangedSubview(topHStackView)
        addArrangedSubview(userTextVStackView)
        axis = .vertical
        spacing = 16
    }

    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
