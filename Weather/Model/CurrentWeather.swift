//
//  CurrentWeather.swift
//  Weather
//
//  Created by Alexander Omelchuk on 23/02/2019.
//  Copyright © 2019 Александр Омельчук. All rights reserved.
//

import Foundation
import UIKit

struct CurrentWeather {
    let temperature: Double
    let appearentTemperature: Double
    let humidity: Double
    let pressure: Double
    let image: UIImage
}

extension CurrentWeather {
    var temperatureString: String {
        return "\(Int(temperature))˚C"
    }
    var appirentString: String {
        return "Feals like \(Int(appearentTemperature))˚C"
    }
    var pressureString: String {
        return "\(Int(pressure)) mm"
    }
    var humidityString: String {
        return "\(Int(humidity)) %"
    }
}
