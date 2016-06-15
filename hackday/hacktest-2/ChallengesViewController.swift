//
//  ChallengesViewController.swift
//  hacktest-2
//
//  Created by Alexander J. Goldstein on 6/15/16.
//  Copyright © 2016 Andrew Peth. All rights reserved.
//

import UIKit

class ChallengesViewController: UIViewController, UITableViewDataSource {

    let cardioChallenges = [
    ("Walk 10,000 steps each day for 5 days", "50"),
    ("Exercise for 30 minutes for 3 days", "40"),
    ("Walk a mile after lunch for 4 days", "30"),
    ("Compete in a 5K", "100")
    ]
    
    let weightsChallenges = [
    ("Resistance weights for 2 days", "15"),
    ("Increase weights by 5 pounds", "10"),
    ("Weight training for 30 minutes", "20")
    ]
    
    let dietChallenges = [
    ("5 servings of fruits/vegetables per day for 3 days", "15"),
    ("Drink 32 oz of water for 4 days", "25"),
    ]
    
    let stepsChallenges = [
    ("Walk 2 flights of stairs for 3 days", "15"),
    ("Take stairs rather than escalators for 5 days", "30")
    ]
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
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
        else {
            return stepsChallenges.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        
        if indexPath.section == 0 {
            let (challengeTitle, challengePoints) = cardioChallenges[indexPath.row]
            cell.textLabel?.text = challengeTitle
            cell.detailTextLabel?.text = challengePoints
        }
        if indexPath.section == 1 {
            let (challengeTitle, challengePoints) = weightsChallenges[indexPath.row]
            cell.textLabel?.text = challengeTitle
            cell.detailTextLabel?.text = challengePoints
        }
        if indexPath.section == 2 {
            let (challengeTitle, challengePoints) = dietChallenges[indexPath.row]
            cell.textLabel?.text = challengeTitle
            cell.detailTextLabel?.text = challengePoints
        }
        if indexPath.section == 3 {
            let (challengeTitle, challengePoints) = stepsChallenges[indexPath.row]
            cell.textLabel?.text = challengeTitle
            cell.detailTextLabel?.text = challengePoints
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
        else {
            return "Steps"
        }
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
