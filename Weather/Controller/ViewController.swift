//
//  ViewController.swift
//  Weather
//
//  Created by Alexander Omelchuk on 23/02/2019.
//  Copyright © 2019 Александр Омельчук. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var appearentTemperature: UILabel!
    @IBOutlet weak var  pressureLabel: UILabel!
    @IBOutlet weak var  humidityLabel: UILabel!
    @IBOutlet weak var refrashButton: UIButton!
    
    @IBAction func refreshButtonTapped(_ sender: UIButton) {
    }
    
    lazy var weatherManager = APIWeatherManager(apiKey: "ea099f6f7a72186c1bea538c8e1ee5de")
    let coordinate = Coordinates(latitude: 55.539667, longitude: 37.520977)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherManager.fetchCurrentWeatherWith(coordinates: coordinate) { (result) in
            switch result {
            case .Success(let currentWeather):
                self.updateUIWith(currentWeather: currentWeather)
            case .Failure(let error as NSError):
                self.presentError(title: "Oops", error: error)
            }
        }
    }
    
    func updateUIWith(currentWeather: CurrentWeather) {
        self.imageView.image = currentWeather.image
        self.temperatureLabel.text = currentWeather.temperatureString
        self.appearentTemperature.text = currentWeather.appirentString
        self.pressureLabel.text = currentWeather.pressureString
        self.humidityLabel.text = currentWeather.humidityString
        
    }
    
    func presentError (title: String, error: NSError) {
        let allertController = UIAlertController(title: title, message: "\(error.localizedDescription)", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default)
        allertController.addAction(okButton)
        self.present(allertController, animated: true, completion: nil)
    }
}
