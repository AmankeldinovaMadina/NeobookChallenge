import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabs()
        
    }
    
    private func setupTabs() {
        
        let main = self.createNav(with: "Главная", bigtitle: "Эко маркет", and:"home", vc: MainController())
        let basket = self.createNav(with: "Корзина", bigtitle: "Корзина", and: "bag", vc: BasketController())
        let history = self.createNav(with: "История", bigtitle: "История заказов", and: "clock", vc: HistoryController())
        let info = self.createNav(with: "Инфо", bigtitle: "Инфо", and: "info", vc: InfoController())
        
        self.setViewControllers([main, basket, history, info], animated: true)
    }
    
    private func createNav(with title: String, bigtitle: String, and image: String, vc: UIViewController) -> UINavigationController{
        let nav = UINavigationController(rootViewController: vc)
        
        let navigationBar = nav.navigationBar
           navigationBar.barTintColor = UIColor.white // Change the background color
           navigationBar.tintColor = UIColor.white // Change the bar button item color
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black] // Change the title color
        navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 24)]

        
           // Customize the navigation item (title) of the view controller
           vc.navigationItem.title = bigtitle
           
           // Customize the tab bar item
           nav.tabBarItem.title = title
           nav.tabBarItem.image = UIImage(named: image)
           
           return nav
    }
    

}

