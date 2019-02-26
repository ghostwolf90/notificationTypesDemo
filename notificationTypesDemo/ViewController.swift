//
//  ViewController.swift
//  notificationTypesDemo
//
//  Created by Laibit on 2019/2/26.
//  Copyright © 2019 Laibit. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initView()
    }
    
    func initView() {
        let createNotificationBtn: UIButton = UIButton()
        createNotificationBtn.frame = CGRect(x: self.view.frame.size.width / 2 - 100, y: self.view.frame.size.height / 2 - 25, width: 200, height: 50)
        createNotificationBtn.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        createNotificationBtn.setTitle("建立通知", for: .normal)
        createNotificationBtn.setTitleColor(UIColor.white, for: .normal)
        createNotificationBtn.layer.cornerRadius = 10
        createNotificationBtn.backgroundColor = UIColor.darkGray
        createNotificationBtn.addTarget(self, action: #selector(ViewController.onClickCreateNotificationBtn(_:)), for: UIControl.Event.touchUpInside)
        self.view.addSubview(createNotificationBtn)
    }
    
    @objc func onClickCreateNotificationBtn(_ sender: UIButton) {
        let content = UNMutableNotificationContent()
        content.title = "title：測試本地通知"
        content.subtitle = "subtitle：laibit"
        content.body = "body：我的 iOS 世界"
        content.badge = 1
        content.userInfo = ["MEETING_ID" : "123",
                            "USER_ID" : "abc" ]
        content.categoryIdentifier = "MEETING_INVITATION"
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 8, repeats: false)
        let request = UNNotificationRequest(identifier: "notification", content: content, trigger: trigger)
        
        // Define the custom actions.
        let acceptAction = UNNotificationAction(identifier: "ACCEPT_ACTION",
                                                title: "同意",
                                                options: UNNotificationActionOptions(rawValue: 0))
        let declineAction = UNNotificationAction(identifier: "DECLINE_ACTION",
                                                 title: "Decline",
                                                 options: UNNotificationActionOptions(rawValue: 0))
        // Define the notification type
        let meetingInviteCategory = UNNotificationCategory(identifier: "MEETING_INVITATION",
                                                           actions: [acceptAction, declineAction],
                                                           intentIdentifiers: [],
                                                           hiddenPreviewsBodyPlaceholder: "",
                                                           options: .customDismissAction)
        // Register the notification type.
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.setNotificationCategories([meetingInviteCategory])
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: {error in
            print("成功建立通知...")
        })
    }
    
    func creatNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Weekly Staff Meeting"
        content.body = "Every Tuesday at 2pm"
        content.userInfo = ["MEETING_ID" : "123",
                            "USER_ID" : "abc" ]
        content.categoryIdentifier = "MEETING_INVITATION"
        
        // Define the custom actions.
        let acceptAction = UNNotificationAction(identifier: "ACCEPT_ACTION",
                                                title: "Accept",
                                                options: UNNotificationActionOptions(rawValue: 0))
        let declineAction = UNNotificationAction(identifier: "DECLINE_ACTION",
                                                 title: "Decline",
                                                 options: UNNotificationActionOptions(rawValue: 0))
        // Define the notification type
        let meetingInviteCategory = UNNotificationCategory(identifier: "MEETING_INVITATION",
                                   actions: [acceptAction, declineAction],
                                   intentIdentifiers: [],
                                   hiddenPreviewsBodyPlaceholder: "",
                                   options: .customDismissAction)
        // Register the notification type.
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.setNotificationCategories([meetingInviteCategory])
    }

}

