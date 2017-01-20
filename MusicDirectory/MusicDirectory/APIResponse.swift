//
//  APIResponse.swift
//  MusicDirectory
//
//  Created by Cory Graham on 1/19/17.
//  Copyright © 2017 Graham.co. All rights reserved.
//

import UIKit

class APIResponse: NSObject {
    var success : Bool!
    var errorCode : String!
    var message : String!
    var data : NSDictionary!
    
    func responseMessage()->String
    {
        return self.data.object(forKey: "message") as! String
    }
    
    func responseErrorCode()->String
    {
        return self.data.object(forKey: "errorCode") as! String
    }
    
    func jsonResouceArray()->NSArray
    {
        let myDict = data.object(forKey: "array") as! NSDictionary
        let myarray = myDict.object(forKey: "results") as! NSArray
        return myarray
    }
    
    func jsonResourceArrayString ()->String
    {
        let myDict = data.object(forKey: "array") as! NSDictionary
        let myString = "Test"
        return myString
    }
}
