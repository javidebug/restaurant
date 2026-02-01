//
//  ContentView.swift
//  restaurnat
//
//  Created by Javid Gafarli on 01.02.26.
//

import SwiftUI

struct ContentView: View {
    
        
    var restaurantList  = ["Restoran1","Restoran2","Restoran3","Restoran4","Restoran5",]
    
    
    var body: some View {
        
        List {
            ForEach(0...restaurantList.count-1, id: \.self) { index in
                
                HStack {
                    Image("restaurant")
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
