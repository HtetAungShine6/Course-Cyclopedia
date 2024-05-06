//
//  Subject.swift
//  Course Cyclopedia
//
//  Created by Austin Xu on 2024/5/6.
//

import Foundation

struct Subject: Hashable{
    let subjectId: String
    let subjectName: String
    let description: String
    let professor: String
    let campus: String
    let credit: Int
    let programType: String
    let prerequisite: String
    let corequisite: String
    var isInWishlist: Bool
}
