//
//  ContentView.swift
//  AirbnbClone
//
//  Created by Divakar T R on 04/09/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var seletedTab:Int = 0
    
    var body: some View {
        
        VStack{
            
            TabView(selection: $seletedTab){
                NavigationStack{
                    ExploreView()
                }
                .tabItem{
                    Image(systemName:"magnifyingglass")
                    Text("Explore")
                }
                .tag(0)
                
                NavigationStack{
                    WishlistView()
                }
                .tabItem{
                    Image(systemName:"heart")
                    Text("Wishlists")
                }
                .tag(1)
                
                NavigationStack{
                    TripsView()
                }
                .tabItem{
                    Image("Airbnb")
                        .renderingMode(.template)
                    Text("Trips")
                }
                .tag(2)
                
                NavigationStack{
                    MessagesView()
                }
                .tabItem{
                    Image(systemName: "bubble.left")
                    Text("Messages")
                }
                .tag(3)
                
                NavigationStack{
                    ProfileViews()
                }
                .tabItem{
                    Image(systemName: "person.circle")
                    Text("Profile")
                }
                .tag(4)
                .badge("")
                
            }
            .tint(Theme.warning)
        }
        
    }
}
#Preview {
    ContentView()
}
