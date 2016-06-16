//
//  HomeModel.swift
//  hacktest-2
//
//  Created by Andrew Peth on 6/15/16.
//  Copyright © 2016 Andrew Peth. All rights reserved.
//

import Foundation

protocol HomeModelProtocal: class {
    func itemsDownloaded(items: NSArray)
}


class HomeModel: NSObject, NSURLSessionDataDelegate {
    
    //properties
    
    weak var delegate: HomeModelProtocal!
    
    var data : NSMutableData = NSMutableData()
    
    let urlPath: String = "http://wellness-hackdaysf.rhcloud.com/site/profile_service.php";
    
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
        let profile: NSMutableArray = NSMutableArray()
        
        for(var i = 0; i < jsonResult.count; i += 1)
        {
            
            jsonElement = jsonResult[i] as! NSDictionary
            
            let myProfile = ProfileModel()
            
            //the following insures none of the JsonElement values are nil through optional binding
            if let fname = jsonElement["fname"] as? String,
                let total_steps = jsonElement["total_steps"] as? String,
                let total_flights = jsonElement["total_flights"] as? String,
                let total_points = jsonElement["total_points"] as? String,
                let total_distance = jsonElement["total_distance"] as? String
            {
                myProfile.fname = fname
                myProfile.total_steps = total_steps
                myProfile.total_flights = total_flights
                myProfile.total_points = total_points
                myProfile.total_distance = total_distance
                
                
                
                
            }
            
            profile.addObject(myProfile)
            
        }
        
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            
            self.delegate.itemsDownloaded(profile)
            
        })
    }
}