//
//  MasterViewController.swift
//  CCSF_Resources
//
//  Created by christopher soria on 5/15/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var resourceTableView: UITableView!
    var text: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resourceTableView.dataSource = self
        resourceTableView.delegate = self


    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if let text = text {
            textLabel.text = text
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("resourceCell", forIndexPath: indexPath)
        cell.textLabel!.text = "row\(indexPath.row)"
        print("row\(indexPath.row)")
        return cell
    }


}
