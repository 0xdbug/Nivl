//
//  HomeViewModel.swift
//  Nivl
//
//  Created by dbug on 2/18/25.
//

import RxSwift
import RxCocoa

class HomeViewModel {
    let items = BehaviorRelay<[NivlItem]>(value: [])
    
    func fetchItems() {
        //
        self.items.accept(NivlItem.sample)
    }
    
}
