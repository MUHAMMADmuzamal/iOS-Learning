//
//  UIView + Extension.swift
//  MVC
//
//  Created by Codes Orbit on 15/05/2024.
//

import UIKit

protocol ViewIdentifiable {
}

extension ViewIdentifiable where Self: UIViewController {
    
    static func instantiateView(name: UIViewController.View) -> Self {
        let viewController = Self(nibName: name.fileName, bundle: Bundle.main)
        return viewController
    }
}

extension UIViewController {
    enum View: String {
        case splash
        case root
        case home
        
        var fileName: String {
            switch self {
            case .splash:
                return "SplashView"
            case .root:
                return "RootView"
            case .home:
                return "HomeView"
            }
        }
    }
}
