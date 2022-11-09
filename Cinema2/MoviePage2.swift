//
//  MoviePage.swift
//  Cinema2
//
//  Created by Yaroslav Derbyshev on 28.01.2022.
//

import SwiftUI
struct MoviePage2: View{
    @EnvironmentObject var userViewModel : UserViewModel
    @State var item : GetMovie? = nil
    @State var flag: Bool = false
    var body: some View{
        ZStack{
            Color("main")
                .edgesIgnoringSafeArea(.all)
        ScrollView{
                VStack{
                    ZStack{
                        AsyncImage(url: URL(string: "http://cinema.areas.su/up/images/" + item!.poster))
                        { image in
                            image.resizable()
                        } placeholder: {
                            Color.red
                        } .frame(width: 383, height: 400)
                      
                    }
                    Text("Описание")
                        .foregroundColor(Color.white)
                        .offset(x: -137)

                    Text(item!.description)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.leading)
                        .padding(.leading)
                    Text("Кадры")
                        .foregroundColor(Color.white)
                        .offset(x: -153)
                    ScrollView(.horizontal){
                        HStack{
                            ForEach(userViewModel.getmovie, id:\.self){item in
                                ForEach(item.images, id:\.self){item2 in
                                    AsyncImage(url: URL(string: "http://cinema.areas.su/up/images/" + item2))
                                    { image in
                                        image.resizable()
                                    } placeholder: {
                                        Color.red
                                    } .frame(width: 128, height: 72)
                                } .padding(.leading)
                            }
                        }
                    }
                }
            } .edgesIgnoringSafeArea(.all)
        } 
    }
}
struct MoviePage2_Previews: PreviewProvider {
    static var previews: some View {
        MoviePage2()
    }
}
