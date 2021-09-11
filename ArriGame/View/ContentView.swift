//
//  ContentView.swift
//  ArriGame
//
//  Created by Arrinal Sholifadliq on 11/09/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var dataViewModel = GetDataViewModel()
    
    var body: some View {
        
        TabView {
            NavigationView {
                GameView().environmentObject(dataViewModel)
                    .navigationTitle("ArriGame")
            }
            .tabItem {
                Label("Home", image: "HomeIcon")
            }
            
            
            ProfileView()
                .tabItem {
                    Label("Profile", image: "ProfileIcon")
                }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
