//
//  BaseRequestManager.swift
//  LalaMove
//
//  Created by Issam Alshamlat on 1/4/21.
//

import Foundation
import Alamofire

typealias RequestResult = (_ success: Bool, _ responseObject: AnyObject?, _ error: NSError?) -> ()

class BaseRequestManager: NSObject {
    
    static func resolveRelativeURL(_ relativeURL: String) -> URLConvertible {
        let fullURLString = Constants.URLs.serverBaseURL + relativeURL
        
        return fullURLString as URLConvertible
    }
    
    static func defaultResponseAction(_ response: DataResponse<Any>, completionHandler: RequestResult?) {
        if completionHandler != nil {
            let statusCode = response.response?.statusCode
            
            
            if statusCode == 403 {
            } else {
            }
            if let code = statusCode {
                completionHandler!(code >= 200 && code < 300, response.result.value as AnyObject, response.result.error as NSError?)
            } else {
                completionHandler!(false, response.result.value as AnyObject, response.result.error as NSError?)
            }
        }
        
        handleErrors(response.response, error: response.result.error as NSError?)
    }
    
    fileprivate static func handleErrors(_ response: HTTPURLResponse?, error: NSError?) {
        var statusCode: Int = 0
        if response != nil {
            statusCode = response!.statusCode
        }
        
        if statusCode < 200 || statusCode >= 300 {
            
            var errorMessage: String
            
            if error != nil && error!.localizedDescription.count > 0 && error?.code == -1009 {
                errorMessage = error!.localizedDescription
            }
        }
    }
    
}

