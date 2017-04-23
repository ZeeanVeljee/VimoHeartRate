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
    var timer: Timer?
    @IBOutlet weak var heartLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        startMockHeartData()
        navigationItem.rightBarButtonItem?.tintColor = UIColor.white
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func authorizeTapped(_ sender: Any) {
         //HealthKitManager.authorizeHealthKit()
    }

    func startMockHeartData() {
        timer = Timer.scheduledTimer(timeInterval: 1.2,
                                     target: self,
                                     selector: #selector(ViewController.heartrate),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    func heartrate() {
        var rate = Double(arc4random_uniform(20) + 60)
        heartLabel.textColor = UIColor.red
        heartLabel.text = "\(rate) BPM"
        
        if rate > 150 {
            let alertController = UIAlertController(title: "UIAlertController", message: "Your heart rate is too high. Kindly calm down", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                print("Ok Button Pressed")
            })
            let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
                print("Cancel Button Pressed")
            }
            alertController.addAction(ok)
            alertController.addAction(cancel)
            present(alertController, animated: true, completion: nil)
        }
        else if rate < 55 {
            let alertController = UIAlertController(title: "UIAlertController", message: "Your heart rate is too low. Kindly get it higher", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                print("Ok Button Pressed")
            })
            let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
                print("Cancel Button Pressed")
            }
            alertController.addAction(ok)
            alertController.addAction(cancel)
            present(alertController, animated: true, completion: nil)
        }
    }
    

}

