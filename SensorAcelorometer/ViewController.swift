//
//  ViewController.swift
//  SensorAcelorometer
//
//  Created by Marilyn Martha Yusnita Devi Parhusip on 11/07/19.
//  Copyright © 2019 Apple Academy. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    let motionManager = CMMotionManager()

    @IBOutlet weak var viewImage: UIView!
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var data3Label: UILabel!
    
    @IBOutlet weak var data2Label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startAcelorometer()
        // Do any additional setup after loading the view.
    }
    
    func startAcelorometer() {
        if motionManager.isAccelerometerAvailable{
            motionManager.accelerometerUpdateInterval = 0.1
            motionManager.startAccelerometerUpdates(to: OperationQueue.main) { (data, error) in
                if let dataAccel = data{
                    print(dataAccel)
                    self.dataLabel.text = String(format: "%.2f", dataAccel.acceleration.x)
                    self.data2Label.text = String(format: "%.2f", dataAccel.acceleration.y)
                    self.data3Label.text = String(format: "%.2f", dataAccel.acceleration.z)
                    
                    if ((dataAccel.acceleration.x > 0.1)) {
                        self.viewImage.backgroundColor = UIColor(red: 0/255, green: 255/255, blue: 0/255, alpha: CGFloat(dataAccel.acceleration.x))
                    }
                    
                    if ((dataAccel.acceleration.y > 0.1)) {
                        self.viewImage.backgroundColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: CGFloat(dataAccel.acceleration.y))
                    }
                    
                    if ((dataAccel.acceleration.z > 0.1)) {
                        self.viewImage.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 255/255, alpha: CGFloat(dataAccel.acceleration.z))
                    }
                }
            }
        }
    }


}

