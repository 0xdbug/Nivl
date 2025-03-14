//
//  NivlItem.swift
//  Nivl
//
//  Created by dbug on 2/18/25.
//

//{"collection":{"version":"1.1","href":"http://","items":[{"href":"https://","data":[{"center":"JSC","date_created":"2010","description":"ISS026-S-001 (June 2010) --- ","media_type":"image","nasa_id":"iss026-s-001","title":"iss026-s-001"}],"links":[{"href":"https://","rel":"alternate","render":"image","width":1280,"size":212000,"height":1256},{"href":"https://","rel":"alternate","render":"image","width":640,"size":74000,"height":628},{"href":"https://","rel":"preview","render":"image","width":640,"size":74000,"height":628},{"href":"https://","rel":"alternate","render":"image","width":1920,"size":377000,"height":1884},{"href":"https://","rel":"canonical","render":"image","height":3926,"width":4000,"size":1525000}]}],"metadata":{"total_hits":1}}}


import UIKit

struct NivlItem: Identifiable, Equatable {
    let id = UUID()
    let headerImage: String
    let date: String
    let title: String
    let description: String
    let nasaId: String
    let photographer: String?
    
    var headerImageURL: URL {
        URL(string: headerImage) ?? URL(string: "")!
    }
    
    init(headerImage: String, date: String, title: String, description: String, nasaId: String, photographer: String? = nil) {
        self.headerImage = headerImage
        self.date = date
        self.title = title
        self.description = description
        self.nasaId = nasaId
        self.photographer = photographer
    }
    
    static let sample: [NivlItem] = [
        NivlItem(
            headerImage: "https://images-assets.nasa.gov/image/jsc2007e093444/jsc2007e093444~large.jpg",
            date: "2007-10-26",
            title: "STS-120 Flight Controllers on console during mission",
            description: "Astronauts Steve Swanson and Kevin Ford at the CAPCOM console during spacewalk operations.",
            nasaId: "jsc2007e093444",
            photographer: "Sowa"
        ),
        NivlItem(
            headerImage: "https://images-assets.nasa.gov/image/PIA22350/PIA22350~large.jpg",
            date: "2023-03-15",
            title: "Galaxy Cluster Abell 2261",
            description: "Hubble image of massive galaxy cluster acting as gravitational lens.",
            nasaId: "PIA22350"
        )
    ]
}
struct NasaResponse: Codable {
    let collection: Collection
}

struct Collection: Codable {
    let version: String
    let href: String
    let items: [Items]

}

struct Items: Codable {
    let href: String
    let data: [Data]
    let links: [Links]
}

struct Data: Codable {
    let center: String
    let dateCreated: String
    let description: String
    let mediaType: String
    let nasaId: String
    let title: String
    
    enum CodingKeys: String, CodingKey {
        case center
        case dateCreated = "date_created"
        case description
        case mediaType = "media_type"
        case nasaId = "nasa_id"
        case title
    }
}

struct Links: Codable {
    let href: String
    let rel: String
    var render: String?
    var width: Int?
    var size: Int?
    var height: Int?
}
