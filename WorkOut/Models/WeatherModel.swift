//
//  WeatherModel.swift
//  WorkOut
//
//  Created by Тимур Ахметов on 31.03.2022.
//

import Foundation

struct WeatherModel: Decodable {
    let currently: Currently
}

struct Currently: Decodable {
    let temperature: Double
    let icon: String?
    
    var temperatureCelsius: Int {
        return (Int(temperature) - 32) * 5 / 9
    }
    
    var iconLocal: String {
        switch icon {
        case "clear-day": return "Ясно"
        case "clear-night": return "Ясная ночь"
        case "rain": return "Дождь"
        case "snow": return "Снег"
        case "sleet": return "Мокрый снег"
        case "wind": return "Ветрено"
        case "fog": return "Туман"
        case "cloudy": return "Облачно"
        case "partly-cloudy-day": return "Пасмурный день"
        case "partly-cloudy-night": return "Пасмурная ночь"
        default: return "No data"
        }
    }
    
    var description: String {
        switch icon {
        case "clear-day": return "Отличный день для прогулки"
        case "clear-night": return ""
        case "rain": return "Лучше захватить с собой зонт"
        case "snow": return ""
        case "sleet": return ""
        case "wind": return ""
        case "fog": return ""
        case "cloudy": return "Возможны осадки"
        case "partly-cloudy-day": return "Отличный день для теплого чая"
        case "partly-cloudy-night": return ""
        default: return "No data"
        }
    }
}
