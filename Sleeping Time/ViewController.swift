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

    
    //MARK: Outlets
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var redButton: UIButton!
    
    
    //MARK: Properties
    
    var counter: TimeInterval = 0
    var timer = Timer()
    var isPlaying = false
    
    
    
    //MARK: Override Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert]) { (granted, error) in
            if granted {
                print("local notifications granted")
            } else {
                print("local notifications granted")
            }
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //MARK: IBActions
    
    @IBAction func blueButtonTapped(_ sender: Any) {
        if isPlaying {
            return
        }
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)

        isPlaying = true
    }
    
    @IBAction func greenButtonTapped(_ sender: Any) {
        
//        timer.invalidate()
//        isPlaying = false
        
        
        // 1
        let content = UNMutableNotificationContent()
        content.title = "Notification Tutorial"
        content.subtitle = "from your sleeping app"
        content.body = " This is the body ;)"
        
        // 2
        let imageName = "applelogo"
        guard let imageURL = Bundle.main.url(forResource: imageName, withExtension: "png") else { return }
        
        let attachment = try! UNNotificationAttachment(identifier: imageName, url: imageURL, options: .none)
        
        content.attachments = [attachment]
        
        // 3
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        let request = UNNotificationRequest(identifier: "notification.id.01", content: content, trigger: trigger)
        
        // 4
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
    }
    
    @IBAction func redButtonTapped(_ sender: Any) {
        
        timer.invalidate()
        isPlaying = false
        counter = 0
        timeLabel.text = String(counter)
    
    }
    
    
    //MARK: objc Functions
    
    @objc func updateTimer() {
        
        counter += 0.1
        
        
        let absInterval = abs(Int(counter))
        let seconds = absInterval % 60
        let minutes = (absInterval / 60) % 60
        let hours = (absInterval / 3600)
                    
        let msec = counter.truncatingRemainder(dividingBy: 1)
        
        timeLabel.text = hours == 0 ? String(format: "%.2d", minutes) + ":" + String(format: "%.2d", seconds) + "." + String(format: "%.2d", Int(msec * 100)) : String(hours) + ":" + String(format: "%.2d", minutes) + ":" + String(format: "%.2d", seconds) + "." + String(format: "%.2d", Int(msec * 100))

        
        //timeLabel.text = String(format: "%.1f", counter)
        
    }
    
}

