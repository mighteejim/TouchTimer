//
//  TouchTimerController.swift
//  TouchTimer
//
//  Created by Jim on 1/20/17.
//  Copyright © 2017 GormTech. All rights reserved.
//

import Cocoa

class TouchTimerController: NSWindowController {

    let myCounter = timerCounter()
    var TouchTimer = Timer()
    let myActivity = ProcessInfo()
    var counter = 0
    
    // var counter = 0

    override func windowDidLoad() {
        super.windowDidLoad()
    
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
                
    }
    
    func touchTimer() {
        
        TouchTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TouchTimerController.updateCounter), userInfo: nil, repeats: true)
        
        
        // Prevents App Nap from starting while the timer is running. Probably a better way to do this.
        myActivity.beginActivity(options: .userInitiated, reason: "Started Counter")
        
    }
    
    
    @IBOutlet weak var touchTimerLabel: NSTextField!
    
    @IBAction func twoMinuteTap(_ sender: Any) {
        
        print("Starting 2 minute timer")
        touchTimerLabel.stringValue = String("0")
        self.counter = 0
        updateCounterTwoMinutes()
        touchTimer()
        
        
    }
    


    
    @IBAction func fiveMinuteTap(_ sender: Any) {
    
        print("Starting 5 minute timer")
        touchTimerLabel.stringValue = String("0")
        myCounter.counter = 0
        myCounter.updateCounter(timer: 300)
        touchTimer()
    }
 
    
    
    @IBAction func tenMinuteTap(_ sender: Any) {
        
        print("Starting 10 minutes timer")
        touchTimerLabel.stringValue = String("0")
        myCounter.counter = 0
        myCounter.updateCounter(timer: 600)
        touchTimer()
        
    }
 
    
    
    @IBAction func stopTouchTimer(_ sender: Any) {
        
        print("Timer stopped!")
        myCounter.TouchTimer.invalidate()
        touchTimerLabel.stringValue = String("0")
        myCounter.counter = 0
    
    
    }
    
    
    func showTwoMinuteNotification() -> Void {
        
        let ns = NSUserNotification()
        ns.title = "Touch Timer"
        ns.informativeText = "2 minutes are up!"
        ns.soundName = NSUserNotificationDefaultSoundName
        NSUserNotificationCenter.default.deliver(ns)
        
    }
    
    func showFiveMinuteNotification() -> Void {
        
        let ns = NSUserNotification()
        ns.title = "Touch Timer"
        ns.informativeText = "5 minutes are up!"
        ns.soundName = NSUserNotificationDefaultSoundName
        NSUserNotificationCenter.default.deliver(ns)
        
    }
    
    func showTenMinuteNotification() -> Void {
        
        let ns = NSUserNotification()
        ns.title = "Touch Timer"
        ns.informativeText = "10 minutes are up!"
        ns.soundName = NSUserNotificationDefaultSoundName
        NSUserNotificationCenter.default.deliver(ns)
        
    }
    
    
    func updateCounter() {
        
        self.counter += 1
        touchTimerLabel.stringValue = String(describing: self.counter)
        print(self.counter)
        updateCounterTwoMinutes()
    }
    
    
    func updateCounterTwoMinutes() {
        
            if self.counter == 90 {
            self.TouchTimer.invalidate()
            print("2 minutes is up!")
            showTwoMinuteNotification()
            
            
        }
    }
    
    
    
    
}

class timerCounter {
    
    var TouchTimer = Timer()
    var counter = 0
    
    @objc func updateCounterFirst() {
        
        self.counter += 1
    }
    
    func touchTimerInvalidate() {
        
        TouchTimer.invalidate()
    }

    
    @objc func updateCounter(timer: Int) {
        
        _ = 0
        if timer == 90 {
            
            touchTimerInvalidate()
            for _ in 1...timer {
                self.updateCounterFirst()
            }
        } else {
            touchTimerInvalidate()
            
        }
        
        if timer == 300 {
            for _ in 1...timer {
                self.updateCounterFirst()
            }
        } else {
            touchTimerInvalidate()
        }
        
        if timer == 600 {
            for _ in 1...timer {
                self.updateCounterFirst()
            }
        } else {
            touchTimerInvalidate()
        }
    
    }
    func updateCounterTwoMinutes() {
        
        if self.counter == 90 {
            self.touchTimerInvalidate()
            print("2 minutes is up!")
            
            
        }
    }
    
    func updateCounterFiveMinutes() {
        
        if self.counter == 300 {
            self.touchTimerInvalidate()
            print("Five minutes is up!")
        }
    }
    
    @objc func updateCounterTenMinutes() {
        
        if self.counter == 600 {
            self.touchTimerInvalidate()
            print("Ten minutes is up!")
        }
        
    }
    
}
