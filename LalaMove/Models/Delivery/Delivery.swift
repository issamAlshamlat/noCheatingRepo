//
//  Delivery.swift
//  LalaMove
//
//  Created by Issam Alshamlat on 1/4/21.
//

import Foundation
import UIKit

struct Delivery {
    var id: String
    var remarks: String
    var pickupTime: String
    var goodsPicture: String
    var deliveryFee: String
    var surcharge: String
    var route: Route
    var sender: Sender
    
    init(_ dictionary: Dictionary<String, AnyObject>) {
        id = dictionary["id"] as! String
        remarks = dictionary["remarks"] as! String
        pickupTime = dictionary["pickupTime"] as! String
        goodsPicture = dictionary["goodsPicture"] as! String
        deliveryFee = dictionary["deliveryFee"] as! String
        surcharge = dictionary["surcharge"] as! String
        route = Route (dictionary["route"] as? [String: AnyObject] ?? [:])
        sender = Sender (dictionary["sender"] as? [String: AnyObject] ?? [:])
        
    }
}
