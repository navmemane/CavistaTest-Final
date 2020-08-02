//
//  DataAPI.swift
//  CavistaTest
//
//  Created by apple on 01/08/20.
//  Copyright © 2020 Proximate. All rights reserved.
//

import Foundation
import Alamofire

class DataAPI : NSObject {
    
    private enum dataPath : String
    { case dataT }
    
    
    static func getData(urlString : String, completion: @escaping([DataType]) -> Void)   {
            
    let request = Alamofire.request(urlString)

        _ = request.response { (response) in

    guard let data = response.data else {return}
    do {
        let decoder = JSONDecoder()
        let dataT = try decoder.decode([DataType].self , from : data)
        completion(dataT)
        }
    catch let error {
        print (error)
        }
        
    }
    
 }
  
}

