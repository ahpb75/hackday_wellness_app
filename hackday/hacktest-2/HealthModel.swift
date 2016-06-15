//
//  HealthModel.swift
//  hacktest-2
//
//  Created by Andrew Peth on 6/13/16.
//  Copyright © 2016 Andrew Peth. All rights reserved.
//

import Foundation

protocol HealthModelProtocal: class {
    func itemsDownloaded(items: NSArray)
}


class HealthModel: NSObject, NSURLSessionDataDelegate {
    
    //properties
    
    weak var delegate: HealthModelProtocal!
    
    var data : NSMutableData = NSMutableData()
    
    let urlPath: String = "http://localhost/service.php";

    func downloadItems() {
        
        let url: NSURL = NSURL(string: urlPath)!
        var session: NSURLSession!
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        
        
        session = NSURLSession(configuration: configuration, delegate: self, delegateQueue: nil)
        
        let task = session.dataTaskWithURL(url)
        
        task.resume()
        
    }
    
    func URLSession(session: NSURLSession, dataTask: NSURLSessionDataTask, didReceiveData data: NSData) {
        self.data.appendData(data);
        
    }
    
    func URLSession(session: NSURLSession, task: NSURLSessionTask, didCompleteWithError error: NSError?) {
        if error != nil {
            print("Failed to download data")
        }else {
            print("Data downloaded")
            self.parseJSON()
        }
        
    }
    
    
    func parseJSON() {
        
        var jsonResult: NSMutableArray = NSMutableArray()
        
        do{
            jsonResult = try NSJSONSerialization.JSONObjectWithData(self.data, options:NSJSONReadingOptions.AllowFragments) as! NSMutableArray
            
        } catch let error as NSError {
            print(error)
            
        }
        
        var jsonElement: NSDictionary = NSDictionary()
        let topics: NSMutableArray = NSMutableArray()
        
        for(var i = 0; i < jsonResult.count; i += 1)
        {
            
            jsonElement = jsonResult[i] as! NSDictionary
            
            let myTopic = TopicModel()
            
            //the following insures none of the JsonElement values are nil through optional binding
            if let id = jsonElement["id"] as? String,
                let topic = jsonElement["topic"] as? String,
                let details = jsonElement["details"] as? String,
                let date = jsonElement["date"] as? String
            {
                myTopic.id = id
                myTopic.topic = topic
                myTopic.details = details
                myTopic.date = date
              
                
                
                
            }
            
            topics.addObject(myTopic)
            
        }
        
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            
            self.delegate.itemsDownloaded(topics)
            
        })
    }
}