//
//  GameView.swift
//  ArriGame
//
//  Created by Arrinal Sholifadliq on 11/09/21.
//

import SwiftUI
import SwURL

struct GameView: View {
    @EnvironmentObject var dataViewModel: GetDataViewModel
    
    var body: some View {
        List {
            ForEach(dataViewModel.datas) { result in
                HStack {
                    RemoteImageView(url: URL(string: result.background_image) ?? URL(string: "https://2.bp.blogspot.com/-7-shYuJQqn0/WfB2lCRFB3I/AAAAAAAAAcY/0SrOJlGlqk4ArEJRTjnK5JKcQ0cG7aGtQCLcBGAs/s200/Broken%2BImage.gif")!, placeholderImage: Image(systemName: "photo"), transition: .custom(transition: .opacity, animation: .easeIn(duration: 0.25)))
                        .frame(width: 100, height: 100, alignment: .leading)
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.orange, lineWidth: 4))
                        .shadow(radius: 1)
                    
                    VStack(alignment: .leading) {
                        Text(result.name)
                            .bold()
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Released Date")
                                Text("Rating")
                            }
                            VStack(alignment: .leading) {
                                Text(":  \(result.released)")
                                HStack {
                                    Text(":  \(result.rating)")
                                    Image("StarFill")
                                        .padding(.top, 0.5)
                                }
                                
                            }
                        }.font(.caption)
                    }
                }
                
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView().environmentObject(GetDataViewModel())
    }
}
