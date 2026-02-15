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
    
    let title: String
    let type: RestaurnatType
    let location: String
    let image: String
    
    var body: some View {
        
        VStack(alignment: .leading,spacing: 10) {
            
            Image(self.image)
                .resizable()
                .frame(height: 250)
                .cornerRadius(20)
            
            VStack(alignment: .leading) {
                Text(self.title)
                    .font(.system(.title2, design: .rounded))
                Text(self.type.rawValue)
                    .font(.system(.body, design: .rounded))
                    
                Text(self.location)
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
        .onTapGesture {
            showOptions.toggle()
        }
        .confirmationDialog(
            "What are you doing",
            isPresented: $showOptions,
            titleVisibility: .visible
        ) {
            Button("Mark as favorite"){
                print("added to favorites")
            }
            
            Button("Show direction"){
                self.showError.toggle()
            }
        }
        .alert("Alert", isPresented: $showError) {
            Button("OK") {
                
            }
        } message: {
            Text("Sorry")
        }
    }
}

#Preview {
    RestaurantView(title: "hee", type: .cafe, location: "baku", image: "images1")
}
