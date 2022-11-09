//
//  SignUp.swift
//  Cinema2
//
//  Created by Yaroslav Derbyshev on 19.01.2022.
//

import SwiftUI
struct SignUp: View {
    @EnvironmentObject var userViewModel : UserViewModel
    @State var flag: Bool = false
    @State var showingAlert = false
  
    var body: some View {
        ZStack{
            Color("main")
                .edgesIgnoringSafeArea(.all)
            VStack{
                Image("wd")
                Image("WorldCinema")
                    .padding()
                VStack{
                    CustomTextField(placeholder: Text("Имя"), text: $userViewModel.user.firstName, secure: false)
                .padding(.vertical, 10)
                .frame(width: 343, height: 44)
                .background(RoundedRectangle(cornerRadius: 4)
                .strokeBorder()
                .foregroundColor(Color("g")))
              
                    CustomTextField(placeholder: Text("Фамилия"), text: $userViewModel.user.lastName, secure: false)
                .padding(.vertical, 10)
                .frame(width: 343, height: 44)
                .background(RoundedRectangle(cornerRadius: 4)
                .strokeBorder()
                .foregroundColor(Color("g")))
                    CustomTextField(placeholder: Text("E-mail"), text: $userViewModel.user.email, secure: false)
                .padding(.vertical, 10)
                .frame(width: 343, height: 44)
                .background(RoundedRectangle(cornerRadius: 4)
                .strokeBorder()
                .foregroundColor(Color("g")))
                    CustomTextField(placeholder: Text("Пароль"), text: $userViewModel.user.password, secure: false)
                .padding(.vertical, 10)
                .frame(width: 343, height: 44)
                .background(RoundedRectangle(cornerRadius: 4)
                .strokeBorder()
                .foregroundColor(Color("g")))
                    CustomTextField(placeholder: Text("Подтвердите пароль"), text: $userViewModel.user.passwordRepeat, secure: false)
                .padding(.vertical, 10)
                .frame(width: 343, height: 44)
                .background(RoundedRectangle(cornerRadius: 4)
                .strokeBorder()
                .foregroundColor(Color("g")))
                }
                
               
                CustomButtonOrange(text:"Зарегистрироваться", action:
                  {
                    if userViewModel.user.firstName == "" || userViewModel.user.lastName == "" ||
                    userViewModel.user.email == "" ||
                    userViewModel.user.password == "" ||
                    userViewModel.user.passwordRepeat == ""
                    {
                    self.showingAlert = true
                    }
                    else {
                    userViewModel.registration()
                         }
                   } //action
                )
                    .alert(isPresented: $showingAlert)
                {
                    Alert(title: Text("Ошибка"), message: Text("Заполните все поля"), dismissButton: .default(Text("OK")))
                }
                CustomButtonFrame(text:"У меня уже есть аккаунт", action: {flag = true}
                )
                NavigationLink(destination: Main(), isActive: $userViewModel.isRegistr){
                    EmptyView()
                }
                
                NavigationLink(destination: SignIn(), isActive: $flag){
                    EmptyView()
                }
                    
            }
        } .navigationBarHidden(true)

    }
}
struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}

