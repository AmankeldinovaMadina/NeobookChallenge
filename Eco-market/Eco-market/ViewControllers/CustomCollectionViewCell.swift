//
//  CustomCollectionViewCell.swift
//  Eco-market
//
//  Created by Madina Amankeldinova on 17.12.2023.
//

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
    }

    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.myImageView.image = nil
    }
}
