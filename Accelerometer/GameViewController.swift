//
//  GameViewController.swift
//  Accelerometer
//
//  Created by 原田摩利奈 on 8/28/22.
//

import UIKit
import CoreMotion

class GameViewController: UIViewController {
    
    @IBOutlet var awaImagaView: UIImageView!
    let motionManager = CMMotionManager()
    var accelerationX: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if motionManager.isAccelerometerAvailable {
            motionManager.accelerometerUpdateInterval = 0.01
            motionManager.startAccelerometerUpdates(to: OperationQueue.current!) { data, error in
                
                self.accelerationX = (data?.acceleration.x)!
                self.awaImagaView.center.x += CGFloat(self.accelerationX*20)
                
                if self.awaImagaView.frame.origin.x < 40 {
                    self.awaImagaView.frame.origin.x = 40
                }
                if self.awaImagaView.frame.origin.x > 260 {
                    self.awaImagaView.frame.origin.x = 260
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController: ResultViewController = segue.destination as! ResultViewController
        resultViewController.accelerationX = self.accelerationX
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
