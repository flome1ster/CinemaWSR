//
//  ContentView.swift
//  Cinema2
//
//  Created by Yaroslav Derbyshev on 19.01.2022.
//

import SwiftUI
//import Alamofire


struct ContentView: View {
    @EnvironmentObject var userViewModel : UserViewModel
    @State private var isReg = UserDefaults.standard.bool(forKey: "isReg")
    var body: some View {
        NavigationView{
            if isReg {
                SignIn()
            }
            else
            {
                SignUp()
                
            }
        }.navigationBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
