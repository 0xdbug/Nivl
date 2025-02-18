//
//  Coordinator.swift
//  Nivl
//
//  Created by dbug on 2/18/25.
//

import UIKit

protocol Coordinator {
    var parentCoordinator: Coordinator? { get set }
    var children: [Coordinator] { get set }
    var navigationController : UINavigationController { get set }
    
    func start()
}
