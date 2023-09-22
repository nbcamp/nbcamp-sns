import SnapKit
import UIKit

final class ViewController: UIViewController {
    private lazy var button = {
        let button = UIButton()
        button.setTitle("ProfileViewController", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        initializeUI()
    }

    private func initializeUI() {
        view.backgroundColor = .systemBackground

        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.center.equalTo(view)
        }
    }
    
    @objc private func buttonTapped() {
        let vc = ProfileViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}
