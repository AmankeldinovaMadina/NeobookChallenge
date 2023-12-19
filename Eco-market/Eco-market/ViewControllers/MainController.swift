
import Foundation
import UIKit


class MainController: UIViewController {
    
    
    private var images: [UIImage] = []
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        collectionView.contentInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        return collectionView
        
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
        
        
        for _ in 0...6{
            images.append(UIImage(named: "1")!)
            images.append(UIImage(named: "2")!)
            images.append(UIImage(named: "3")!)
            images.append(UIImage(named: "4")!)
            images.append(UIImage(named: "5")!)
            images.append(UIImage(named: "6")!)
        }

        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    private func setupUI() {
        self.view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
    }
    
}



extension MainController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.images.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell else {
            fatalError("failed to dequeque CustomCollectionViewCell in MainViewController.")
        }
            
            let image = self.images[indexPath.row]
            cell.configure(with: image)
    
        
            addGradientOverlay(to: cell.contentView)
            addText(to: cell.contentView, text: "hello")
            
            
            cell.layer.cornerRadius = 16
            cell.layer.masksToBounds = true
        
            return cell
        
    }
    
    
    private func addGradientOverlay(to view: UIView) {
    
            let gradientLayer = CAGradientLayer()
            
            gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.withAlphaComponent(0.7).cgColor]
            gradientLayer.locations = [0.0, 1.0]
            gradientLayer.frame = view.bounds
            view.layer.addSublayer(gradientLayer)
        }
    
    private func addText(to view: UIView, text cellTitle: String ) {
        let label = UILabel()
        
        label.text = cellTitle
        label.textColor = UIColor.white
        label.font = UIFont(name: "SFPro-Bold", size: 20)
        label.frame = CGRect(x: 16, y: view.bounds.height - 40, width: view.bounds.width - 32, height: 30)
        
        view.addSubview(label)
        
        
    }
        
}


extension MainController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = (self.view.frame.width/2.25)
        
        return CGSize(width: size, height: size)
    }
        //Vertical spacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 11
    }
    //Horizontal Spacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    

}
