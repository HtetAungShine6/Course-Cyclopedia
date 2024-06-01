//
//  DetailView.swift
//  Course Cyclopedia
//
//  Created by Austin Xu on 2024/6/1.
//

import SwiftUI

struct DetailView: View {
    
    @State var thumbup: Bool = false
    @State var starred: Bool = false
    @State var subject: Subject
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            StickyHeader(minHeight: 200) {
                ZStack{
                    Color(red: 35/255, green: 45/255, blue: 50/255)
                    VStack {
                        Text(subject.subjectId)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Text(subject.subjectName)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }
                }
            }
            
            ZStack{
                professor_card
            }.offset(y: -80)
            
            VStack(alignment: .leading, spacing: 5){
                
                HStack(alignment: .center){
                    Text("Professor")
                        .font(.title2)
                        .fontWeight(.semibold)
                }
                Text(subject.professor)
                    .font(.system(size: 16))
                    .foregroundStyle(.black.opacity(0.7))
                
                HStack(alignment: .center){
                    Text("Description")
                        .font(.title2)
                        .fontWeight(.semibold)
                }
                Text(subject.description)
                    .font(.system(size: 16))
                    .foregroundStyle(.black.opacity(0.7))
                
                HStack(alignment: .center){
                    Text("Location")
                        .font(.title2)
                        .fontWeight(.semibold)
                }
                Text(subject.campus)
                    .font(.system(size: 16))
                    .foregroundStyle(.black.opacity(0.7))
                
            }.frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .topLeading
              )
//                .background(.blue)
                .padding(.horizontal)
                .offset(y: -40)
            
        }
    }
    
    private var professor_card: some View{
        RoundedRectangle(cornerRadius: 20)
            .frame(width: 330, height: 150)
            .foregroundStyle(.white)
            .shadow(color: .gray, radius: 2, x: 1, y: 1)
            .overlay(content: {
                VStack{
                    HStack{
                        VStack{
                            Text("\(subject.credit)")
                                .fontWeight(.semibold)
                                .font(.title3)
                                .foregroundStyle(Color.fontColor)
                            Text("Credit")
                                .font(.body)
                                .foregroundStyle(.gray)
                        }.frame(width: 150, height: 70)
                        Spacer()
                            .frame(width: 10)
                        VStack(){
                            Text(subject.programType)
                                .fontWeight(.semibold)
                                .font(.title3)
                                .foregroundStyle(Color.fontColor)
                            Text("Program")
                                .font(.body)
                                .foregroundStyle(.gray)
                        }.frame(width: 150, height: 70)
                    }
                    Rectangle().frame(width: 240, height: 1)
                        .foregroundStyle(.gray)
                    HStack(alignment: .center){
                        Button(action: {
                            self.thumbup.toggle()
                        }, label: {
                            Image(systemName: thumbup ? "hand.thumbsup.fill": "hand.thumbsup")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                        }).foregroundStyle(.gray)
                        Text("2.6k")
                            .font(.caption)
                            .foregroundStyle(.black)
                            .fontWeight(.semibold)
                            
                        Spacer().frame(width: 60)
                        
                        Button(action: {
                            self.starred.toggle()
                        }, label: {
                            Image(systemName: starred ? "star.fill" : "star")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                                .foregroundStyle(.gray)
                        })
                        
                        Text("1.6k")
                            .font(.caption)
                            .foregroundStyle(.black)
                            .fontWeight(.semibold)
                    }.padding(.vertical, 10)
                }
            })
    }
}

#Preview {
    DetailView(subject: Subject(subjectId: "CSX2009", subjectName: "Cloud Computing", description: "Description", professor: "Thanachai", campus: "Suvarnabhumi", credit: 3, programType: "Bachelor", prerequisite: "None", corequisite: "None", isInWishlist: false))
}



struct StickyHeader<Content: View>: View {

    var minHeight: CGFloat
    var content: Content
    
    init(minHeight: CGFloat = 200, @ViewBuilder content: () -> Content) {
        self.minHeight = minHeight
        self.content = content()
    }
    
    var body: some View {
        GeometryReader { geo in
            if(geo.frame(in: .global).minY <= 0) {
                content
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
            } else {
                content
                    .offset(y: -geo.frame(in: .global).minY)
                    .frame(width: geo.size.width, height: geo.size.height + geo.frame(in: .global).minY)
            }
        }.frame(minHeight: minHeight)
        // original minHeight
    }
}
