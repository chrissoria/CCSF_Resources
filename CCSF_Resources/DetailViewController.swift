//
//  DetailViewController.swift
//  CCSF_Resources
//
//  Created by christopher soria on 5/17/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit
import Parse

class DetailViewController: UIViewController {
    
    var detail: PFObject?

    @IBOutlet weak var detailTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let title = detail!["resourceTitle"] as? String
        detailTitle.text = title

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onBack(sender: AnyObject) {
        self.performSegueWithIdentifier("unwindToMenu", sender: self)
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
