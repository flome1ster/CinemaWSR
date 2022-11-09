//
//  Main.swift
//  Cinema2
//
//  Created by Yaroslav Derbyshev on 19.01.2022.
//

import SwiftUI
import AVKit


struct firstView: View{
    @State var tapped = 1
    @State var istap = 1
    @State var flag: Bool = false
    
    @EnvironmentObject var userViewModel : UserViewModel
    var body: some View{
        ZStack{
            Color("main")
                .edgesIgnoringSafeArea(.all)
            ScrollView(.vertical, showsIndicators: false){
                VStack{
                    ZStack{
                        if userViewModel.movie != nil{
                            AsyncImage(url: URL(string: "http://cinema.areas.su/up/images/" + userViewModel.movie!.foregroundImage), scale: 0.92)
                                .offset(y: -20)
                                .edgesIgnoringSafeArea(.all)
                        }
                        WatchButton(text: "Смотреть", action: {flag = true
                            
                        } )
                            .offset(y: 105)
                    }
                    NavigationLink(destination: MoviePage(), isActive: $flag){
                        EmptyView()
                    }
                    VStack{
                        HStack{
                            Button(action: {
                                userViewModel.getTrend()
                                self.istap = 1
                            }, label: {Text("В тренде")
                            })
                                .tag(1)
                            Spacer()
                            Button(action: {userViewModel.getNew()
                                self.istap = 2
                            }, label: {Text("Новое")})
                                .tag(2)
                            Spacer()
                            Button(action: {userViewModel.getMe()
                                self.istap = 3
                            }, label: {Text("Для Вас")})
                                .tag(3)
                            
                        }
                        .frame(width: 350, height: 50)
                        .frame(width: 390, height: 50)
                        .background(Color("lightp"))
                        if istap == 1 {
                            Rectangle()
                                .frame(width: 121, height: 3)
                                .foregroundColor(Color("orange"))
                                .offset(x: -135, y: -10)
                        } else if istap == 2 {
                            Rectangle()
                                .frame(width: 135, height: 3)
                                .foregroundColor(Color("orange"))
                                .offset(y: -10)
                        } else if istap == 3 {
                            Rectangle()
                                .frame(width: 121, height: 3)
                                .foregroundColor(Color("orange"))
                                .offset(x: 135, y: -10)
                        }
                        ScrollView(.horizontal){
                            HStack{
                                ForEach(userViewModel.getmovie, id:\.self){item in
                                    
                                    NavigationLink(destination: MoviePage2(item: item)) {
                                    AsyncImage(url: URL(string: "http://cinema.areas.su/up/images/" + item.poster))
                                    { image in
                                        image.resizable()
                                    } placeholder: {
                                        Color.red
                                    }
                                    }
                                        .frame(width: 100, height: 144)
                                    
                                }
                            } .padding(.leading)
                            .onAppear{userViewModel.getTrend()}
                        }
                        Text("Вы смотрели")
                            .font(.system(size: 24))
                            .fontWeight(.bold)
                            .foregroundColor(Color("orange"))
                            .padding(.leading, -180.0)
                        
                    } .offset(y: -20)
                }
            } .edgesIgnoringSafeArea(.all) //scrollview
        } .navigationBarHidden(true) //zstack
    }
}
struct secondView: View{
    private let player = AVPlayer(url: URL(string: "http://cinema.areas.su/up/video/videoplayback.mp4")!)
    @EnvironmentObject var userViewModel: UserViewModel
    var body: some View{
        VStack{
            VideoPlayer(player: player)
                       .onAppear() {
                           player.play()
                       }
            Text("2")
        }.onAppear{userViewModel.getNew()}
    }
}
struct thirdView: View{
    var body: some View{
        Text("3")
    }
}
struct fourthView: View{
    var body: some View{
        Text("4")
    }
}
struct Main: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color("bar"))
    }
    @EnvironmentObject var userViewModel : UserViewModel
    
    @State private var selectedView = 1
    var body: some View{
        ZStack{
            Color("main")
                .edgesIgnoringSafeArea(.all)
        TabView(selection: $selectedView){
            firstView()
                .tabItem{
                    Image("tv")
                    Text("Главное")}.tag(1)
            secondView()
                .tabItem{
                    Image("col")
                    Text("Подборка")}.tag(2)
            thirdView()
                .tabItem{
                    Image("fav")
                    Text("Коллекции")}.tag(3)
            fourthView()
                .tabItem{
                    Image("person")
                    Text("Профиль")}.tag(4)
        }
        .background(Color.black)
        .accentColor(Color("orange"))
                .onAppear{userViewModel.movieCover()}
            
        } .navigationBarHidden(true)
    }
}
struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
