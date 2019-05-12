//
//  ViewController.swift
//  Sleeping Time
//
//  Created by Raphael Henrique on 27/04/19.
//  Copyright © 2019 TBD-patrichel. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    
    //MARK: - Outlets
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var redButton: UIButton!
    
    @IBOutlet weak var sleepTimeLabel: UILabel!
    
    
    //MARK: - Properties
    
    private var countTime = TimeUtility()

    
    //MARK: - Override Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNotifications()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        print("didReceiveMemoryWarning - Dispose of any resources that can be recreated")
    }

    
    //MARK: - IBActions
    
    @IBAction func blueButtonTapped(_ sender: Any) {
        if countTime.isPlaying {
            return
        }
        
        countTime.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)

        countTime.isPlaying = true
    }
    
    @IBAction func greenButtonTapped(_ sender: Any) {
        
        countTime.timer.invalidate()
        countTime.isPlaying = false
        
        let content = UNMutableNotificationContent()
        content.title = "Green Button"
        content.body = "This is the body, which was tapped ;)"
        
        LocalNotifications.shared.sendLocalNotification(content: content, dispatchIn: 5)
        
    }
    
    @IBAction func redButtonTapped(_ sender: Any) {
        
        countTime.timer.invalidate()
        countTime.isPlaying = false
        countTime.counter = 0
        timeLabel.text = String(countTime.counter)
    
    }
    
    
    //MARK: - objc Functions
    
    @objc func updateTimer() {
        
        countTime.counter += 0.1
        
        
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
        
        //timeLabel.text = String(format: "%.1f", counter)
        
        //Put elsewhere
        sleepTimeLabel.text = String(TimeUtility.shared.counter)
        
    }
    
    @objc func startSleepingTime(notification: NSNotification) {
        
        print("********************** APPLICATION will start recording sleep now  **********************")
        TimeUtility.shared.startRecording()
        
    }
    
    //MARK: - Private functions
    
    private func setupNotifications() {
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert]) { (granted, error) in
            if granted {
                print("local notifications granted")
            } else {
                print("local notifications granted")
            }
        }
        
        setupNotificationsObservers()
        
    }
    
    private func setupNotificationsObservers() {
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(startSleepingTime(notification:)),
                                               name: .appTimeout,
                                               object: nil)
        
    }
}

