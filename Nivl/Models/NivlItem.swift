//
//  NivlItem.swift
//  Nivl
//
//  Created by dbug on 2/18/25.
//

//{"collection":{"version":"1.1","href":"http://images-api.nasa.gov/search?q=iss026-s-001","items":[{"href":"https://images-assets.nasa.gov/image/iss026-s-001/collection.json","data":[{"center":"JSC","date_created":"2010-04-14T00:00:00Z","description":"ISS026-S-001 (June 2010) --- ","media_type":"image","nasa_id":"iss026-s-001","title":"iss026-s-001"}],"links":[{"href":"https://images-assets.nasa.gov/image/iss026-s-001/iss026-s-001~medium.jpg","rel":"alternate","render":"image","width":1280,"size":212000,"height":1256},{"href":"https://images-assets.nasa.gov/image/iss026-s-001/iss026-s-001~small.jpg","rel":"alternate","render":"image","width":640,"size":74000,"height":628},{"href":"https://images-assets.nasa.gov/image/iss026-s-001/iss026-s-001~thumb.jpg","rel":"preview","render":"image","width":640,"size":74000,"height":628},{"href":"https://images-assets.nasa.gov/image/iss026-s-001/iss026-s-001~large.jpg","rel":"alternate","render":"image","width":1920,"size":377000,"height":1884},{"href":"https://images-assets.nasa.gov/image/iss026-s-001/iss026-s-001~orig.jpg","rel":"canonical","render":"image","height":3926,"width":4000,"size":1525000}]}],"metadata":{"total_hits":1}}}


struct NivlItem {
    let headerImage: String
    let title: String
    
    static let sample: [NivlItem] = {
        let sam = NivlItem(headerImage: "https://play-lh.googleusercontent.com/1-hPxafOxdYpYZEOKzNIkSP43HXCNftVJVttoo4ucl7rsMASXW3Xr6GlXURCubE1tA=w3840-h2160-rw", title: "TitleGoogle")
        let sa = NivlItem(headerImage: "https://play-lh.googleusercontent.com/1-hPxafOxdYpYZEOKzNIkSP43HXCNftVJVttoo4ucl7rsMASXW3Xr6GlXURCubE1tA=w3840-h2160-rw", title: "TitleGoogle2")
        
        
        return [sam, sa, sam, sa, sam, sa, sam, sa, sam, sa, sam, sa]
    }()
    
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
    let render: String
    let width: Int
    let size: Int
    let height: Int
}
