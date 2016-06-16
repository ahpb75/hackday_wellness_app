//
//  ProfileModel.swift
//  hacktest-2
//
//  Created by Andrew Peth on 6/15/16.
//  Copyright © 2016 Andrew Peth. All rights reserved.import Foundation

import Foundation

class ProfileModel: NSObject {
    
    //properties
    
    var fname: String?
    var total_steps: String?
    var total_flights: String?
    var total_points: String?
    var total_distance: String?
    
    
    //empty constructor
    
    override init()
    {
        
    }
    
    //construct with @id, @topic, @details, and @date
    
    init(fname: String, total_steps: String, total_flights: String, total_points: String, total_distance: String) {
        
        self.fname = fname
        self.total_steps = total_steps
        self.total_flights = total_flights
        self.total_points = total_points
        self.total_distance = total_distance
        
    }
    
    
    //prints object's current state
    
    override var description: String {
        return "fname: \(fname), Total Steps: \(total_steps), Total Flights: \(total_flights), Points: \(total_points), Total Distance: \(total_distance)"
        
    }
    
    
}
