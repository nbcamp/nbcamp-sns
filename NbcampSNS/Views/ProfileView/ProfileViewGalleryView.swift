import UIKit

final class ProfileViewGalleryView: UIStackView {
    var images: [UIImage?] = [
        .init(named: "picture"),
        .init(named: "picture-1"),
        .init(named: "picture-2"),
        .init(named: "picture-3"),
        .init(named: "picture-4"),
        .init(named: "picture-5"),
        .init(named: "picture-6"),
        .init(named: "picture"),
        .init(named: "picture-1"),
        .init(named: "picture-2"),
        .init(named: "picture-3"),
        .init(named: "picture-4"),
        .init(named: "picture-5"),
        .init(named: "picture-6"),
    ]

    private lazy var headerHStackView = {
        let headerHStackView = UIStackView(arrangedSubviews: [
            (UIImage(named: "grid"), active: true),
            (UIImage(named: ""), active: false),
            (UIImage(named: ""), active: false),
        ].map { image, active in
            let view = UIView()

            let imageView = UIImageView()
            imageView.image = image
            view.addSubview(imageView)
            imageView.snp.makeConstraints { make in
                make.center.equalTo(view)
            }

            if active {
                let bottomBorder = UIView()
                bottomBorder.backgroundColor = .label
                view.addSubview(bottomBorder)
                bottomBorder.snp.makeConstraints { make in
                    make.left.equalTo(view.snp.left)
                    make.right.equalTo(view.snp.right)
                    make.bottom.equalTo(view.snp.bottom)
                    make.height.equalTo(2)
                }
            }

            return view
        })
        headerHStackView.axis = .horizontal
        headerHStackView.distribution = .fillEqually
        headerHStackView.snp.makeConstraints { make in
            make.height.equalTo(44)
        }
        return headerHStackView
    }()

    private lazy var hDivider = {
        let hDivider = UIView()
        hDivider.backgroundColor = .label.withAlphaComponent(0.3)
        return hDivider
    }()

    private lazy var collectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addArrangedSubview(hDivider)
        hDivider.snp.makeConstraints { make in
            make.height.equalTo(1)
        }
        addArrangedSubview(headerHStackView)
        addArrangedSubview(collectionView)
        axis = .vertical
    }

    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProfileViewGalleryView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        let imageView = UIImageView()
        imageView.image = images[indexPath.item]
        cell.contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalTo(cell)
            make.left.equalTo(cell)
            make.right.equalTo(cell)
            make.bottom.equalTo(cell)
        }
        return cell
    }
}

extension ProfileViewGalleryView: UICollectionViewDelegate {}

extension ProfileViewGalleryView: UICollectionViewDelegateFlowLayout {
    private var columns: Int { 3 }
    private var gap: CGFloat { 2 }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let columnWidth = (collectionView.bounds.width - CGFloat(columns - 1) * gap) / CGFloat(columns)
        return .init(width: columnWidth, height: columnWidth)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        gap
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        gap
    }
}
