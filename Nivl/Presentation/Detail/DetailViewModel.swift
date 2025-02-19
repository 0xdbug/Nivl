//
//  DetailViewModel.swift
//  Nivl
//
//  Created by dbug on 2/18/25.
//

import RxSwift
import RxCocoa

class DetailViewModel {
    let item = BehaviorRelay<NivlItem>(value: .sample.first!)
    init(item: NivlItem) {
        self.item.accept(item)
    }
}
