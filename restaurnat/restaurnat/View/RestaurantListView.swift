

import SwiftUI

struct RestaurantListView: View {
    
   @State var list = [
    Restaurnat(
    title: "Cafe Deadend",
    type: .cafe,
    location: "Hong Kong",
    image: "images1",
    isFavorite: false,
    description: "Ela mekan",
    phone: "994593134512"
), Restaurnat(
    title: "Homei",
    type: .shop,
    location: "USA",
    image: "image2",
    isFavorite: false,
    description: "Ela mekan",
    phone: "994593134512"
), Restaurnat(
    title: "Teakha",
    type: .french,
    location: "Baku",
    image: "images3",
    isFavorite: false,
    description: "Ela mekan",
    phone: "994593134512"
), Restaurnat(
    title: "Cafe Loisl",
    type: .tea,
    location: "Russia",
    image: "images4",
    isFavorite: false,
    description: "Ela mekan",
    phone: "994593134512"
)]
    
    //OLD
    
    var photos = [
        "images1",
        "image2",
        "images3",
        "images4",
        "restaurant"
    ]
    
    var restaurantList  = [
        "Cafe Deadend",
        "Homei",
        "Teakha",
        "Cafe Loisl",
        "Petite Oyster"
    ]
    
    var category = [
        "Coffee & Tea Shop",
        "Cafe",
        "Tea House",
        "Austrian / Casual Drink",
        "French"
    ]
    
    var country = [
        "Hong Kong",
        "Hong Kong",
        "Hong Kong",
        "Hong Kong",
        "Hong Kong"
    ]
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(list.indices, id: \.self) { index in
                    
                    ZStack(alignment: .leading) {
                        NavigationLink(destination: RestaurantDetailView(restaurant: list[index])) {
                            EmptyView()
                        }
                        .opacity(0)
                        
                        BasicTextImageRow(restaurant: $list[index])
                    }

                }
                .onDelete(perform: { indexSet in
                    list.remove(atOffsets: indexSet)
                })
                
                .listRowSeparator(.hidden)
            }
            
            .listStyle(.plain)
            
            .navigationTitle("FoodPin")
            .navigationBarTitleDisplayMode(.automatic)
        }
        .accentColor(.white)
    }
}

struct BasicTextImageRow: View {
        
    @Binding var restaurant: Restaurnat
    
    
    @State private var showOptions = false
    @State private var showError = false
    
    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            Image(restaurant.image)
                .resizable()
                .frame(width: 120, height: 118)
                .cornerRadius(20)
            
            VStack(alignment: .leading) {
                Text(restaurant.title)
                    .font(.system(.title2, design: .rounded))
                
                Text(restaurant.type.rawValue)
                    .font(.system(.body, design: .rounded))
                
                Text(restaurant.location)
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundColor(.gray)
            }
            
            if restaurant.isFavorite {
                Spacer()
                
                Image(systemName: "heart.fill")
                    .foregroundColor(.yellow)
            }
        }
        .contextMenu {
            
            Button(action: {
                self.showError.toggle()
            }) {
                HStack {
                    Text("Reserve a table")
                    Image(systemName: "phone")
                }
            }
            
            Button(action: {
                self.restaurant.isFavorite.toggle()
            }) {
                HStack {
                    Text(restaurant.isFavorite ? "Remove from favorites" : "Mark as favorite")
                    Image(systemName: "heart")
                }
            }
            
            Button(action: {
                self.showOptions.toggle()
            }) {
                HStack {
                    Text("Share")
                    Image(systemName: "square.and.arrow.up")
                }
            }
        }
        .alert("Not yet available", isPresented: $showError) {
            Button("OK") {}
        } message: {
            Text("Sorry, this feature is not available yet. Please retry later.")
        }
        .sheet(isPresented: $showOptions) {
            
            let defaultText = "Just checking in at \(restaurant.title)"
            
            if let imageToShare = UIImage(named: restaurant.image) {
                ActivityView(activityItems: [defaultText, imageToShare])
            } else {
                ActivityView(activityItems: [defaultText])
            }
        }
    }
}

struct FullImageRow: View {
    
    var imageName: String
    var name: String
    var type: String
    var location: String
    
    @Binding var isFavorite: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .cornerRadius(20)
            
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text(name)
                        .font(.system(.title2, design: .rounded))
                        
                    Text(type)
                        .font(.system(.body, design: .rounded))
                    
                    Text(location)
                        .font(.system(.subheadline, design: .rounded))
                        .foregroundColor(.gray)
                }
                
                if isFavorite {
                    Spacer()
                    
                    Image(systemName: "heart.fill")
                        .foregroundColor(.yellow)
                }

            }
            .padding(.horizontal)
            .padding(.bottom)
        }
    }
}
#Preview {
    RestaurantListView()
}
