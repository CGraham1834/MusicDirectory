//
//  APIVersionOne.swift
//  MusicDirectory
//
//  Created by Cory Graham on 1/19/17.
//  Copyright © 2017 Graham.co. All rights reserved.
//

import UIKit

class APIVersionOne: NSObject, URLSessionDelegate
{
    func getMusicInformation( searchTerm : String, caller : AnyObject, selector : Selector)
    {
        let myChangedSearch =  searchTerm.replace(target: " ", withString: "+")
        let url = URL(string: "https://itunes.apple.com/search?term=" + myChangedSearch)
        let request : NSMutableURLRequest = NSMutableURLRequest.init(url: url!)
        request.httpMethod = "GET"
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!)
        {
            data, response, error in
            
            if (error == nil)
            {
                let result : APIResponse = self.createResultsFromData(data: data!)
            
            
            if(!result.success)
            {
                print("Request - Failed :%", result.message)
            }
            
            _ = caller.perform(selector, with: result)
            }
            
            else
            {
                print("Error communicating with server")
            }
            print("Task Completed")
        }
        task.resume()
    }
    
    func getLyrics(artistName : String, songName : String, caller : AnyObject, selector : Selector)
    {
        let myString = String(format: "https://lyrics.wikia.com/api.php?func=getSong&artist=%@&song=%@&fmt=json", arguments: [artistName, songName])
        let url = URL(string: myString)
        let request : NSMutableURLRequest = NSMutableURLRequest.init(url: url!)
        request.httpMethod = "GET"
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!)
        {
            data, response, error in
            
            if (error == nil)
            {
                let result : APIResponse = self.createResultsFromData(data: data!)
                
                
                if(!result.success)
                {
                    print("Request - Failed :%", result.message)
                }
                
                _ = caller.perform(selector, with: result)
            }
                
            else
            {
                print("Error communicating with server")
            }
            print("Task Completed")
        }
        task.resume()

    }
    
    func createResultsFromData(data : Data)->APIResponse
    {
        let result = APIResponse()
        result.success = false
        let urlContentData : Data? = data
        if urlContentData != nil
        {
            do {
                let jsonResult = try JSONSerialization.jsonObject(with: (data as NSData) as Data, options: JSONSerialization.ReadingOptions.allowFragments)
                
                if(JSONSerialization.isValidJSONObject(jsonResult))
                {
                  
                    let dict = NSMutableDictionary()
                    dict.setValue(jsonResult, forKey: "array")
                    result.data = dict
                    result.success = true;
                }
            }
            catch
            {
                print("Error contacting server")
            }
            
        }
        return result
        
    }
    }
    



extension String
{
    func replace(target : String, withString : String)->String
    {
        return self.replacingOccurrences(of: target, with: withString, options:  NSString.CompareOptions.literal, range:nil)
    }
}
