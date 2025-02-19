//
//  ViewController.swift
//  Nivl
//
//  Created by dbug on 2/18/25.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: UIViewController, Storyboarded {
    weak var coordinator: AppCoordinator?
    
    @IBOutlet weak var collectionView: UICollectionView!
    let sampleData = Observable.just(NivlItem.sample)
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
    }
    
    
    func setupCollectionView() {
        sampleData
            .bind(to: collectionView
                .rx.items(cellIdentifier: NivlCollectionViewCell.id, cellType: NivlCollectionViewCell.self)) { row, item, cell in
                    Task {
                        await cell.configureWithItem(item: item)
                    }
                }
                .disposed(by: disposeBag)
    }
    
}

