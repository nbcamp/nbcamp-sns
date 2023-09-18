import SnapKit
import UIKit

final class ViewController: UIViewController {
    private lazy var label = {
        let label = UILabel()
        label.text = "Hello, World"
        label.sizeToFit()
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        initializeUI()
    }

    private func initializeUI() {
        view.backgroundColor = .systemBackground

        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalTo(view)
        }
    }
}
