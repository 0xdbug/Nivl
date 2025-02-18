//
//  ViewController.swift
//  Nivl
//
//  Created by dbug on 2/18/25.
//

import UIKit

class HomeViewController: UIViewController, Storyboarded {
    weak var coordinator: AppCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func viewDetail(_ sender: Any) {
        coordinator?.viewDetail()
    }
    
}

