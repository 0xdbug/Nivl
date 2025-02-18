//
//  ViewController.swift
//  Nivl
//
//  Created by dbug on 2/18/25.
//

import UIKit

class HomeViewController: UIViewController, Storyboarded {
    weak var coordinator: AppCoordinator?
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

