//
//  MasterViewController.swift
//  CCSF_Resources
//
//  Created by christopher soria on 5/15/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    var text: String?
    override func viewDidLoad() {
        super.viewDidLoad()


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
    



}
