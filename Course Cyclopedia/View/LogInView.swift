//
//  LogInView.swift
//  Course Cyclopedia
//
//  Created by Akito Daiki on 02/05/2024.
//

import SwiftUI

struct LogInView: View {
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        VStack {
            Image("logo").resizable()
                .frame(width:150,height:150)
            Spacer().frame(height: 20)
            Text("Course")
                .foregroundColor(.appColor)
                .font(.title)
                .fontWeight(.bold)
            Text("cyclipedia")
                .foregroundColor(.appColor)
                .font(.body)
                .fontWeight(.bold)
            Spacer().frame(height: 100)
            TextField("Email",text : $email)
                .padding()
                .frame(width: 300,height: 50)
                .cornerRadius(50)
                .overlay(
                RoundedRectangle(cornerRadius: 50)
                    .stroke(Color.appColor,lineWidth:1.4)
                )
            Spacer().frame(height: 40)
            TextField("Password",text : $password)
                .padding()
                .frame(width: 300,height: 50)
                .cornerRadius(50)
                .overlay(
                RoundedRectangle(cornerRadius: 50)
                    .stroke(Color.appColor,lineWidth:1.4)
                )
            Spacer().frame(height: 50)
            Button("Sign in"){
                
            }
            .foregroundColor(.white)
            .frame(width: 100,height: 50)
            .background(Color.appColor)
            .cornerRadius(50)
            .shadow(color:.shadowColor,radius: 8,y:8)
            .fontWeight(.bold)
            Spacer().frame(height:40)
            HStack{
                Image("google").resizable()
                    .frame(width: 25,height: 25)
                Button("Sign in with Google"){
                    
                }
                .foregroundColor(.appColor)
                .fontWeight(.bold)
            }
        }
    }
}

#Preview {
    LogInView()
}
