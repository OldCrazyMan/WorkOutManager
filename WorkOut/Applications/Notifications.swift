//
//  Notifications.swift
//  WorkOut
//
//  Created by Тимур Ахметов on 29.03.2022.
//

import Foundation
import UserNotifications
import UIKit

class Notifications: NSObject {
    
    let notificationCenter = UNUserNotificationCenter.current()
    
    func requestAutorization() {
        notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) { granded, error in
            guard granded else { return }
            self.getNotificationSettings()
        }
    }
    
    func getNotificationSettings() {
        notificationCenter.getNotificationSettings { settings in
            print(settings)
        }
    }
    
    func scheduleDateNotification(date: Date, id: String) {
     
       let content = UNMutableNotificationContent()
        content.title = "WORKOUT"
        content.body = "Today you have training"
        content.sound = .default
        content.badge = 1
        
        var calendar = Calendar.current
        calendar.timeZone = TimeZone(abbreviation: "UTC")!
        var triggerDate = calendar.dateComponents([.year, .month, .day], from: date)
        triggerDate.hour = 07
        triggerDate.minute = 00
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
        
//        var triggerDate = Calendar.current.dateComponents([.year, .month, .day], from: date)
//        triggerDate.hour = 16
//        triggerDate.minute = 00
//        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: true)
        
        let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
        notificationCenter.add(request) { error in
            print("Error \(String(describing: error?.localizedDescription))")
        }
    }
}

extension Notifications: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        UIApplication.shared.applicationIconBadgeNumber = 0
        notificationCenter.removeAllDeliveredNotifications()
        
    }
    }

