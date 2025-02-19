//
//  NasaService.swift
//  Nivl
//
//  Created by dbug on 2/19/25.
//

import UIKit
import RxSwift

struct NasaAPI {
    static let baseURLString = "https://images-api.nasa.gov"
    static let searchEndPoint = "/search?q="
}


enum APIError: Error {
    case failure
}

class NasaService {
    private static let jsonDecoder = JSONDecoder()
    
    // i think i did good. for now
    static func search(searchText: String) -> Observable<[NivlItem]> {
        guard let query = searchText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: NasaAPI.baseURLString + NasaAPI.searchEndPoint + query) else {
            return Observable.error(APIError.failure) // meh
        }
        
        return URLSession.shared.rx.data(request: URLRequest(url: url))
            .map { data -> NasaResponse in
                try jsonDecoder.decode(NasaResponse.self, from: data)
            }
            .map { response -> [NivlItem] in
                response.collection.items.compactMap { item -> NivlItem? in
                    guard let data = item.data.first,
                            let imageLink = item.links.first(where: { $0.render == "image" })?.href else {
                        return nil
                    }
                    return NivlItem(headerImage: imageLink, date: data.dateCreated, title: data.title)
                }
            }
            .catch { error in
                return Observable.error(error)
            }
    }
}
