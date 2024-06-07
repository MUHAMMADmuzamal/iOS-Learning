//
//  SplashView.swift
//  MVC
//
//  Created by Codes Orbit on 15/05/2024.
//

import UIKit

class SplashView: UIViewController, ViewIdentifiable {

    var viewModel: SplashViewModelType!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){ [weak self] in
//            self.navigationController?.pushViewController(RootBuilder.build(), animated: true)
            self?.viewModel.navigateToRoot()
        }
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
