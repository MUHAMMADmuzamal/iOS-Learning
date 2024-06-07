//
//  HomeViewController.swift
//  DeepLinkAndPushNotifications
//
//  Created by Codes Orbit on 06/06/2024.
//

import UIKit
import UserNotifications

class HomeViewController: UIViewController {

    @IBOutlet var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
//        checkForPermissions() // for local notifications
        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension HomeViewController {
    //https://www.youtube.com/watch?v=mECd0gik6AQ
    //https://www.youtube.com/watch?v=WmM4ryGcmSg
    //https://www.youtube.com/watch?v=JuqQUP0pnZY
    func handleDeepLink(_ deepLink: DeepLink) {
        label.text = "DeepLink: " + deepLink.rawValue
//        switch deepLink {
//        case .home:
//            label.text = "DeepLink: " + deepLink.rawValue
//        case .profile:
//            label.text = "DeepLink: " + deepLink.rawValue
//        case .settings:
//            label.text = "DeepLink: " + deepLink.rawValue
//        }
    }
    
    
    func checkForPermissions() {
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.getNotificationSettings { setting in
            switch setting.authorizationStatus {
            case .notDetermined:
                return notificationCenter.requestAuthorization(options: [.alert,.sound, .badge]) { didAllow, error in
                    if didAllow {
                        self.disPatchNotifications()
                    }
                }
            case .denied:
                return
            case .authorized:
                self.disPatchNotifications()
            default:
                return
            }
        }
    }
    
    func disPatchNotifications() {
        let identifier = "my-morning-notification"
        let notificationCenter = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        content.title = "Test"
        content.sound = .default
        content.body = "Just testing"
        
        let isDaily = false // For testing, do not repeat daily
        
        let date = Date().addingTimeInterval(10)
        let dateComponent = Calendar.current.dateComponents([.year, .month, .hour, .minute, .second], from: date)

        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: isDaily)
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        notificationCenter.removePendingNotificationRequests(withIdentifiers: [identifier])
        notificationCenter.add(request) { error in
            if let error = error {
                print("Error adding notification request: \(error.localizedDescription)")
            } else {
                print("Notification scheduled: \(identifier)")
            }
        }
    }
}
