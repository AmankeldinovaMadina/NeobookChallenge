
import UIKit

class CustomCategoryCollectionViewCell: UICollectionViewCell {

  static let identifier = "CustomCollectionViewCell"
    
    private let button: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.backgroundColor = .clear
            return button
        }()
    
    public let myImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(systemName: "questionmark")
        iv.tintColor = .white
        iv.clipsToBounds = true
        return iv
        
    }()
    
    private let gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.withAlphaComponent(0.7).cgColor]
        gradientLayer.locations = [0.0, 1.0]
        return gradientLayer
    }()

    private let textLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = UIFont(name: "SFPro-Bold", size: 20)
        return label
    }()


    
    public func configure(with url: URL) {
        self.myImageView.kf.setImage(with: url)
        self.setupUI()
    }
    
    private func setupUI() {
        self.addSubview(myImageView)
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            myImageView.topAnchor.constraint(equalTo: self.topAnchor),
            myImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            myImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            myImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
    }

    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.myImageView.image = nil
        textLabel.text = nil
    }
    
}
