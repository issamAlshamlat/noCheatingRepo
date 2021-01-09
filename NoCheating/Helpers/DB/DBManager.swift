//
//  DBManager.swift
//  LalaMove
//
//  Created by Issam Alshamlat on 1/9/21.
//

import Foundation
import FMDB

class DBManager: NSObject {
    static let shared: DBManager = DBManager()
    
    let databaseFileName = "lalaMoveDB.sqlite"
    var pathToDatabase: String!
    var database: FMDatabase!
    let field_DeliveryID = "deliveryID"
    let field_DeliveryRemark = "deliveryRemark"
    let field_DeliveryPickup = "deliveryPickup"
    let field_DeliveryPicture = "deliveryPic"
    let field_DeliveryFee = "deliveryFee"
    let field_DeliverySurcharge = "deliverySurcharge"
    let field_DeliveryRouteStart = "deliveryRouteStart"
    let field_DeliveryRouteEnd = "deliveryRouteEnd"
    let field_DeliverySenderPhone = "deliverySenderPhone"
    let field_DeliverySenderName = "deliverySenderName"
    let field_DeliverySenderEmail = "deliverySenderEmail"
    
    override init() {
        super.init()
        let documentsDirectory = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString) as String
        pathToDatabase = documentsDirectory.appending("/\(databaseFileName)")
    }
    
    func createDatabase() -> Bool {
        var created = false
        
        if !FileManager.default.fileExists(atPath: pathToDatabase) {
            database = FMDatabase(path: pathToDatabase!)
            
            if database != nil {
                // Open the database.
                if database.open() {
                    let createNotesTableQuery = "create table delivery (\(field_DeliveryID) text primary key not null, \(field_DeliveryRemark) text, \(field_DeliveryPickup) text, \(field_DeliveryPicture) text,\(field_DeliveryFee) text,\(field_DeliverySurcharge) text);"
                    
                    let createRouteTableQuerry = "create table route (\(field_DeliveryID) text primary key not null, \(field_DeliveryRouteStart) text,\(field_DeliveryRouteEnd) text);"
                    
                    let createSenderTableQuerry = "create table sender (\(field_DeliveryID) text primary key not null, \(field_DeliverySenderPhone) text,\(field_DeliverySenderEmail) text,\(field_DeliverySenderName) text);"
                    
                    do {
                        try database.executeUpdate(createNotesTableQuery , values: nil)
                        try database.executeUpdate(createRouteTableQuerry , values: nil)
                        try database.executeUpdate(createSenderTableQuerry , values: nil)
                        created = true
                    }
                    catch {
                        print("Could not create table.")
                        print(error.localizedDescription)
                    }
                    
                    // At the end close the database.
                    database.close()
                }
                else {
                    print("Could not open the database.")
                }
            }
        }
        
        return created
    }
    
    func openDatabase() -> Bool {
        if database == nil {
            if FileManager.default.fileExists(atPath: pathToDatabase) {
                database = FMDatabase(path: pathToDatabase)
            }
        }
        
        if database != nil {
            if database.open() {
                return true
            }
        }
        
        return false
    }
    
    func insertDeliveryData( delivery : [Delivery]) {
        if openDatabase() {
            for item in delivery {
                let deliveryTableQuery = "INSERT INTO delivery VALUES ('\(item.id)','\(item.remarks)','\(item.pickupTime)','\(item.goodsPicture)','\(item.deliveryFee)','\(item.surcharge)');"
                
                let deliveryRouteTableQuery = "INSERT INTO route VALUES ('\(item.id)','\(item.route.start)','\(item.route.end)');"
                
                let deliverySenderTableQuery = "INSERT INTO sender VALUES ('\(item.id)','\(item.sender.phone)','\(item.sender.email)','\(item.sender.name)');"
                
                if !database.executeStatements(deliveryTableQuery) {
                    print("Failed to insert delivery initial data into the database.")
                    print(database.lastError(), database.lastErrorMessage())
                }
                
                if !database.executeStatements(deliveryRouteTableQuery) {
                    print("Failed to insert route initial data into the database.")
                    print(database.lastError(), database.lastErrorMessage())
                }
                
                if !database.executeStatements(deliverySenderTableQuery) {
                    print("Failed to insert sender initial data into the database.")
                    print(database.lastError(), database.lastErrorMessage())
                }
                
            }
            
            database.close()
        }
    }
    
    func loadNotes() -> [Delivery] {
        var deliveryArray: [Delivery] = []
        
        if openDatabase() {
            let query = "SELECT * FROM delivery join route on delivery.deliveryID = route.deliveryID join sender on sender.deliveryID = route.deliveryID;"
            
            do {
                let results = try database.executeQuery(query, values: nil)
                while results.next() {
                    let deliveryId = results.string(forColumn: field_DeliveryID)!
                    let deliveryRemark = results.string(forColumn: field_DeliveryRemark)!
                    let deliveryPickup = results.string(forColumn: field_DeliveryPickup)!
                    let deliveryPicture = results.string(forColumn: field_DeliveryPicture)!
                    let deliveryFee = results.string(forColumn: field_DeliveryFee)!
                    let deliverySurcharge = results.string(forColumn: field_DeliverySurcharge)!
                       
                    let deliveryRouteStart = results.string(forColumn: field_DeliveryRouteStart)!
                    let deliveryRouteEnd = results.string(forColumn: field_DeliveryRouteEnd)!
                    
                    let deliverySenderPhone = results.string(forColumn: field_DeliverySenderPhone)!
                    let deliverySenderName = results.string(forColumn: field_DeliverySenderName)!
                    let deliverySenderEmail = results.string(forColumn: field_DeliverySenderEmail)!
                    
                    var deliveryDict = [String : AnyObject] ()
                    var routeDict = [String : AnyObject] ()
                    var senderDict = [String : AnyObject] ()
                    
                    routeDict["start"] = deliveryRouteStart as AnyObject
                    routeDict["end"] = deliveryRouteEnd as AnyObject
                    
                    senderDict["phone"] = deliverySenderPhone as AnyObject
                    senderDict["name"] = deliverySenderName as AnyObject
                    senderDict["email"] = deliverySenderEmail as AnyObject
                    
                    
                    
                    deliveryDict["id"] =  deliveryId as AnyObject
                    deliveryDict["remarks"] =  deliveryRemark as AnyObject
                    deliveryDict["pickupTime"] =  deliveryPickup as AnyObject
                    deliveryDict["goodsPicture"] =  deliveryPicture as AnyObject
                    deliveryDict["deliveryFee"] =  deliveryFee as AnyObject
                    deliveryDict["surcharge"] =  deliverySurcharge as AnyObject
                    deliveryDict["route"] =  routeDict as AnyObject
                    deliveryDict["sender"] =  senderDict as AnyObject
                    
                    
                    let delivery = Delivery (deliveryDict)
                    
                    
                    deliveryArray.append(delivery)
                }
            }
            catch {
                print(error.localizedDescription)
            }
            
            database.close()
        }
        
        return deliveryArray
    }
    
    
    
}

