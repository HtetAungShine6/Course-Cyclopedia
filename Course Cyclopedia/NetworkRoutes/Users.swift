//
//  Users.swift
//  Course Cyclopedia
//
//  Created by Akito Daiki on 28/05/2024.
//

import Foundation

// MARK: - Just a demo ... Can delete later!!
class GetAllUsers: APIManager {
//    var eventId: Int
    typealias ModelType = Subject
//    init(eventId: Int) {
//        self.eventId = eventId
//    }
    var methodPath: String {
        return "/users/getallusers"
    }
}
