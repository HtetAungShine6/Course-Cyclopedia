//
//  ProfileView.swift
//  Course Cyclopedia
//
//  Created by Akito Daiki on 02/05/2024.
//

import SwiftUI
import FirebaseAuth
import GoogleSignIn

struct ProfileView: View {
    
    @State private var path = NavigationPath()
    @State private var isSignedOut = false
    @ObservedObject private var viewModel = GoogleAuthenticationViewModel()
    
    var body: some View {
        NavigationStack(path: $path){
            VStack{
                Image("AppLogo")
                    .resizable()
                    .frame(width: 100, height: 100)
                Text("User Name")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.appColor)
                
                emailView
                    .padding(.vertical, 15)
                passwordView
                    .padding(.vertical, 15)
                wishlistView
                    .padding(.vertical, 15)
                phoneNoView
                    .padding(.vertical, 15)
                facultiesView
                    .padding(.vertical, 15)
                logoutView
                    .padding(.vertical, 15)
                footerView
            }
            
            //MARK: Handle navigation here
            .navigationDestination(for: String.self) { value in
                switch value{
                case "Wishlist":
                    WishlistView(path: $path)
                case "Ads_testing":
                    AdViewTest()
                default:
                    Text("Blank View")
                }
            }
        }
        
    }
}

extension ProfileView{
    private var emailView: some View{
        Text("Email")
            .font(.system(size: 16, weight: .semibold))
            .foregroundStyle(Color.fontColor)
            .frame(maxWidth: 300, minHeight: 42)
            .cornerRadius(15)
            .overlay {
                RoundedRectangle(cornerRadius: 40)
                    .stroke(Color.fontColor)
            }
    }
    
    private var passwordView: some View{
        Text("Password")
            .font(.system(size: 16, weight: .semibold))
            .foregroundStyle(Color.fontColor)
            .frame(maxWidth: 300, minHeight: 42)
            .cornerRadius(15)
            .overlay {
                RoundedRectangle(cornerRadius: 40)
                    .stroke(Color.fontColor)
            }
    }
    
    private var wishlistView: some View{
        NavigationLink(value: "Wishlist") {
            Text("Wishlist")
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(Color.fontColor)
                .frame(maxWidth: 300, minHeight: 42)
                .cornerRadius(15)
                .overlay {
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.fontColor)
                }
        }
    }
    
    private var phoneNoView: some View{
        Text("Phone Number")
            .font(.system(size: 16, weight: .semibold))
            .foregroundStyle(Color.fontColor)
            .frame(maxWidth: 300, minHeight: 42)
            .cornerRadius(15)
            .overlay {
                RoundedRectangle(cornerRadius: 40)
                    .stroke(Color.fontColor)
            }
    }
    
    private var facultiesView: some View{
        NavigationLink(value: "Ads_testing") {
            Text("Faculties")
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(Color.fontColor)
                .frame(maxWidth: 300, minHeight: 42)
                .cornerRadius(15)
                .overlay {
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.fontColor)
                }
        }
    }
    
    private var logoutView: some View{
        Button{
            isSignedOut.toggle()
        } label: {
            Text("Logout")
                .foregroundColor(.white)
                .font(.system(size: 16, weight: .semibold))
                .frame(maxWidth: 100, minHeight: 42)
                .background(Color.fontColor)
                .cornerRadius(40)
                .shadow(color: Color.shadowColor, radius: 5, x: 0,y: 8)
                .padding(.vertical, 15)
        }
        .alert("Are you sure you want to sign out?", isPresented: $isSignedOut){
            Button("OK"){
                viewModel.signOutWithGoogle()
            }
            Button("Cancel", role: .cancel){
                
            }
        }
    }
    
    private var footerView: some View{
        Text("Developed by ")
            .foregroundColor(.black)
        + Text("Seniorcitizens")
            .foregroundColor(Color.fontColor)
    }
}


#Preview {
    ProfileView()
}
