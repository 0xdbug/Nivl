//
//  HomeViewModelSpec.swift
//  NivlTests
//
//  Created by dbug on 3/14/25.
//

import Foundation
import Quick
import Nimble
import RxSwift
@testable import Nivl
import RxTest

class HomeViewModelSpec: QuickSpec {
    override class func spec() {
        // searching with query should update items
        describe("searching") {
            var viewModel: HomeViewModel!
            var mockService: MockNasaService!
            var disposeBag: DisposeBag!
            var scheduler: TestScheduler!
            var observer: TestableObserver<[NivlItem]>!
            
            beforeEach {
                mockService = MockNasaService()
                viewModel = HomeViewModel()
                viewModel.nasaService = mockService
                
                disposeBag = DisposeBag()
                
                scheduler = TestScheduler(initialClock: 0)
                observer = scheduler.createObserver([NivlItem].self)
                
                viewModel.items.bind(to: observer).disposed(by: disposeBag)
            }
            
            context("with query") {
                it("should update items") {
                    let expected = NivlItem.sample
                    mockService.searchResult = .just(expected)
                    
                    viewModel.search(query: "mars")
                    expect(observer.events.last?.value.element).toEventually(equal(expected))
                }
            }
            
            // x
            // searching with empty query should not make API call
            xcontext("with empty query") {
                xit("should not make API call") {
                    viewModel.search(query: "")
                    expect(mockService.searchCalled).to(beFalse())
                }
            }
            
        }
    }
}

