//
//  HomeViewModel.swift
//  Nivl
//
//  Created by dbug on 2/18/25.
//

import RxSwift
import RxCocoa

protocol NasaServiceProtocol {
    func search(searchText: String) -> Observable<[NivlItem]>
}

extension NasaService: NasaServiceProtocol {}

class HomeViewModel {
    var nasaService: NasaServiceProtocol = NasaService()
    
    private let disposeBag = DisposeBag()
    let items = BehaviorRelay<[NivlItem]>(value: [])
    
    func search(query: String) {
        guard !query.isEmpty else {
            return
        }
        nasaService.search(searchText: query)
            .observe(on: MainScheduler.instance)
            .subscribe(
                onNext: { [weak self] items in
                    print(items)
                    self?.items.accept(items)
                },
                onError: { [weak self] error in
                    print("\(error)")
                    self?.items.accept([])
                }
            )
            .disposed(by: disposeBag)
    }
}
