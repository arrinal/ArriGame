//
//  ProfileView.swift
//  ArriGame
//
//  Created by Arrinal Sholifadliq on 11/09/21.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
         Image("BackgroundProfile")
            .resizable(resizingMode: .stretch)
            .ignoresSafeArea()
            
            VStack {
                Image("Profile")
                    .resizable()
                    .frame(width: 150, height: 150, alignment: .center)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color(.white), lineWidth: 4))
                    .shadow(radius: 5)
                
                Text("Arrinal Sholifadliq").fontWeight(.bold)
                Text("iOS Developer").padding(.bottom)
                
                VStack {
                    Text("Hi! My name is Arrinal Sholifadliq. Passionate and Excited. I may be shy and quiet in public. But my passion should not be underestimated. Open-minded, flexible, and ingenuity is a must.")
                        .foregroundColor(.black)
                        .font(.callout)
                        .shadow(radius: 100)
                        .multilineTextAlignment(.center)
                        .padding()
                }
                .frame(minWidth: 100, maxWidth: 350, minHeight: 100, maxHeight: 180)
                .background(Color(.white))
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                .shadow(color: Color.white.opacity(0.3), radius: 20, x: 0, y: 10)
            }
            .foregroundColor(.white)
            
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
