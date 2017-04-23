//
//  ViewController.swift
//  VimoHeartRate
//
//  Created by Zeean Veljee on 23/04/17.
//  Copyright © 2015 Zed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let healthManager:HealthKitManager = HealthKitManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func authorizeTapped(_ sender: Any) {
         //HealthKitManager.authorizeHealthKit()
    }

}

