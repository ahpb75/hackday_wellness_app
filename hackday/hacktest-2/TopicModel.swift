//
//  TopicModel.swift
//  hacktest-2
//
//  Created by Andrew Peth on 6/13/16.
//  Copyright © 2016 Andrew Peth. All rights reserved.
//

import Foundation

class TopicModel: NSObject {
    
    //properties
    
    var id: String?
    var topic: String?
    var details: String?
    var date: String?
    
    
    //empty constructor
    
    override init()
    {
        
    }
    
    //construct with @id, @topic, @details, and @date
    
    init(id: String, topic: String, details: String, date: String) {
        
        self.id = id
        self.topic = topic
        self.details = details
        self.date = date
        
    }
    
    
    //prints object's current state
    
    override var description: String {
        return "ID: \(id), Topic: \(topic), Details: \(details), Date: \(date)"
        
    }
    
    
}