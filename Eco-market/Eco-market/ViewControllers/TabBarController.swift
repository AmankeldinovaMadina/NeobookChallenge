//
//  ViewController.swift
//  Eco-market
//
//  Created by Madina Amankeldinova on 15.12.2023.
//

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
        
        nav.tabBarItem.title = title
        nav.tabBarItem.image = UIImage(named: image)
        
        
        nav.navigationItem.title = bigtitle
        
        
        return nav
    }
    

}

