//
//  ViewController.swift
//  hacktest-2
//
//  Created by Andrew Peth on 6/13/16.
//  Copyright © 2016 Andrew Peth. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, HealthModelProtocal  {
    
    //Properties
    
    var feedItems: NSArray = NSArray()
    var selectedTopic : TopicModel = TopicModel()
    @IBOutlet weak var listTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set delegates and initialize homeModel
        
        self.listTableView.delegate = self
        self.listTableView.dataSource = self
        
        let healthModel = HealthModel()
        healthModel.delegate = self
        healthModel.downloadItems()
        
    }
    
    func itemsDownloaded(items: NSArray) {
        
        feedItems = items
        self.listTableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of feed items
        return feedItems.count
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
       
            let item: TopicModel = feedItems[indexPath.row] as! TopicModel
            // create the alert
            let alert = UIAlertController(title: item.topic, message: item.details, preferredStyle: UIAlertControllerStyle.Alert)
        
            // add an action (button)
            alert.addAction(UIAlertAction(title: "Let's do it!", style: UIAlertActionStyle.Default, handler: nil))
            
            // show the alert
            self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Retrieve cell
        let cellIdentifier: String = "BasicCell"
        let myCell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)!
        // Get the topic to be shown
        let item: TopicModel = feedItems[indexPath.row] as! TopicModel
        // Get references to labels of cell
        myCell.textLabel!.text = item.topic
        
        return myCell
    }
    
}

