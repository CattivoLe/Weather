//
//  CurrentWeather.swift
//  Weather
//
//  Created by Alexander Omelchuk on 23/02/2019.
//  Copyright © 2019 Александр Омельчук. All rights reserved.
//

import Foundation
import UIKit

var currentLocationName = "Location Name"

struct CurrentWeather {
    let temperature: Double
    let appearentTemperature: Double
    let humidity: Double
    let pressure: Double
    let image: UIImage
}

extension CurrentWeather: JSONDecodable {
    init?(JSON: [String : AnyObject]) {
        guard let temperature = JSON ["temperature"] as? Double,
        let appearentTemperature = JSON ["apparentTemperature"] as? Double,
        let humidity = JSON ["humidity"] as? Double,
        let pressure = JSON ["pressure"] as? Double,
        let imageString = JSON ["icon"] as? String else { return nil }
        let icon = WeatherIconManager(rawValue: imageString).image
        
        self.temperature = temperature
        self.appearentTemperature = appearentTemperature
        self.humidity = humidity
        self.pressure = pressure
        self.image = icon
    }
}

extension CurrentWeather {
    var temperatureString: String {
        return "\(Int(5 / 9 * (temperature - 32)))˚C"
    }
    var appirentString: String {
        return "Feels like: \(Int(5 / 9 * (appearentTemperature - 32)))˚C"
    }
    var pressureString: String {
        return "\(Int(pressure * 0.750062)) mm"
    }
    var humidityString: String {
        return "\(Int(humidity * 100)) %"
    }
}
