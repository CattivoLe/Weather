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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let icon = WeatherIconManager.ClearDay.image
        let weather = CurrentWeather(temperature: -5.0, appearentTemperature: -10.0, humidity: 45, pressure: 750, image: icon)
        
        updateUIWith(currentWeather: weather)
    }
    
    func updateUIWith(currentWeather: CurrentWeather) {
        
        self.imageView.image = currentWeather.image
        self.temperatureLabel.text = currentWeather.temperatureString
        self.appearentTemperature.text = currentWeather.appirentString
        self.pressureLabel.text = currentWeather.pressureString
        self.humidityLabel.text = currentWeather.humidityString
        
    }

    
}
