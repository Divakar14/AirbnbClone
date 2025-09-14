//
//  ContentView.swift
//  AirbnbClone
//
//  Created by Divakar T R on 04/09/25.
//

import SwiftUI


struct ContentView: View {
    
    @State private var selectedTab:Int = 0
    @StateObject private var tabManager = TabManager()
    
    @Binding var showSignInView: Bool
    
    var body: some View {
        
        VStack{
            
            TabView(selection: $tabManager.selectedTab){
                NavigationStack{
                    ExploreView()
                }
                .tabItem{
                    Image(systemName:"magnifyingglass")
                    Text("Explore")
                }
                .tag(TabManager.Tab.explore)
                
                NavigationStack{
                    WishlistView()
                }
                .tabItem{
                    Image(systemName:"heart")
                    Text("Wishlists")
                }
                .tag(TabManager.Tab.wishlist)
                
                NavigationStack{
                    TripsView()
                }
                .tabItem{
                    Image("Airbnb")
                        .renderingMode(.template)
                    Text("Trips")
                }
                .tag(TabManager.Tab.trips)
                
                NavigationStack{
                    MessagesView()
                }
                .tabItem{
                    Image(systemName: "bubble.left")
                    Text("Messages")
                }
                .tag(TabManager.Tab.messages)
                
                NavigationStack{
                    ProfileViews(showSignInView: $showSignInView)
                }
                .tabItem{
                    Image(systemName: "person.circle")
                    Text("Profile")
                }
                .tag(TabManager.Tab.profile)
                .badge("")
                
            }
            .environmentObject(tabManager)
            .tint(Theme.warning)
        }
        
    }
}
#Preview {
    ContentView(showSignInView: .constant(false))
}
