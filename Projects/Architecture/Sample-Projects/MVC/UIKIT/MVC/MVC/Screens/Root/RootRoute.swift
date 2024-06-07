//
//  RootRoute.swift
//  MVC
//
//  Created by Codes Orbit on 24/05/2024.
//

import Foundation
protocol RootRoute {
    var rootTransition: Transition { get }
    
    func displayRoot()
}

extension RootRoute where Self: RouterProtocol  {
    func displayRoot(){
        let vc = RootBuilder.build(injector: injector)
        open(vc, transition: rootTransition)
    }
}
