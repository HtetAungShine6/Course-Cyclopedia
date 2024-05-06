//
//  SubjectDetailView.swift
//  Course Cyclopedia
//
//  Created by Austin Xu on 2024/5/6.
//

import SwiftUI

struct SubjectDetailView: View {
    @State var subject: Subject
    
    var body: some View {
        VStack{
            HStack{
                VStack(alignment: .leading, spacing: 20){
                    Text("Subject ID")
                    Text("Name")
                    Text("Description")
                    Text("Professor")
                    Text("Campus")
                    Text("Credits")
                    Text("Program Type")
                    Text("Prerequisite")
                    Text("Corequisite")
                }.frame(maxWidth: 140, alignment: .leading)
                    .foregroundStyle(Color.fontColor)
                    .fontWeight(.semibold)
                    .background()
                // The alignment is not correct with long text, need to fix this
                // UI design is hard to do alignment
                VStack(alignment: .leading, spacing: 20){
                    HStack{
                        Text(subject.subjectId)
                        Spacer()
                        Image(systemName: subject.isInWishlist ? "heart.fill" : "heart")
                    }
                    Text(subject.subjectName)
                    Text(subject.description)
                    Text(subject.professor)
                    Text(subject.campus)
                    Text("\(subject.credit)")
                    Text(subject.programType)
                    Text(subject.prerequisite)
                    Text(subject.corequisite)
                }.frame(maxWidth: 300,maxHeight: 460, alignment: .leading)
                    .padding()
                    .background(Color.appColor)
                    .foregroundStyle(.white)
                    .font(.body)
                    .fontWeight(.semibold)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
            }
            VStack(alignment: .leading){
                Text("Faculty")
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.fontColor)
                    .padding(.vertical, 10)
                RoundedRectangle(cornerRadius: 20)
                    .frame(maxHeight: 80)
                    .foregroundStyle(Color.appColor)
            }.frame(maxWidth: .infinity)
            
            Button(action: {
                self.subject.isInWishlist.toggle()
            }) {
                Text(self.subject.isInWishlist ? "Remove": "Wishlist")
                    .foregroundColor(self.subject.isInWishlist ? Color.fontColor : .white)
                    .font(.system(size: 16, weight: .semibold))
                    .frame(maxWidth: 100, minHeight: 42)
                    .background(self.subject.isInWishlist ? .white : Color.fontColor)
                    .cornerRadius(40)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(Color.appColor, lineWidth: 1) // Adjust the width as needed
                    )
                    .shadow(color: Color.shadowColor, radius: 5, x: 0, y: 8)
                    .padding(.vertical, 15)
            }

        }.frame(maxWidth: 360)
        
        
        .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text(subject.subjectId).font(.headline.bold())
                            .foregroundStyle(Color.fontColor)
                        Text(subject.subjectName).font(.subheadline)
                            .foregroundStyle(Color.fontColor)

                    }
                }
            }
    }
}

#Preview {
    SubjectDetailView(subject: Subject(subjectId: "CSX2009", subjectName: "Cloud Computing", description: "Description", professor: "Thanachai", campus: "Suvarnabhumi", credit: 3, programType: "Bachelor", prerequisite: "None", corequisite: "None", isInWishlist: false))
}
