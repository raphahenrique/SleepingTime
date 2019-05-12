//
//  LocalNotifications.swift
//  Sleeping Time
//
//  Created by Raphael Henrique on 12/05/19.
//  Copyright © 2019 TBD-patrichel. All rights reserved.
//

import Foundation
import UserNotifications

class LocalNotifications {

    static let shared = LocalNotifications()
    
    init() {
        
    }
    
    func sendLocalNotification(content: UNMutableNotificationContent,
                               dispatchIn seconds: Double = 1) {

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: seconds, repeats: false)
        let request = UNNotificationRequest(identifier: "notification.id.01", content: content, trigger: trigger)
    
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    func sendDefaultNotification() {
        
        let content = UNMutableNotificationContent()
        content.title = "Notification Tutorial"
        content.subtitle = "from your sleeping app"
        content.body = " This is the body ;)"
        
        let imageName = "applelogo"
        guard let imageURL = Bundle.main.url(forResource: imageName, withExtension: "png") else { return }
        let attachment = try! UNNotificationAttachment(identifier: imageName, url: imageURL, options: .none)
        content.attachments = [attachment]
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        let request = UNNotificationRequest(identifier: "notification.id.01", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
}


extension Notification.Name {
    
    static let appTimeout = Notification.Name("appTimeout")
    
}
