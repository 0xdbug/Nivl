//
//  AppCoordinator.swift
//  Nivl
//
//  Created by dbug on 2/18/25.
//

import UIKit

class AppCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController : UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Functions
    func start() {
        let home = HomeViewController.instantiate()
        home.coordinator = self
        
        let searchController = UISearchController()
        navigationController.navigationItem.searchController = searchController
        
        home.title = "Nivl"
        home.navigationItem.searchController = searchController
        
        navigationController.pushViewController(home, animated: true)
    }
    
    func viewDetail() {
        let detail = DetailViewController.instantiate()
        navigationController.pushViewController(detail, animated: true)
    }
    
}
