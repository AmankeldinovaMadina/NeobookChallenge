import Foundation
import UIKit

enum SelectedCategory{
    
}

class SearchViewController: UIViewController, UISearchBarDelegate {
    
    var selectedCategoryIndex: Int = 0
    
    let searchBar = UISearchBar()
    let segmentedControl = UISegmentedControl(items: ["Все", "Фрукты", "Сухофрукты", "Овощи", "Зелень", "Чай кофе", "Молочные продукты"])
    let emptyStateImageView = UIImageView()
    let emptyStateLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        

    }

    private func setupUI() {
        // Navigation Bar Setup
        navigationItem.title = "Продукты"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Search Bar Setup
        searchBar.delegate = self
        searchBar.placeholder = "Быстрый поиск"
        searchBar.searchTextField.textColor = .white
        searchBar.showsCancelButton = true
        
        navigationItem.titleView = searchBar

        // Segmented Control Setup
        segmentedControl.selectedSegmentIndex = 1
        segmentedControl.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)

        // Layout Segmented Control
        view.addSubview(segmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])

        // Empty State Setup
        emptyStateImageView.image = UIImage(named: "empty") // Replace with your empty state image
        emptyStateImageView.contentMode = .scaleAspectFit

        emptyStateLabel.text = "Ничего не нашли"
        emptyStateLabel.textAlignment = .center
        emptyStateLabel.font = UIFont.systemFont(ofSize: 16)

        // Layout Empty State Views
        let stackView = UIStackView(arrangedSubviews: [emptyStateImageView, emptyStateLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            emptyStateImageView.heightAnchor.constraint(equalToConstant: 200) // Adjust height as necessary
        ])
    }

    @objc private func segmentChanged(_ sender: UISegmentedControl) {
        // Handle segment change
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder() // Dismiss the keyboard
    }
}
