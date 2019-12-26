//
//  ViewController.swift
//  BelajarCoreMotion
//
//  Created by Fauzan Achmad on 11/07/19.
//  Copyright © 2019 Fauzan Achmad. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    var motion = CMMotionManager()
    
    @IBOutlet weak var labelX: UILabel!
    @IBOutlet weak var labelY: UILabel!
    @IBOutlet weak var labelZ: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        myAccelerometer()
    }

    func myAccelerometer() {
        motion.accelerometerUpdateInterval = 0.1
        if motion.isAccelerometerAvailable {
            motion.startAccelerometerUpdates(to: .main) {
                (data, error) in
                if let trueData = data {
                    let x = trueData.acceleration.x
                    let y = trueData.acceleration.y
                    let z = trueData.acceleration.z
                    
                    self.labelX.text = "x: \(x)"
                    self.labelY.text = "y: \(y)"
                    self.labelZ.text = "z: \(z)"
                    
                    self.view.backgroundColor = UIColor.init(displayP3Red: CGFloat(x), green: CGFloat(y), blue: CGFloat(z), alpha: 1)
                }
            }
        }
    }
    
}

