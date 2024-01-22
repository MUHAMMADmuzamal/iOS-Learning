//
//  MainViewController.swift
//  WeatherAppWithAPI
//
//  Created by codes orbit on 04/09/2023.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var latitude:UITextField!
    @IBOutlet weak var longitude:UITextField!
    @IBOutlet weak var temperatureLabel:UILabel!
    @IBOutlet weak var buttonUIView:UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var loadingView: UIView! {
      didSet {
        loadingView.layer.cornerRadius = 6
      }
    }

    
    let weatherViewModel = WeatherViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.weatherViewModel.delegate =  self
        self.buttonUIView.layer.cornerRadius = 5.0
        self.buttonUIView.clipsToBounds = true
        self.hideSpinner()
    }

    //MARK: - Weather API Call
    @IBAction func fetchWeather(_ sender: Any){
        guard latitude?.text != "" && longitude?.text != "" else{
            let alert = UIAlertController(title: "Alert", message: "fill all fields", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title:"OK", style: .default))
            self.present(alert, animated: true, completion: nil)
            return
        }
        weatherViewModel.fetchWeatherData(latitude: self.latitude.text!, longitude: self.longitude.text!)
        self.showSpinner()
    }
    //MARK: - Products API Call
    @IBAction func getProducts(_ sender: Any){
        self.navigationController?.pushViewController(ProductsView(), animated: true)
    }
    
   
    //MARK: - Spinner Functions
    private func showSpinner() {
        activityIndicator.startAnimating()
        loadingView.isHidden = false
    }

    private func hideSpinner() {
        activityIndicator.stopAnimating()
        loadingView.isHidden = true
    }
    
}

//MARK: - Weather Delegate

extension MainViewController: WeatherViewModelDelegate{
    func success(data: WeatherModel) {
        self.temperatureLabel?.text = "\(data.daily.temperature2MMax[0])"
        self.hideSpinner()
    }
    
    func failure(error:Error) {
        print(error)
        self.hideSpinner()
    }
}




//        weatherViewModel.fetchWeatherData(latitude: latitude.text ??  "33.7215", longitude: longitude.text ?? "73.0433"){ [self]
//            (data:WeatherModel) in
//            print("\(data.daily.temperature2MMax)")
//            self.temperatureLabel?.text = "\(data.daily.temperature2MMax[0])"
//        }onFailureHandler:{
//            (error) in
//            print(error)
//        }
