//
//  ContentView.swift
//  ArriGame
//
//  Created by Arrinal Sholifadliq on 11/09/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var dataViewModel = GetDataViewModel()
    @StateObject var dataDetailViewModel = GetDataDetailViewModel()
    @StateObject var dataSearchViewModel = GetDataSearchViewModel()
    
    var body: some View {
        
        TabView {
            NavigationView {
                GameView()
                    .navigationTitle("ArriGame")
            }
            .tabItem {
                Label("Home", image: "HomeIcon")
            }
            
            NavigationView {
                SearchView()
                    .navigationTitle("ArriGame")
            }
            .tabItem {
                Label("Search", image: "SearchIcon")
            }
            
            
            ProfileView()
                .tabItem {
                    Label("Profile", image: "ProfileIcon")
                }
            
        }
        .environmentObject(dataDetailViewModel)
        .environmentObject(dataViewModel)
        .environmentObject(dataSearchViewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
