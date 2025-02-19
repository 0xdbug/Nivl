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
    
    @IBOutlet weak var collectionView: MainCollectionView!
    private let viewModel = HomeViewModel()
    private let disposeBag = DisposeBag()
    
    private let throttleIntervalInMilliseconds = 100_000_0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchObserver()
        setupCollectionView()
    }
    
    func setupCollectionView() {
        viewModel.items
            .bind(to: collectionView
                .rx.items(cellIdentifier: NivlCollectionViewCell.id, cellType: NivlCollectionViewCell.self)) { row, item, cell in
                    Task {
                        await cell.configureWithItem(item: item)
                    }
                }
                .disposed(by: disposeBag)
    }
    
    func setupSearchObserver() {
        navigationItem.searchController?.searchBar.rx.text
            .observe(on: MainScheduler.asyncInstance)
            .distinctUntilChanged()
            .throttle(.microseconds(throttleIntervalInMilliseconds), scheduler: MainScheduler.instance)
            .subscribe(onNext: { [unowned self] text in
                viewModel.search(query: (text?.isEmpty == false) ? text! : "Supernova")
            })
            .disposed(by: disposeBag)
    }
    
}
