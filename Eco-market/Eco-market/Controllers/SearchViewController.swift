import Foundation
import UIKit

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
        customizeBackButton()
    }

    private func setupUI() {
        // Navigation Bar Setup
        let searchViewTitle = UILabel()
        searchViewTitle.text = "Продукты"
        searchViewTitle.textColor = .black
        searchViewTitle.font = UIFont.boldSystemFont(ofSize: 18)
        
        navigationItem.titleView = searchViewTitle
        
        // Search Bar Setup
        searchBar.delegate = self
        searchBar.placeholder = "Быстрый поиск"
        searchBar.searchTextField.textColor = .black
        
        searchBar.showsCancelButton = false
        
        
        view.addSubview(searchBar)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])

        // Segmented Control Setup
        segmentedControl.selectedSegmentIndex = 1
        segmentedControl.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)

        // Layout Segmented Control
        view.addSubview(segmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])

        // Empty State Setup
        emptyStateImageView.image = UIImage(named: "empty")
        emptyStateImageView.contentMode = .scaleAspectFit

        emptyStateLabel.text = "Ничего не нашли"
        emptyStateLabel.textAlignment = .center
        emptyStateLabel.font = UIFont.systemFont(ofSize: 16)
        emptyStateLabel.textColor = UIColor(red: 0.673, green: 0.671, blue: 0.679, alpha: 1)

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
    
    private func customizeBackButton() {
            let backImage = UIImage(systemName: "chevron.left")?.withRenderingMode(.alwaysTemplate)
        
            let backButton = UIButton(type: .system)
            backButton.setImage(backImage, for: .normal)
            backButton.tintColor = .black
        
            backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
            backButton.sizeToFit()
            
            let backButtonItem = UIBarButtonItem(customView: backButton)
            navigationItem.leftBarButtonItem = backButtonItem
            
            navigationItem.backButtonTitle = ""
    }


    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func segmentChanged(_ sender: UISegmentedControl) {
        // Handle segment change
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder() // Dismiss the keyboard
    }
}
