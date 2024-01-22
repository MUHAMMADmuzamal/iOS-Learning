//
//  HomeViewController.swift
//  Weather
//
//  Created by codes orbit on 28/08/2023.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var searchBarView:SearchBarView!
    @IBOutlet weak var dotsStackView:UIStackView!
    @IBOutlet weak var weatherImage:UIImageView!
    @IBOutlet weak var locationLabelStackView:UIStackView!
    @IBOutlet weak var detailUIView:UIView!
    @IBOutlet weak var temperatureView:UIStackView!
    @IBOutlet weak var sunSetDetailView:UIView!
    @IBOutlet weak var sunSetDetailStackView:UIStackView!
    @IBOutlet weak var sunSetLabel:UILabel!
    @IBOutlet weak var sunSetAngleView:UIView!
    @IBOutlet weak var lengthOfDayStack:UIStackView!
    @IBOutlet weak var remainingDayLightStack:UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setup()
        
    }

    override func prepareForInterfaceBuilder(){
        self.setup()
    }
    func setup() {
        stackView.setCustomSpacing(17,after: searchBarView )
        stackView.setCustomSpacing(41,after: dotsStackView )
        stackView.setCustomSpacing(10,after: weatherImage )
        stackView.setCustomSpacing(16,after: locationLabelStackView )
        stackView.setCustomSpacing(35, after: temperatureView)
        stackView.setCustomSpacing(11, after: detailUIView)

        //detailUIView settings
        detailUIView.layer.cornerRadius = 11.0

        //sunSetDetailView setting
        sunSetDetailView.layer.cornerRadius = 11.0
        sunSetDetailStackView.setCustomSpacing(32, after: sunSetLabel)
        sunSetDetailStackView.setCustomSpacing(16, after: sunSetAngleView)
        sunSetDetailStackView.setCustomSpacing(4, after: remainingDayLightStack)
    }
}
