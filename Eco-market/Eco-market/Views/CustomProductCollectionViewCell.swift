import UIKit

class CustomProductCollectionViewCell: UICollectionViewCell {
   static let identifier = "CustomProductCollectionViewCell"
    
    private let image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(systemName: "questionmark")
        image.tintColor = .white
        image.clipsToBounds = true
        return image
    }()
    
//    internal let description: UILabel = {
//        let description = UILabel()
//        description.textColor = UIColor.black
//        description.numberOfLines = 0
//        
//    }()
    
    private let price: UILabel = {
        let price = UILabel()
        price.textColor = UIColor(red: 0.459, green: 0.859, blue: 0.106, alpha: 1)
        price.font = UIFont(name: "SFPro-Bold", size: 20)
        
        return price
    }()
    
    private let buttonAdd: UIButton = {
        let buttonAdd = UIButton()
        return buttonAdd
    }()
    
}
