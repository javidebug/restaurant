//
//  ContentView.swift
//  restaurnat
//
//  Created by Javid Gafarli on 01.02.26.
//

import SwiftUI

struct ContentView: View {
    
    var photos = ["images1", "image2", "images3", "images4", "restaurant"]
    
    var restaurantList  = ["Restoran 1","Restoran 2","Restoran 3","Restoran 4","Restoran 5",]
    
    
    var body: some View {
        
        
        List {
            ForEach(0..<restaurantList.count, id: \.self) { index in
                
                HStack {
                    
                    Image(photos[index])
                        .resizable()
                        .frame(width: 50, height: 50)
                    
                    Text(restaurantList[index])
                                        
                }
            }
        }
        .listStyle(.plain)
        
    }
}
#Preview {
    ContentView()
}
