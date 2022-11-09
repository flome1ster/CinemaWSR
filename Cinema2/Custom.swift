//
//  Custom.swift
//  Cinema2
//
//  Created by Yaroslav Derbyshev on 19.01.2022.
//

import SwiftUI
struct CustomTextField: View {
    var placeholder: Text
    @Binding var text: String
    var secure: Bool = false
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty { placeholder.foregroundColor(Color("g")).padding(.leading)
            }
            if self.secure {
                SecureField("", text: $text).padding(.leading).foregroundColor(.gray)
            } else {
                TextField("", text: $text).padding(.leading).foregroundColor(Color("g"))
            }
        }
    }
}
struct CustomButtonOrange: View {
    let text: String
    let action: () -> Void
    var body: some View {
        Button(action: action){
            Text(text)
            .padding()
            .frame(width: 343, height: 44)
            .background(Color("orange"))
            .cornerRadius(4)
            .foregroundColor(Color.white)
            
        }
    }
}

struct WatchButton: View {
    let text: String
    let action: () -> Void
    var body: some View {
        Button(action: action){
            Text(text)
            .padding()
            .frame(width: 134, height: 44)
            .background(Color("orange"))
            .cornerRadius(4)
            .foregroundColor(Color.white)
            
        }
    }
}

struct CustomButtonFrame: View {
    let text: String
    let action: () -> Void
    var body: some View {
        Button(action: action){
            Text(text)
            .padding()
            .frame(width: 343, height: 44)
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color("g"), lineWidth: 1)
            )
            .foregroundColor(Color("orange"))
            
        }
    }
}
