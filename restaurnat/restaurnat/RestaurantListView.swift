//
//  v2.swift
//  restaurnat
//
//  Created by Javid Gafarli on 14.02.26.
//

//
//  ContentView.swift
//  restaurnat
//
//  Created by Javid Gafarli on 01.02.26.
//

import SwiftUI

struct RestaurantListView: View {
    
   static let restoran1: Restaurnat = Restaurnat(
        title: "Cafe Deadend",
        type: .cafe,
        location: "Hong Kong",
        image: "images1"
    )
    
   static let restoran2: Restaurnat = Restaurnat(
        title: "Homei",
        type: .shop,
        location: "USA",
        image: "image2"
    )
    
    
    static let restoran3: Restaurnat = Restaurnat(
        title: "Teakha",
        type: .french,
        location: "Baku",
        image: "images3"
    )
    
    static let restoran4: Restaurnat = Restaurnat(
        title: "Cafe Loisl",
        type: .tea,
        location: "Russia",
        image: "images4"
    )
    
    
    var list = [restoran1, restoran2, restoran3, restoran4]
    
    //OLD
    
    var photos = ["images1", "image2", "images3", "images4", "restaurant"]
    
    var restaurantList  = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster"]
    
    var category = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Casual Drink", "French"]
    
    var country = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong"]
    
    var body: some View {
        
        
        List {
            
            ForEach(list.indices, id: \.self) { index in
                
                RestaurantView(
                    title: list[index].title,
                    type: list[index].type,
                    location: list[index].location,
                    image: list[index].image
                )
        
            }
            
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        
    }
}
#Preview {
    RestaurantListView()
}
