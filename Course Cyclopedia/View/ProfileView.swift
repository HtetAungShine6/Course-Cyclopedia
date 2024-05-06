//
//  ProfileView.swift
//  Course Cyclopedia
//
//  Created by Akito Daiki on 02/05/2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationStack{
            VStack{
                Image("logo")
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
        NavigationLink {
            WishlistView()
        } label: {
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
    
    private var logoutView: some View{
        Button{
            // action will be here
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
