//
//  ThirdViewController.swift
//  BelajarCoreMotion
//
//  Created by Fauzan Achmad on 11/07/19.
//  Copyright © 2019 Fauzan Achmad. All rights reserved.
//

import UIKit
import CoreMotion

class ThirdViewController: UIViewController {

    let motion = CMPedometer()
    
    @IBOutlet weak var xLabel: UILabel!
    @IBOutlet weak var yLabel: UILabel!
    @IBOutlet weak var zLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myPedoMeter()
    }
    
    func myPedoMeter() {
        if CMPedometer.isStepCountingAvailable() {
            motion.startUpdates(from: Date()) { (data, error) in
                DispatchQueue.main.async {
                    self.xLabel.text = data?.numberOfSteps.stringValue
                }
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
