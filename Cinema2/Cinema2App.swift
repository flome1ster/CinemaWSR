//
//  Cinema2App.swift
//  Cinema2
//
//  Created by Yaroslav Derbyshev on 19.01.2022.
//

import SwiftUI

@main
struct Cinema2App: App {
    @ObservedObject var userViewModel: UserViewModel = UserViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userViewModel)
        }
    }
}
