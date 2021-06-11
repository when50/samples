//
//  Model.swift
//  MultipleFluttersIos
//
//  Created by oneko on 2021/6/5.
//

import Foundation
import ObjectMapper

class CategoryViewModel: NSObject, Mappable {
    var desc: [String: String]?
    var filters: [[String: Any]]?
    var books: [[String: Any]]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        desc <- map["desc"]
        filters <- map["filters"]
        books <- map["books"]
    }
}

class Response: NSObject, Mappable {
    var code: Int!
    var ts: UInt!
    var data: ResponsePayload?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        code <- map["code"]
        ts <- map["ts"]
        data <- map["data"]
    }
}

class ResponsePayload: NSObject, Mappable {
    var count: Int!
    var hasMore: Int!
    var list: [Book]?
    var modules: [Module]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        count <- map["count"]
        hasMore <- map["hasMore"]
        list <- map["list"]
        modules <- map["modules"]
    }
    
    
}

class Module: NSObject, Mappable {
    var title: String?
    var data: [StyleGroup]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        title <- map["title"]
        data <- map["data"]
    }
    
    
}

class StyleGroup: NSObject, Mappable {
    var style: Int!
    var items: [RecommendBook]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        style <- map["style"]
        items <- map["items"]
    }
    
    
}

class RecommendBook: NSObject, Mappable {
    var title: String?
    var cover: String?
    var intro: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        title <- map["title"]
        cover <- map["cover"]
        intro <- map["intro"]
    }
    
}

class Book: NSObject, Mappable {
    var cover: String?
    var name: String?
    var intro: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        cover <- map["cover"]
        name <- map["name"]
        intro <- map["intro"]
    }
    
    
}
