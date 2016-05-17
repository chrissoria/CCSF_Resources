//
//  MasterViewController.swift
//  CCSF_Resources
//
//  Created by christopher soria on 5/15/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit
import MBProgressHUD
import Parse

class MasterViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var resourceTableView: UITableView!
    var text: String?
    
    var parseClass: String!
    
    var resources: [PFObject]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let user = PFUser.currentUser()
        
        resourceTableView.dataSource = self
        resourceTableView.delegate = self


    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        parseAPICall()
        if let text = text {
            textLabel.text = text
        } else {
            textLabel.text = "CCSF"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resources?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("resourceCell", forIndexPath: indexPath) as! ResourceTableViewCell
        
        let resource = resources![indexPath.row]
        
        let resourceTitle = resource["resourceTitle"] as! String
        
        cell.resourceTitleLabel.text = resourceTitle
        //cell.decriptionLabel.text = "Resource Center Description"
        
        print("getting resource title")
        return cell
    }
    
    func parseAPICall() {
        // construct PFQuery
        let query = PFQuery(className: "Resources")
        query.orderByAscending("_id")
        query.limit = 20
        // fetch data asynchronously
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            if let objects = objects  {
                // do something with the data fetched
                print("data fetched")
                self.resources = objects
                print(PFQuery)
                
                self.resourceTableView.reloadData()
            } else {
                //                // handle error
                print (error)
                
            }
            
        }
    }


}
