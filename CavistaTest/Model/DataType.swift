//
//  DataType.swift
//  CavistaTest
//
//  Created by apple on 01/08/20.
//  Copyright © 2020 Proximate. All rights reserved.
//

import Foundation

struct DataType : Codable  {
    let id : String?
    let type : String?
    let date : String?
    let data : String?
    
    enum CodingKeys: String, CodingKey {
                   case id = "id"
                   case type = "type"
                   case date = "date"
                   case data = "data"
                  
           }
    init(from decoder : Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.type = try container.decode(String.self, forKey: .type)
        self.date = try container.decodeIfPresent(String.self, forKey: .date)
        self.data = try container.decodeIfPresent(String.self, forKey: .data)
    }
    
    
    
}


