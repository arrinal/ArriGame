//
//  SearchView.swift
//  ArriGame
//
//  Created by Arrinal Sholifadliq on 12/09/21.
//

import SwiftUI
import SwURL

struct SearchView: View {
    @EnvironmentObject var dataSearchViewModel: GetDataSearchViewModel
    
    var body: some View {
        
        VStack {
            TextField("Search your game...", text: $dataSearchViewModel.searchText, onCommit:  {
                dataSearchViewModel.searchResult = []
                dataSearchViewModel.addData()
            })
            .padding(.init(top: 11.5, leading: 10, bottom: 11.5, trailing: 10))
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 9)
                    .stroke(Color.gray, lineWidth: 0.5)
            )
            .padding(.top)
            .padding(.leading, 20)
            .padding(.trailing, 20)
            
            List {
                ForEach(dataSearchViewModel.searchResult, id: \.self) { result in
                    NavigationLink(destination: DetailView(slug: result.slug), label: {
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
                                }
                                .font(.caption)
                            }
                        }
                    })
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView().environmentObject(GetDataSearchViewModel())
    }
}
