//
//  MockNasaService.swift
//  NivlTests
//
//  Created by dbug on 3/14/25.
//

import Foundation
@testable import Nivl
import RxSwift

class MockNasaService: NasaServiceProtocol {
    var searchResult: Observable<[NivlItem]> = .just([])
    var searchCalled = false
    
    func search(searchText: String) -> Observable<[NivlItem]> {
        searchCalled = true
        return searchResult
    }
    
}
