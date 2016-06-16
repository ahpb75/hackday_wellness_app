//
//  ViewController.swift
//  hacktest-2
//
//  Created by Andrew Peth on 6/13/16.
//  Copyright © 2016 Andrew Peth. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, HomeModelProtocal  {
    
    //Properties
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var stepLabel: UILabel!
    @IBOutlet weak var flightLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    
    
    
    var feedItems: NSArray = NSArray()
    var selectedTopic : ProfileModel = ProfileModel()
//    @IBOutlet weak var listTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set delegates and initialize homeModel
        
//        self.listTableView.delegate = self
//        self.listTableView.dataSource = self
        
        let homeModel = HomeModel()
        homeModel.delegate = self
        homeModel.downloadItems()
        
    }
    
    func itemsDownloaded(items: NSArray) {
        
        feedItems = items
        let model = feedItems.firstObject as! ProfileModel
        
        if let name = model.fname {
            nameLabel.text = "Welcome \(name),"
        } else {
            nameLabel.text = "Welcome Unknown"
        }
        
        if let steps = model.total_steps {
            stepLabel.text = "Total Steps: \(steps)"
        } else {
            stepLabel.text = "Unknown"
        }
        
        if let flights = model.total_flights {
            flightLabel.text = "Total Flights: \(flights)"
        } else {
            flightLabel.text = "Welcome Unknown"
        }
        
        if let distance = model.total_distance {
            distanceLabel.text = "Total Distance: \(distance) Mile(s)"
        } else {
            distanceLabel.text = "Welcome Unknown"
        }
        
        if let points = model.total_points{
            pointsLabel.text = "Total Points: \(points)"
        } else {
            pointsLabel.text = "Welcome Unknown"
        }
        
       
        
        
        
        
//        self.listTableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of feed items
        return 5
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return feedItems.count
    }
    /*
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
       
            let item: ProfileModel = feedItems[indexPath.row] as! ProfileModel
            // create the alert
            let alert = UIAlertController(title: item., message: item.details, preferredStyle: UIAlertControllerStyle.Alert)
        
            // add an action (button)
            alert.addAction(UIAlertAction(title: "Let's do it!", style: UIAlertActionStyle.Default, handler: nil))
            
            // show the alert
            self.presentViewController(alert, animated: true, completion: nil)
        
    }*/
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Retrieve cell
        let cellIdentifier: String = "BasicCell"
        let myCell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)!
       
        // Get the topic to be shown
        let item: ProfileModel = feedItems[indexPath.section] as! ProfileModel
        
         if indexPath.row == 0 {
        // Get references to labels of cell
        //myCell.textLabel?.numberOfLines = 20
        //myCell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
        
        myCell.textLabel!.text = "Welcome, \(item.fname!)"
        
        }
        
        if indexPath.row == 1 {
        myCell.textLabel!.text = "Total Steps: \(item.total_steps!)"
        }
        
        if indexPath.row == 2 {
        myCell.textLabel!.text = "Total Stairs Climbed: \(item.total_flights!)"
        }
        
        if indexPath.row == 3 {
            myCell.textLabel!.text = "Total Distance: \(item.total_distance!) Mile(s)"
        }
        
        if indexPath.row == 4 {
            myCell.textLabel!.text = "Total Points: \(item.total_points!)"
        }
        
        //Total Stairs Climbed: \(item.total_flights!)\n\nTotal Distance: \(item.total_distance!) Mile(s)\n\nTotal Points: \(item.total_points!)"
        
        return myCell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 100
        }
        
        return 44
    }
    
}

