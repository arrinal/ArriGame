//
//  DetailView.swift
//  ArriGame
//
//  Created by Arrinal Sholifadliq on 12/09/21.
//

import SwiftUI
import SwURL

struct DetailView: View {
    @EnvironmentObject var dataDetailViewModel: GetDataDetailViewModel
    var slug: String
    
    var body: some View {
        ScrollView {
            VStack {
                Text(dataDetailViewModel.datas.name)
                    .font(.headline)
                RemoteImageView(url: URL(string: dataDetailViewModel.datas.background_image) ?? URL(string: "https://2.bp.blogspot.com/-7-shYuJQqn0/WfB2lCRFB3I/AAAAAAAAAcY/0SrOJlGlqk4ArEJRTjnK5JKcQ0cG7aGtQCLcBGAs/s200/Broken%2BImage.gif")!, placeholderImage: Image(systemName: "photo"), transition: .custom(transition: .opacity, animation: .easeIn(duration: 0.25)))
                    .scaledToFit()
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.orange, lineWidth: 4))
                    .shadow(radius: 1)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Released Date ")
                            .bold()
                            .font(.callout)
                        Text("Rating ")
                            .bold()
                            .font(.callout)
                    }
                    
                    VStack(alignment: .leading) {
                        Text(": \(dataDetailViewModel.datas.released)")
                            .font(.callout)
                        HStack {
                            Text(": \(dataDetailViewModel.datas.rating)")
                            Image("StarFill")
                                .padding(.top, 0.5)
                        }
                    }
                    
                    Spacer()
                }
                
                HStack {
                    Text("\nDescription:")
                        .bold()
                        .font(.callout)
                    
                    Spacer()
                }
                
                Text(dataDetailViewModel.datas.description_raw.replacingOccurrences(of: "\r\n", with: "\n\n"))
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding()
        .onAppear(perform: {
            dataDetailViewModel.datas = DataTypeDetail(id: 0, description_raw: "", name: "", released: "", background_image: "", rating: "")
            dataDetailViewModel.addData(slug: slug)
        })
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(slug: "").environmentObject(GetDataDetailViewModel())
    }
}
