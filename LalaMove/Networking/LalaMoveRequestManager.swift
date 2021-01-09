//
//  LalaMoveRequestManager.swift
//  LalaMove
//
//  Created by Issam Alshamlat on 1/4/21.
//

import Foundation
import Alamofire

class LalaMoveRequestManager : BaseRequestManager {
    
    static func getDeliveries(offset : Int , limit : Int , _ completionHandler: @escaping RequestResult) {
        Alamofire.request(super.resolveRelativeURL("/v2/deliveries" + "?offset=\(offset)" + "&limit=\(limit)"), method: .get, encoding: Alamofire.JSONEncoding.default).responseJSON { (response) in
            super.defaultResponseAction(response, completionHandler: completionHandler)
        }
    }
    
}
