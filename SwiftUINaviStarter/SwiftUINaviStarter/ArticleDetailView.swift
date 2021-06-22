//
//  ArticleDetailView.swift
//  SwiftUINaviStarter
//
//  Created by 黃士豪 on 2021/6/22.
//

import Foundation
import SwiftUI
struct ArticleDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var article: Article
    var body: some View {
    ScrollView{
        VStack(alignment: .leading) {
            Image(article.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(5)
            
            Group{
            Text(article.title)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .lineLimit(3)
            Text("By \(article.author)".uppercased())
                .font(.subheadline)
                .foregroundColor(.secondary)
            }
            .padding(.bottom, 0)
            .padding()
            
            Text(article.content)
                .font(.body)
                .padding()
                .lineLimit(1000)
                .multilineTextAlignment(.leading)
        }
    }
    .edgesIgnoringSafeArea(.top)
    .navigationBarBackButtonHidden(true)
    .navigationBarItems(leading: Button(
        action: {
            //導覽回前一頁
            self.presentationMode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "chevron.left.circle.fill")
                .font(.largeTitle)
                .foregroundColor(.white)
        }
    ))
    }
}


struct ArticleDetailView_Previews:PreviewProvider {
    static var previews: some View{
        NavigationView{
        ArticleDetailView(article: articles[0])
        }
    }
}
