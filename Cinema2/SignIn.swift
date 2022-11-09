//
//  SignIn.swift
//  Cinema2
//
//  Created by Yaroslav Derbyshev on 19.01.2022.
//

import SwiftUI
struct SignIn: View {
    @EnvironmentObject var userViewModel : UserViewModel
    
    @State var flag: Bool = false


    var body: some View {
    
        ZStack{
            Color("main")
                .edgesIgnoringSafeArea(.all)
            VStack{
                Image("wd")
                Image("WorldCinema")
                    .padding()
                
                CustomTextField(placeholder: Text("E-mail"), text: $userViewModel.user.email, secure: false)
                    .padding(.vertical, 10)
                    .frame(width: 343, height: 44)
                    .background(RoundedRectangle(cornerRadius: 4)
                                    .strokeBorder()
                                    .foregroundColor(Color("g")))
                    .padding(.top, 100.0)
                CustomTextField(placeholder: Text("Пароль"), text: $userViewModel.user.password, secure: false)
                    .padding(.vertical, 10)
                    .frame(width: 343, height: 44)
                    .background(RoundedRectangle(cornerRadius: 4)
                                    .strokeBorder()
                                    .foregroundColor(Color("g")))
                CustomButtonOrange(text:"Войти", action: {userViewModel.auth()}
                )
                CustomButtonFrame(text:"Регистрация", action: {flag = true}
                )
              
                NavigationLink(destination: Main(),
                               isActive: $userViewModel.isRegistr){
                    EmptyView()
                }
                NavigationLink(destination: SignUp(), isActive: $flag){
                    EmptyView()
                }
                
            }
        } .navigationBarHidden(true)
    }
    
    
}
struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}
