import Foundation
import UIKit
import Kingfisher


class MainController: UIViewController {
    
    private var categories: [Category] = []
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(CustomCategoryCollectionViewCell.self, forCellWithReuseIdentifier: CustomCategoryCollectionViewCell.identifier)
        collectionView.contentInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        return collectionView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
        NetworkServiceCategory.shared.fetchData { category in
            switch category {
            case .success(let categories):
                self.categories = categories
                self.collectionView.reloadData()
                
            case .failure(let error):
                print("Error in fetching \(error)")
            }
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
        return self.categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCategoryCollectionViewCell.identifier, for: indexPath) as? CustomCategoryCollectionViewCell else {
            fatalError("failed to dequeque CustomCollectionViewCell in MainViewController.")
        }
            let category = self.categories[indexPath.row]
            let categoryTitle = category.name
            if let url = URL(string: category.image) {
                cell.configure(with: url)
            }
        
            addGradientOverlay(to: cell.contentView)
            addText(to: cell.contentView, text: categoryTitle)
        
            
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
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true

        // auto-layout instead of setting the frame directly
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)

        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -12),
        ])
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectedCategory = categories[indexPath.row]
        print("Category selected: \(selectedCategory.name)")
        
        let searchViewController = SearchViewController()
        let segmentIndex = segmentIndexForCategory(selectedCategory)
        searchViewController.selectedCategoryIndex = segmentIndex
        searchViewController.hidesBottomBarWhenPushed = true
        
        navigationController?.pushViewController(searchViewController, animated: true)
        
    }
    
    private func segmentIndexForCategory(_ category: Category) -> Int {
            switch category.name {
            case "Все":
                return 0
            case "Фрукты":
                return 1
            case "Сухофрукты":
                return 2
            case "Овощи":
                return 3
            default:
                return 0 // Default to the first segment if category is not found
            }
        
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

