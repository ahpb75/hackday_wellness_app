//
//  ChallengesViewController.swift
//  hacktest-2
//
//  Created by Alexander J. Goldstein on 6/15/16.
//  Copyright © 2016 Andrew Peth. All rights reserved.
//

import UIKit

class ChallengesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let cardioChallenges = [
        ("5 Days of Steps", "Walk 10,000 steps each day for 5 days", "50"),
        ("3 Days of Excercise", "Exercise for 30 minutes for 3 days", "40"),
        ("4 Days of an after-lunch mile", "Walk a mile after lunch for 4 days", "30"),
        ("1 Day of Marathon", "Compete in a 5K", "100")
    ]
    
    let weightsChallenges = [
        ("2 Days of Weights", "Challenge yourself by incorporating resistance weights into your workout for 2 days", "15"),
        ("1 Day of Heavier Weights", "Increase weights by 5 pounds", "10"),
        ("1 Day of Weight Training","Weight training for 30 minutes", "20")
    ]
    
    let dietChallenges = [
        ("3 Days of Fruits and Vegetables", "5 servings of fruits/vegetables per day for 3 days", "15"),
        ("4 Days of Water", "Drink 32 oz of water for 4 days", "25"),
        ]
    
    let meditationChallenges = [
        ("5 Days of Meditation","Meditate for 20 minutes when you wake up for 5 days", "30"),
        ("3 Days of Yoga", "Participate in a session of yoga for 3 days", "15"),
        ]
    
    let stepsChallenges = [
        ("3 Days of 2 Flights", "Walk up 2 flights of stairs for 3 days", "15"),
        ("5 Days of Stairs", "Avoid using the elevator or escalators by taking the stairs for 5 days", "30")
    ]
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return cardioChallenges.count
        }
        if section == 1 {
            return weightsChallenges.count
        }
        if section == 2 {
            return dietChallenges.count
        }
        if section == 3 {
            return meditationChallenges.count
        }
        else {
            return stepsChallenges.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        
        if indexPath.section == 0 {
            let (challengeTitle, _, challengePoints) = cardioChallenges[indexPath.row]
            cell.textLabel?.text = challengeTitle
            cell.detailTextLabel?.text = challengePoints
            
            let myImage = UIImage(named: "running")
            cell.imageView?.image = myImage
        }
        if indexPath.section == 1 {
            let (challengeTitle, _, challengePoints) = weightsChallenges[indexPath.row]
            cell.textLabel?.text = challengeTitle
            cell.detailTextLabel?.text = challengePoints
            
            let myImage = UIImage(named: "weight")
            cell.imageView?.image = myImage
        }
        if indexPath.section == 2 {
            let (challengeTitle, _, challengePoints) = dietChallenges[indexPath.row]
            cell.textLabel?.text = challengeTitle
            cell.detailTextLabel?.text = challengePoints
            
            let myImage = UIImage(named: "silverware")
            cell.imageView?.image = myImage
        }
        
        if indexPath.section == 3 {
            let (challengeTitle, _, challengePoints) = meditationChallenges[indexPath.row]
            cell.textLabel?.text = challengeTitle
            cell.detailTextLabel?.text = challengePoints
            
            let myImage = UIImage(named: "meditation")
            cell.imageView?.image = myImage
        }
    
        if indexPath.section == 4 {
            let (challengeTitle, _, challengePoints) = stepsChallenges[indexPath.row]
            cell.textLabel?.text = challengeTitle
            cell.detailTextLabel?.text = challengePoints
                
            let myImage = UIImage(named: "staircase")
            cell.imageView?.image = myImage
        }
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Cardio"
        }
        
        if section == 1 {
            return "Weights"
        }
        if section == 2 {
            return "Diet"
        }
        if section == 3 {
            return "Meditation"
        }
        else {
            return "Steps"
        }
    }


    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let data: (String, String, String)
        
        switch indexPath.section {
        case 0:
            data = cardioChallenges[indexPath.row]
        case 1:
            data = weightsChallenges[indexPath.row]
        case 2:
            data = dietChallenges[indexPath.row]
        case 3:
            data = meditationChallenges[indexPath.row]
        default:
            data = stepsChallenges[indexPath.row]
        }
        
        
        let myAlert = UIAlertController(title: data.0, message: data.1, preferredStyle: UIAlertControllerStyle.Alert)
        
        // add the actions (buttons)
        myAlert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: { (UIAlertAction) in
            // Do button stuff here
            
            indexPath
        }))

        myAlert.addAction(UIAlertAction(title: "Subscribe", style: UIAlertActionStyle.Cancel, handler: { (UIAlertAction) in
            //
        }))
        
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
