import Foundation
import UIKit

class InfoController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupScrollView()
    }

    func setupScrollView() {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])

        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)

        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
        
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        
        // Add an image view
        let imageView = UIImageView(image: UIImage(named: "info-bg"))
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageView)

        // Add text label
        let textLabel = UILabel()
        textLabel.text = "Эко Маркет"
        textLabel.font = UIFont.boldSystemFont(ofSize: 24)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(textLabel)
        
        let multiLineText = UILabel()
        multiLineText.text = "Фрукты, овощи, зелень, сухофрукты а так же сделанные из натуральных ЭКО продуктов (варенье, салаты, соления, компоты и т.д.) можете заказать удобно, качественно и по доступной цене.Готовы сотрудничать взаимовыгодно с магазинами.Наши цены как на рынке. Мы заинтересованы в экономии ваших денег и времени. Стоимость доставки 150 сом и ещё добавлен для окраину города. При отказе подтвержденного заказа более 2-х раз Клиент заносится в чёрный список!!"
        multiLineText.font = UIFont.systemFont(ofSize: 16)
        multiLineText.textColor = UIColor(red: 0.673, green: 0.671, blue: 0.679, alpha: 1)
        multiLineText.translatesAutoresizingMaskIntoConstraints = false
        multiLineText.numberOfLines = 0
        contentView.addSubview(multiLineText)
        

        // Add three buttons
        let button1 = UIButton()
        button1.setTitle("Button 1", for: .normal)
        button1.addTarget(self, action: #selector(button1Tapped), for: .touchUpInside)
        button1.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(button1)

        let button2 = UIButton()
        button2.setTitle("Button 2", for: .normal)
        button2.addTarget(self, action: #selector(button2Tapped), for: .touchUpInside)
        button2.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(button2)

        let button3 = UIButton()
        button3.setTitle("Button 3", for: .normal)
        button3.addTarget(self, action: #selector(button3Tapped), for: .touchUpInside)
        button3.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(button3)

        // Add constraints for all elements within the contentView
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -statusBarHeight - 40),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 270), // Set the desired height for the image

            textLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            textLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            textLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            multiLineText.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 8),
            multiLineText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            multiLineText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

            button1.topAnchor.constraint(equalTo: multiLineText.bottomAnchor, constant: 20),
            button1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),

            button2.topAnchor.constraint(equalTo: button1.topAnchor),
            button2.leadingAnchor.constraint(equalTo: button1.trailingAnchor, constant: 16),

            button3.topAnchor.constraint(equalTo: button1.topAnchor),
            button3.leadingAnchor.constraint(equalTo: button2.trailingAnchor, constant: 16),
        ])

        // Adjust the content size of the scroll view to fit the contentView
        scrollView.contentSize = contentView.bounds.size
    }

    @objc func button1Tapped() {
        // Handle button 1 tap here
    }

    @objc func button2Tapped() {
        // Handle button 2 tap here
    }

    @objc func button3Tapped() {
        // Handle button 3 tap here
    }
}
