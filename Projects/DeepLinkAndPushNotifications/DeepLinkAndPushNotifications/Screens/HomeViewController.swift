//
//  HomeViewController.swift
//  DeepLinkAndPushNotifications
//
//  Created by Codes Orbit on 06/06/2024.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

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
    
    
}
