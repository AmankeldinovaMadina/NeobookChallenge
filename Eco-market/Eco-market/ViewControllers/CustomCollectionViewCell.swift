
import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

  static let identifier = "CustomCollectionViewCell"
    
    private let myImageView: UIImageView = {
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


    
    public func configure(with image: UIImage) {
        self.myImageView.image = image
        self.setupUI()
    }
    
    private func setupUI() {
        self.backgroundColor = .systemRed
        
        self.addSubview(myImageView)
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            myImageView.topAnchor.constraint(equalTo: self.topAnchor),
            myImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            myImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            myImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        layer.addSublayer(gradientLayer)
        gradientLayer.frame = bounds
        
        addSubview(textLabel)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            textLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }

    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.myImageView.image = nil
        textLabel.text = nil
    }
}
