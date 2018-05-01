//
//  Model.swift
//  TabBarMVVM
//
//  Created by Eladio Alvarez Valle on 2/26/18.
//  Copyright © 2018 Eladio Alvarez Valle. All rights reserved.
//

import Foundation

protocol MainObjectProtocol : Codable {
    var name : String {get set}
    var description : String {get set}
    var details : String {get set} //mainObjectDetail {get set}
}

protocol MainObjectDetailProtocol {
    var detail : String {get set}
}

struct MainObject : MainObjectProtocol {
    
    var name : String
    var description: String
    var details: String //mainObjectDetail
    
    init(name : String, description : String, details : String /*mainObjectDetail*/) {
        
        self.name = name
        self.description = description
        self.details = details
    }
    
}

extension MainObject : Encodable {
    
    enum CodingKeys : String, CodingKey {
        case name
        case description
        case detail
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(description, forKey: .description)
        try container.encode(/*details.detail*/ details, forKey: .detail)
    }
}

extension MainObject : Decodable {
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        description = try container.decode(String.self, forKey: .description)
        //let details_ = try values.decode(String.self, forKey: .details)
        details = try container.decode(String.self, forKey: .detail) //mainObjectDetail(detail: details_)
        
    }
}

struct MainObjectDetail : MainObjectDetailProtocol {
    
    var detail: String
    
    init(detail : String) {
        
        self.detail = detail
    }
}

/// Extend Book Class
/*
extension mainObject : Codable {
    
    enum CodingKeys : String, CodingKey {
        
        case name
        case description = "id"
        case details
    }
    
    
}
 */




