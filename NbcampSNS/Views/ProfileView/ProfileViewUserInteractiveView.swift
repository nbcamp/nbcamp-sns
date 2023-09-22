import UIKit

final class ProfileViewUserInteractiveView: UIStackView {
    private lazy var followButton = {
        let followButton = UIButton()
        followButton.setTitle("Follow", for: .normal)
        followButton.setTitleColor(.white, for: .normal)
        followButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        followButton.backgroundColor = .systemBlue
        followButton.layer.cornerRadius = 4
        followButton.layer.masksToBounds = true
        followButton.snp.makeConstraints { make in
            make.width.equalTo(150)
        }
        return followButton
    }()

    private lazy var messageButton = {
        let messageButton = UIButton()
        messageButton.setTitle("Message", for: .normal)
        messageButton.setTitleColor(.label, for: .normal)
        messageButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        messageButton.backgroundColor = .systemBackground
        messageButton.layer.borderWidth = 2
        messageButton.layer.borderColor = UIColor.systemGray4.cgColor
        messageButton.layer.cornerRadius = 4
        messageButton.layer.masksToBounds = true
        messageButton.snp.makeConstraints { make in
            make.width.equalTo(150)
        }
        return messageButton
    }()

    private lazy var dropdownButton = {
        let dropdownButton = UIButton()
        dropdownButton.setImage(.init(systemName: "chevron.down"), for: .normal)
        dropdownButton.tintColor = .label
        dropdownButton.backgroundColor = .systemBackground
        dropdownButton.layer.borderWidth = 2
        dropdownButton.layer.borderColor = UIColor.systemGray4.cgColor
        dropdownButton.layer.cornerRadius = 4
        dropdownButton.layer.masksToBounds = true
        dropdownButton.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.width.equalTo(dropdownButton.snp.height)
        }
        return dropdownButton
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addArrangedSubview(followButton)
        addArrangedSubview(messageButton)
        addArrangedSubview(dropdownButton)
        dropdownButton.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        axis = .horizontal
        spacing = 8
        distribution = .fill
    }

    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
