//
//  TestView.swift
//  Course Cyclopedia
//
//  Created by Akito Daiki on 07/05/2024.
//

import SwiftUI

struct TestView: View {
    @ObservedObject var vm = GoogleAuthenticationViewModel()
    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Button{
            signInWithGoogle()
        }label: {
            ZStack{
                Rectangle()
                    .foregroundColor(.white)
                    .cornerRadius(30)
                    .shadow(color: .gray, radius: 6, x: 0, y: 2)
                    .frame(maxWidth: 350, maxHeight: 60)
                    .padding()
                HStack{
//                    Image("google")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(maxWidth: 50, maxHeight: 50)
                    Text("Sign In with Google")
                        .tint(Color.black)
                        .font(.title3)
                        .fontWeight(.bold)
                }
            }

        }
    }
    
    private func signInWithGoogle(){
        vm.signInWithGoogle(presenting: Application_utility.rootViewController) { error, isNewUser in
            DispatchQueue.main.async {
                if let error = error {
//                    self.errorMessage = error.localizedDescription
                    return
                }
            }
        }
    }
}

#Preview {
    TestView()
}
