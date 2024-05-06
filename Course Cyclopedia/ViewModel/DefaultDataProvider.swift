//
//  DefaultDataProvider.swift
//  Course Cyclopedia
//
//  Created by Austin Xu on 2024/5/6.
//

import Foundation

class DefaultDataProvider {
    static func getDefaultSubjects() -> [Subject] {
        return [
            Subject(subjectId: "CSX2009", subjectName: "Cloud Computing", description: "Description", professor: "Thanachai", campus: "Suvarnabhumi", credit: 3, programType: "Bachelor", prerequisite: "None", corequisite: "None", isInWishlist: false),
            Subject(subjectId: "CSX3003", subjectName: "Data Structure & Algorithm", description: "Description", professor: "Thanachai", campus: "Suvarnabhumi", credit: 3, programType: "Bachelor", prerequisite: "None", corequisite: "None",isInWishlist: false),
            Subject(subjectId: "CSX3004", subjectName: "Programming Languages", description: "Description", professor: "Thanachai", campus: "Suvarnabhumi", credit: 3, programType: "Bachelor", prerequisite: "None", corequisite: "None",isInWishlist: false),
            Subject(subjectId: "CSX3005", subjectName: "Computer Networks", description: "Description", professor: "Thanachai", campus: "Suvarnabhumi", credit: 3, programType: "Bachelor", prerequisite: "None", corequisite: "None",isInWishlist: false),
            Subject(subjectId: "CSX3009", subjectName: "Algorithm Design", description: "Description", professor: "Thanachai", campus: "Suvarnabhumi", credit: 3, programType: "Bachelor", prerequisite: "None", corequisite: "None",isInWishlist: false),
        ]
    }
}
