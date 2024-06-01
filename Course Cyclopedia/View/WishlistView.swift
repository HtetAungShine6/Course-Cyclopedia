//
//  WishlistView.swift
//  Course Cyclopedia
//
//  Created by Austin Xu on 2024/5/6.
//

import SwiftUI

struct WishlistView: View {
    
//    let viewModel = AllSubjectsViewModel()
    @ObservedObject var viewModel = AllSubjectsViewModel()
        
    var body: some View {
                
        ScrollView(.vertical){
            VStack{
                ForEach(viewModel.subjects, id: \.self){ subject in
                    RoundedRectangle(cornerRadius: 20)
                        .frame(maxWidth: .infinity, minHeight: 80)
                        .foregroundStyle(Color.appColor)
                        .shadow(color: Color.shadowColor, radius: 5, x: 0,y: 8)
                        .overlay(content: {
                            HStack{
                                Image("vms_logo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 70, height: 70)
                                    .padding(.leading, 10)
                                
                                VStack(alignment: .leading){
                                    Text(subject.subjectId)
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                    Text(subject.subjectName)
                                }.foregroundStyle(.white)
                                
                                Spacer()
                                
                                NavigationLink {
                                    // New view
                                    DetailView(subject: subject)
//                                    SubjectDetailView(subject: subject)
                                } label: {
                                    Image(systemName: "chevron.forward.circle")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 40, height: 40)
                                        .foregroundStyle(.white)
                                        .padding(.horizontal, 20)
                                }
                            }
                        })
                        .padding(.horizontal, 15)
                        .padding(.vertical, 8)
                }
            }
        }
        
        
        
        .navigationTitle("Wishlist")
    }
}

extension WishlistView{
    
}

#Preview {
    WishlistView()
}
