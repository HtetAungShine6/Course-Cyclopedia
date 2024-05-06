//
//  AllSubjectsViewModel.swift
//  Course Cyclopedia
//
//  Created by Austin Xu on 2024/5/6.
//

import Foundation

class AllSubjectsViewModel {
    private(set) var subjects: [Subject]
    
    init() {
        let defaultSubjects = DefaultDataProvider.getDefaultSubjects()
        self.subjects = defaultSubjects
    }
}
