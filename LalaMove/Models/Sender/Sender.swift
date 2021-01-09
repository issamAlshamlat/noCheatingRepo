//
//  Sender.swift
//  LalaMove
//
//  Created by Issam Alshamlat on 1/4/21.
//

import Foundation

struct Sender {
    var phone: String
    var name: String
    var email: String
    
    init(_ dictionary: Dictionary<String, AnyObject>) {
        phone = dictionary["phone"] as! String
        name = dictionary["name"] as! String
        email = dictionary["email"] as! String
    }
}
