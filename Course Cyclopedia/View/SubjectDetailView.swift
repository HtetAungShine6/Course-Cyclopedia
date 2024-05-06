//
//  SubjectDetailView.swift
//  Course Cyclopedia
//
//  Created by Austin Xu on 2024/5/6.
//

import SwiftUI

struct SubjectDetailView: View {
    let subject: Subject
    
    var body: some View {
        
        HStack{
            VStack{
                Text("Subject ID")
                Text("Name")
                Text("Description")
                Text("Professor")
                Text("Campus")
                Text("Credits")
                Text("Program Type")
                Text("Prerequisite")
                Text("Corequisite")
            }.frame(maxWidth: 250)
                .background()
            
            Spacer()
            
            VStack{
                Text("1")
                Text("2")
                Text("3")
                Text("4")
                Text("5")
                Text("6")
                Text("7")
                Text("8")
                Text("9")
            }.frame(maxWidth: 250)
                .background(Color.appColor)
                .clipShape(RoundedRectangle(cornerRadius: 30))
        }
        .frame(maxWidth: 500, maxHeight: 300)
        
        .navigationBarTitleDisplayMode(.inline)
                .toolbar { // <2>
                    ToolbarItem(placement: .principal) { // <3>
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
    SubjectDetailView(subject: Subject(subjectId: "CSX2009", subjectName: "Cloud Computing", description: "Description", professor: "Thanachai", campus: "Suvarnabhumi", credit: 3, programType: "Bachelor", prerequisit: "None", corequisite: "None"))
}
