//
//  MoviePage.swift
//  Cinema2
//
//  Created by Yaroslav Derbyshev on 24.01.2022.
//

import SwiftUI
struct MoviePage: View{
    @EnvironmentObject var userViewModel : UserViewModel
    @State var flag: Bool = false
    var body: some View{
        ZStack{
            Color("main")
                .edgesIgnoringSafeArea(.all)
            ScrollView(.vertical, showsIndicators: false){
                ZStack{
//                    AsyncImage(url: URL(string: "http://cinema.areas.su/up/images/" + userViewModel.getmovie.poster), scale: 0.92)
//                            .offset(y: -20)
//                            .edgesIgnoringSafeArea(.all)
//                    
                }
            }
        }.onAppear{userViewModel.MovieHeader()}
    }
}

struct MoviePage_Previews: PreviewProvider {
    static var previews: some View {
        MoviePage()
    }
}
