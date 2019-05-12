//
//  TimeSingleton.swift
//  Sleeping Time
//
//  Created by Raphael Henrique on 12/05/19.
//  Copyright © 2019 TBD-patrichel. All rights reserved.
//

import Foundation
import UIKit

class TimeUtility {
    
    //MARK: - Properties
    static let shared = TimeUtility()
    
    init() {
        
    }
    
    var counter: TimeInterval = 0
    var timer = Timer()
    var isPlaying = false
    
    //MARK: - Functions
    
    func startRecording() {
        if isPlaying {
            return
        }
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        isPlaying = true
    }
    
    func stopRecording() {
        timer.invalidate()
        isPlaying = false
    }
    
    func resetRecording() {
        timer.invalidate()
        isPlaying = false
        counter = 0
    }
    
    
    //MARK: - objc Functions
    
    @objc func updateTimer() {
        
        counter += 0.1
        
        if UIApplication.shared.applicationState == .active {
            print("Counter value: \(counter)")
        } else {
            print("Counter value in background: \(counter)")
        }
        
    }
    
    
    //MARK: - Notes
    
    /*
     Useful snippet
     
     let absInterval = abs(Int(countTime.counter))
     let seconds = absInterval % 60
     let minutes = (absInterval / 60) % 60
     let hours = (absInterval / 3600)
     
     let msec = countTime.counter.truncatingRemainder(dividingBy: 1)
     
     if UIApplication.shared.applicationState == .active {
     timeLabel.text = hours == 0 ? String(format: "%.2d", minutes) + ":" + String(format: "%.2d", seconds) + "." + String(format: "%.2d", Int(msec * 100)) : String(hours) + ":" + String(format: "%.2d", minutes) + ":" + String(format: "%.2d", seconds) + "." + String(format: "%.2d", Int(msec * 100))
     } else {
     print("Background: \(countTime.counter)")
     }
     
     
    */
    
    
}
