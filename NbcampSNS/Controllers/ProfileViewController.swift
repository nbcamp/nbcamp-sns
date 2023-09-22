import UIKit

final class ProfileViewController: UIViewController {
    private lazy var topNavigationBar = {
        let topNavigationBar = ProfileViewTopNavigationBar()
        topNavigationBar.backButtonTapped = { [unowned self] in
            self.dismiss(animated: true)
        }
        return topNavigationBar
    }()

    private lazy var userProfileView = {
        let userProfileView = ProfileViewUserProfileView()
        return userProfileView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        initializeUI()
    }

    private func initializeUI() {
        view.backgroundColor = .systemBackground

        view.addSubview(topNavigationBar)
        topNavigationBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(16)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right).offset(-16)
        }

        view.addSubview(userProfileView)
        userProfileView.snp.makeConstraints { make in
            make.top.equalTo(topNavigationBar.snp.bottom).offset(32)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left).offset(16)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right).offset(-28)
        }
    }
}
