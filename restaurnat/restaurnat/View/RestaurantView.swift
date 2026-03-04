//
//  RestaurantView.swift
//  restaurnat
//
//  Created by Javid Gafarli on 15.02.26.
//

import SwiftUI

struct RestaurantView: View {
    
    @State private var showOptions = false
    @State private var showError = false
    
    
    @Binding var restaurant: Restaurnat
    
    var body: some View {
        
        VStack(alignment: .leading,spacing: 0) {
            
            Image(self.restaurant.image)
                .resizable()
                .frame(height: 250)
                .cornerRadius(20)
            
            HStack(alignment: .top, spacing: 0){
                
                VStack(alignment: .leading) {
                    Text(self.restaurant.title)
                        .font(.system(.title2, design: .rounded))
                    Text(self.restaurant.type.rawValue)
                        .font(.system(.body, design: .rounded))
                        
                    Text(self.restaurant.location)
                        .font(.system(.subheadline, design: .rounded))
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
                .padding(.bottom)
                
                if restaurant.isFavorite {
                    Spacer()
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                        .padding(.trailing, 16)
                }
            }
            
       
        }
        
        .contextMenu {
            Button(action: {
                showError.toggle()
            }) {
                HStack{
                    Text("Reserve")
                    Image(systemName: "phone")
                }
            }
            
            
            Button(action: {
                restaurant.isFavorite.toggle()
            }) {
                HStack{
                    Text(restaurant.isFavorite ? "Remove favorite" : "Mark as favorite")
                    Image(systemName: "phone")
                }
            }
        }
//        .onTapGesture {
//            showOptions.toggle()
//        }
//        .confirmationDialog(
//            "What are you doing",
//            isPresented: $showOptions,
//            titleVisibility: .visible
//        ) {
//            Button(restaurant.isFavorite ? "Remove favorite" : "Mark as favorite"){
//                self.restaurant.isFavorite.toggle()
//            }
//            
//            Button("Show direction"){
//                self.showError.toggle()
//            }
//        }
        .alert("Alert", isPresented: $showError) {
            Button("OK") {
                
            }
        } message: {
            Text("Sorry")
        }
    }
}

