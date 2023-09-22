import UIKit

final class ProfileViewController: UIViewController {
    private lazy var topNavigationBar = {
        let topNavigationBar = ProfileViewTopNavigationBar()
        topNavigationBar.backButtonTapped = { [unowned self] in
            self.dismiss(animated: true)
        }
        return topNavigationBar
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        initializeUI()
    }

    private func initializeUI() {
        view.backgroundColor = .systemBackground

        view.addSubview(topNavigationBar)
        topNavigationBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right)
        }
    }
}
