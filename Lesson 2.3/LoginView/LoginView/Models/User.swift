//
//  User.swift
//  LoginView
//
//  Created by trinity on 07.06.2022.
//

import Foundation

struct User {
    let userName: String
    let password: String
    let person: Person
    
    static func getUser() -> User {
        User(
            userName: "User",
            password: "1234",
            person: Person(
                name: "Valeriia",
                surname: "Kozachenko",
                age: 25,
                hobbies: [
                    "Snowboarding",
                    "Wake-surfing",
                    "Gym",
                    "Driving"
                ]
            )
        )
    }
}
