//
//  ViewController.swift
//  StopWatch
//
//  Created by Steven Yang on 4/12/16.
//  Copyright © 2016 Yato. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var timerLabel: UILabel!
    
    var time = 0
    var timer = NSTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timerLabel.text = String(time)
        
        
    }
    
    func player() {
        time += 1
        timerLabel.text = String(time)
    }
    
    func rewinder() {
        time -= 1
        if time == 0 {
            timer.invalidate()
            time -= 0
            timerLabel.text = String(time)
        } else {
            timerLabel.text = String(time)
        }
    }
    
    @IBAction func playButton(sender: AnyObject) {
        timingFunction(1, selector: "player")
    }
    
    @IBAction func pauseButton(sender: AnyObject) {
        timer.invalidate()
    }
    
    @IBAction func rewindButton(sender: AnyObject) {
        timingFunction(1, selector: "rewinder")
    }
    @IBAction func forwardButton(sender: AnyObject) {
        timingFunction(0.5, selector: "player")
    }
    
    @IBAction func clearButton(sender: AnyObject) {
        timer.invalidate()
        time = 0
        timerLabel.text = String(time)
    }
    
    
    
    
    func timingFunction(seconds: NSTimeInterval, selector: String) {
        timer.invalidate()
        timer = NSTimer.scheduledTimerWithTimeInterval(seconds, target: self, selector: Selector(selector), userInfo: nil, repeats: true)
    }


}

