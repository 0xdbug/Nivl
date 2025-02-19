//
//  NivlItem.swift
//  Nivl
//
//  Created by dbug on 2/18/25.
//

//{"collection":{"version":"1.1","href":"http://","items":[{"href":"https://","data":[{"center":"JSC","date_created":"2010","description":"ISS026-S-001 (June 2010) --- ","media_type":"image","nasa_id":"iss026-s-001","title":"iss026-s-001"}],"links":[{"href":"https://","rel":"alternate","render":"image","width":1280,"size":212000,"height":1256},{"href":"https://","rel":"alternate","render":"image","width":640,"size":74000,"height":628},{"href":"https://","rel":"preview","render":"image","width":640,"size":74000,"height":628},{"href":"https://","rel":"alternate","render":"image","width":1920,"size":377000,"height":1884},{"href":"https://","rel":"canonical","render":"image","height":3926,"width":4000,"size":1525000}]}],"metadata":{"total_hits":1}}}

import UIKit

struct NivlItem {
    let headerImage: String
    let date: String
    let title: String
    
    var headerImageURL: URL {
        URL(string: headerImage) ?? URL(string: "")!
    }
    
    static let sample: [NivlItem] = {
        let sam = NivlItem(headerImage: "https://nasa-api-explorer.vercel.app/_next/image?url=https%3A%2F%2Fimages-assets.nasa.gov%2Fimage%2FPIA22350%2FPIA22350~small.jpg&w=3840&q=75", date: "2025-03-4", title: "Kepler Beyond Planets: Finding Exploding Stars (Core Collapse Supernova)")
        let sa = NivlItem(headerImage: "https://nasa-api-explorer.vercel.app/_next/image?url=https%3A%2F%2Fimages-assets.nasa.gov%2Fimage%2FPIA06909%2FPIA06909~medium.jpg&w=3840&q=75", date: "2025-03-4", title: "Kepler Supernova Remnant: A View from Hubble Space Telescope")
        
        
        return [sam, sa, sam, sa, sam, sa, sam, sa, sam, sa, sam, sa]
    }()
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
