//
//  ViewController.swift
//  Fun With Animating
//
//  Created by Randy on 11/16/15.
//  Copyright © 2015 Randy Dillon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startStopAnimating: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    // Image Arrays
    let frames: [String] =
        ["frame1.png","frame2.png","frame3.png","frame4.png","frame5.png","frame6.png","frame7.png"]
    let swan: [String] = ["swanFrame1","swanFrame2","swanFrame3"]
    let swirl: [String] = ["swirlFrame1","swirlFrame2","swirlFrame3"]
    let starryNight: [String] = ["starryNight1","starryNight2","starryNight3"]
    let doveWithBranch: [String] = ["dovewithBranch1","dovewithBranch2","dovewithBranch3"]
    let tanCandles: [String] = ["tanCandles1","tanCandles2","tanCandles3","tanCandles4"]
    let buddhaFloat: [String] = ["buddhaFloat1","buddhaFloat2","buddhaFloat3","buddhaFloat4","buddhaFloat5","buddhaFloat6"]
    
    // timer vars
    var timer = NSTimer()
    var isAnimating = true
    var counter = 1
    var arrayIndex = 0
    var pauseCheck = 0
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomizedFuncs()
    }

    @IBAction func startStopAnimateButton(sender: AnyObject) {
        print("pressed start/stop")
        if isAnimating == true {
            timer.invalidate()
            startStopAnimating.setTitle("Animate", forState: UIControlState.Normal)
            counter = 0
            isAnimating = false
        } else {
            startStopAnimating.setTitle("Stop Animating", forState: UIControlState.Normal)
            
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "pauseCheckFunc", userInfo: nil, repeats: true)
            
            isAnimating = true
        }
    }

    func framesFunc() {
        if arrayIndex == frames.count - 1 {
            arrayIndex = 0
        } else  {
            arrayIndex++
        }
        imageView.image = UIImage(named: frames[arrayIndex])
        counter++
        pauseCheck = 1

        if counter == 50 {
            arrayIndex = 0
            timer.invalidate()
            isAnimating = false
            fadeTransition()
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "swanFunc", userInfo: nil, repeats: true)
            isAnimating = true
            counter = 0
            arrayIndex = 0
        }
    }
    
    func swanFunc() {
        if arrayIndex == swan.count - 1 {
            arrayIndex = 0
        } else  {
            arrayIndex++
        }
        imageView.image = UIImage(named: swan[arrayIndex])
        counter++
        pauseCheck = 2

        if counter == 50 {
            arrayIndex = 0
            timer.invalidate()
            isAnimating = false
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "swirlFunc", userInfo: nil, repeats: true)
            isAnimating = true
            fadeTransition()
            counter = 0
            arrayIndex = 0
        }
    }
    
    func swirlFunc() {
        if arrayIndex == swirl.count-1 {
            arrayIndex = 0
        } else {
            arrayIndex++
        }
        imageView.image = UIImage(named: swirl[arrayIndex])
        counter++
        pauseCheck = 3
        
        if counter == 50 {
            arrayIndex = 0
            timer.invalidate()
            isAnimating = false
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "starryNightFunc", userInfo: nil, repeats: true)
            isAnimating = true
            fadeTransition()
            counter = 0
            arrayIndex = 0
        }
    }
    
    func starryNightFunc() {
        if arrayIndex == starryNight.count-1 {
            arrayIndex = 0
        } else {
            arrayIndex++
        }
        imageView.image = UIImage(named: starryNight[arrayIndex])
        counter++
        pauseCheck = 4
        
        if counter == 50 {
            arrayIndex = 0
            timer.invalidate()
            isAnimating = false
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "doveWithBranchFunc", userInfo: nil, repeats: true)
            isAnimating = true
            fadeTransition()
            counter = 0
            arrayIndex = 0
        }
    }
    
    func doveWithBranchFunc() {
        if arrayIndex == doveWithBranch.count-1 {
            arrayIndex = 0
        } else {
            arrayIndex++
        }
        imageView.image = UIImage(named: doveWithBranch[arrayIndex])
        counter++
        pauseCheck = 5
        
        if counter == 50 {
            arrayIndex = 0
            timer.invalidate()
            isAnimating = false
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "tanCandlesFunc", userInfo: nil, repeats: true)
            isAnimating = true
            fadeTransition()
            counter = 0
            arrayIndex = 0
        }
    }
    
    func tanCandlesFunc() {
        if arrayIndex == tanCandles.count-1 {
            arrayIndex = 0
        } else {
            arrayIndex++
        }
        imageView.image = UIImage(named: tanCandles[arrayIndex])
        counter++
        pauseCheck = 6
        
        if counter == 50 {
            arrayIndex = 0
            timer.invalidate()
            isAnimating = false
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "buddhaFloatFunc", userInfo: nil, repeats: true)
            isAnimating = true
            fadeTransition()
            counter = 0
            arrayIndex = 0
        }
    }
    
    func buddhaFloatFunc() {
        if arrayIndex == buddhaFloat.count-1 {
            arrayIndex = 0
        } else {
            arrayIndex++
        }
        imageView.image = UIImage(named: buddhaFloat[arrayIndex])
        counter++
        pauseCheck = 7
        
        if counter == 50 {
            arrayIndex = 0
            timer.invalidate()
            isAnimating = false
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "framesFunc", userInfo: nil, repeats: true)
            isAnimating = true
            fadeTransition()
            counter = 0
            arrayIndex = 0
        }
    }
    
    func pauseCheckFunc() {
        print("pauseCheck = \(pauseCheck)")
        if pauseCheck == 1 {
            timer.invalidate()
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "framesFunc", userInfo: nil, repeats: true)
        } else if pauseCheck == 2 {
            timer.invalidate()
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "swanFunc", userInfo: nil, repeats: true)
        } else if pauseCheck == 3 {
            timer.invalidate()
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "swirlFunc", userInfo: nil, repeats: true)
        } else if pauseCheck == 4 {
            timer.invalidate()
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "starryNightFunc", userInfo: nil, repeats: true)
        } else if pauseCheck == 5 {
            timer.invalidate()
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "doveWithBranchFunc", userInfo: nil, repeats: true)
        } else if pauseCheck == 6 {
            timer.invalidate()
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "tanCandlesFunc", userInfo: nil, repeats: true)
        } else if pauseCheck == 7 {
            timer.invalidate()
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "buddhaFloatFunc", userInfo: nil, repeats: true)
        }
    }
    
    func randomizedFuncs() {
        var randomNumber = Int(arc4random_uniform(UInt32(7)))
        print("randomNumber = \(randomNumber)")

        if randomNumber == 0 { randomNumber = randomNumber + 1 }

        if randomNumber == 0 {
            timer.invalidate()
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "framesFunc", userInfo: nil, repeats: true)
        } else if randomNumber == 1 {
            timer.invalidate()
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "swanFunc", userInfo: nil, repeats: true)
        } else if randomNumber == 2 {
            timer.invalidate()
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "swirlFunc", userInfo: nil, repeats: true)
        } else if randomNumber == 3 {
            timer.invalidate()
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "starryNightFunc", userInfo: nil, repeats: true)
        } else if randomNumber == 4 {
            timer.invalidate()
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "doveWithBranchFunc", userInfo: nil, repeats: true)
        } else if randomNumber == 5 {
            timer.invalidate()
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "tanCandlesFunc", userInfo: nil, repeats: true)
        } else if randomNumber == 6 {
            timer.invalidate()
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "buddhaFloatFunc", userInfo: nil, repeats: true)
        }
        
    }
    
    func fadeTransition() {
        let transition = CATransition()
        transition.type = kCATransitionFade
        transition.duration = 2.5
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        view.layer.addAnimation(transition, forKey: nil)
    }
}




















