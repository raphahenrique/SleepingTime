//
//  TimerControlApplication.swift
//  Sleeping Time
//
//  Created by Raphael Henrique on 11/05/19.
//  Copyright © 2019 TBD-patrichel. All rights reserved.
//

import Foundation
import UIKit

class TimerControlApplication: UIApplication {
    
    private var idleTimeInSeconds: TimeInterval {
        let minutes: Double = 1
        //return minutes * 60
        return 10
    }
    
    private var idleTimer: Timer?
    
    override init() {
        super.init()
        scheduleTimer()
    }
    
    
    private func resetIdleTimer() {
        if let idleTimer = idleTimer {
            idleTimer.invalidate()
        }
        
        scheduleTimer()
        
    }
    
    private func scheduleTimer() {
        print("TIMER WILL START")
        idleTimer = Timer.scheduledTimer(timeInterval: idleTimeInSeconds,
                                         target: self,
                                         selector: #selector(timeHasExceeded),
                                         userInfo: nil,
                                         repeats: false)
    }
    
    @objc private func timeHasExceeded() {
        print("time has exceeded - notification dispatched to everyone!!!")
        NotificationCenter.default.post(name: .appTimeout, object: nil)
    }
    
    override func sendEvent(_ event: UIEvent) {
        super.sendEvent(event)
        
        if idleTimer != nil {
            self.resetIdleTimer()
        }
        
        
        //There's room for improvement this part, eg. register only first touch etc
        if let touches = event.allTouches {
            for touch in touches where touch.phase == UITouchPhase.began {
                self.resetIdleTimer()
            }
        }
        
        print("TOUCH DETECTED!!!!")
        
        
        //MARK: SEND EVENT Notes
        
        /*
        you don’t need to check if the timer is nil in the sendEvent since the method you are calling to reset the timer already handles that case therefore it would A) have the right functionality in the nil case without the extra check B) would never result in a nil exception
        */
        
        
    }
    
}
