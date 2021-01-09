//
//  Route.swift
//  LalaMove
//
//  Created by Issam Alshamlat on 1/4/21.
//

import Foundation

struct Route {
    var start: String
    var end: String
    
    init(_ dictionary: Dictionary<String, AnyObject>) {
        start = dictionary["start"] as! String
        end = dictionary["end"] as! String
    }
}
