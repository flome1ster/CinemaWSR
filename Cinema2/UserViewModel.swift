//
//  UserViewModel.swift
//  Cinema2
//
//  Created by Yaroslav Derbyshev on 19.01.2022.
//

import Foundation
import Alamofire
struct AuthData: Codable{
    let token: Int
}

class UserViewModel : ObservableObject {
    @Published var user: User = User(firstName: "Ivan", lastName: "Ivanov", email: "Ivan@mail.ru", password: "qwerty", passwordRepeat: "qwerty")
    @Published var isRegistr : Bool = false
    @Published var authData: AuthData? = nil
    @Published var movie: Movie? = nil
    @Published var getmovie: [GetMovie] = []
    @Published var errorMessage: (Bool, String) = (false, "")
    
    
    func registration(){
        AF.request("http://cinema.areas.su/auth/register",
    method: .post,
    parameters: [
        "email": user.email,
        "password": user.password,
        "firstName": user.firstName,
        "lastName": user.lastName
                ])

            .responseString{response in
                if response.value != nil {
                    self.isRegistr = true
                    UserDefaults.standard.set(self.isRegistr, forKey: "isReg")
                }
                else {
                    self.errorMessage = (true, "Не удалось выполнить регистрацию")
                }

            }
    }
    
    func auth(){
        AF.request("http://cinema.areas.su/auth/login",
                   method: .post,
                   parameters: [ "email": user.email,
                                 "password": user.password]
                )
            .responseDecodable(of: AuthData.self){response in
                if response.value != nil {
                    self.authData = response.value
                    self.isRegistr = true
                }
                else {
                    self.errorMessage = (true, "Не удалось выполнить авторизацию")
                }
            }
    }
    func movieCover(){
        AF.request("http://cinema.areas.su/movies/cover")
            .responseDecodable(of: Movie.self){response in
                if response.value != nil {
                    self.movie = response.value!
                    //print("http://cinema.areas.su/up/images/" + self.movie!.foregroundImage)

                }
            }
    }
    func getNew(){
        AF.request("http://cinema.areas.su/movies?filter=new")
            .responseDecodable(of: [GetMovie].self){response in
                if response.value != nil {
                    self.getmovie = response.value!
                }
            }
    }
    func getTrend(){
        AF.request("http://cinema.areas.su/movies?filter=inTrend")
            .responseDecodable(of: [GetMovie].self){response in
                if response.value != nil {
                    self.getmovie = response.value!
                }
            }
    }
    func getMe(){
        AF.request("http://cinema.areas.su/movies?filter=forMe")
            .responseDecodable(of: [GetMovie].self){response in
                if response.value != nil {
                    self.getmovie = response.value!
                }
            }
    }
    func MovieHeader(){
        AF.request("http://cinema.areas.su/movies/36")
            .responseDecodable(of: [GetMovie].self){response in
                if response.value != nil {
                    self.getmovie = response.value!
                }
            }
    }
}
