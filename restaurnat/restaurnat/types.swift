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
}

enum RestaurnatType: String{
    case cafe = "Cafe"
    case tea = "Tea"
    case french = "French"
    case shop = "Shop"
}
