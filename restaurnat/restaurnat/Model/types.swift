//
//  types.swift
//  restaurnat
//
//  Created by Javid Gafarli on 15.02.26.
//

struct Restaurnat {
    let title: String
    let type: RestaurnatType
    let location: String
    let image: String
    var isFavorite: Bool
    var description: String
    var phone: String

    
    
    
    
    static var mock = Restaurnat(
        title: "TEST",
        type: RestaurnatType.cafe,
        location: "DAYDAY",
        image: "images1",
        isFavorite: true,
        description: "Good",
        phone: "994503212211"
    )
}

enum RestaurnatType: String{
    case cafe = "Cafe"
    case tea = "Tea"
    case french = "French"
    case shop = "Shop"
}


