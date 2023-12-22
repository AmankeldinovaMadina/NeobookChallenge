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
        let buttonCall = UIButton()
        buttonCall.setTitle("Позвонить", for: .normal)
        buttonCall.setImage(UIImage(named: "phone"), for: .normal)
        buttonCall.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        buttonCall.setTitleColor(.black, for: .normal)
        buttonCall.contentHorizontalAlignment = .center
        buttonCall.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        buttonCall.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        buttonCall.backgroundColor = .lightGray
        buttonCall.layer.cornerRadius = 10
        buttonCall.clipsToBounds = true
        buttonCall.frame = CGRect(x: 100, y: 100, width: 332, height: 54)
        buttonCall.addTarget(self, action: #selector(buttonCallTapped), for: .touchUpInside)
        buttonCall.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(buttonCall)

        let buttonWhatsapp = UIButton()
        buttonWhatsapp.setTitle("WhatsApp", for: .normal)
        buttonWhatsapp.addTarget(self, action: #selector(buttonWhatsAppTapped), for: .touchUpInside)
        buttonWhatsapp.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(buttonWhatsapp)

        let buttonInst = UIButton()
        buttonInst.setTitle("Instagram", for: .normal)
        buttonInst.addTarget(self, action: #selector(buttonInstTapped), for: .touchUpInside)
        buttonInst.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(buttonInst)

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

            buttonCall.topAnchor.constraint(equalTo: multiLineText.bottomAnchor, constant: 20),
            buttonCall.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),

            buttonWhatsapp.topAnchor.constraint(equalTo: buttonCall.topAnchor),
            buttonWhatsapp.leadingAnchor.constraint(equalTo: buttonCall.trailingAnchor, constant: 16),

            buttonInst.topAnchor.constraint(equalTo: buttonCall.topAnchor),
            buttonInst.leadingAnchor.constraint(equalTo: buttonWhatsapp.trailingAnchor, constant: 16),
        ])

        // Adjust the content size of the scroll view to fit the contentView
        scrollView.contentSize = contentView.bounds.size
    }

    @objc func buttonCallTapped() {
        let phoneNumber = "+77007007070"
                if let phoneCallURL = URL(string: "tel://\(phoneNumber)"),
                   UIApplication.shared.canOpenURL(phoneCallURL) {
                    UIApplication.shared.open(phoneCallURL, options: [:], completionHandler: nil)
                } else {
                    //
                }
    }

    @objc func buttonWhatsAppTapped() {
        if let whatsApp = URL(string: "https://wa.link/b6p98d"),
           UIApplication.shared.canOpenURL(whatsApp){
            UIApplication.shared.open(whatsApp, options: [:], completionHandler: nil)
        } else {
            //
        }
    }

    @objc func buttonInstTapped() {
        if let instURL = URL(string: "https://www.instagram.com/madina_amankeldinova?igsh=NmphcnczOXJ6ZGQ2&utm_source=qr"),
           UIApplication.shared.canOpenURL(instURL){
            UIApplication.shared.open(instURL, options: [:], completionHandler: nil)
        } else {
            //
        }
    }
}
