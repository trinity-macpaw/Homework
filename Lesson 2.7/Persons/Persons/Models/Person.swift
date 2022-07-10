//
//  Person.swift
//  Persons
//
//  Created by trinity on 10.07.2022.
//

import Foundation

struct Person {
    let name: String
    let surname: String
    let phone: String
    let email: String
    
    var fullName: String {
        name + " " + surname
    }
    
    static func getRandomPersons() -> [Person] {
        var persons: [Person] = []

        let names = DataManager.names.shuffled()
        let surnames = DataManager.surnames.shuffled()
        let phones = DataManager.phones.shuffled()
        let emails = DataManager.emails.shuffled()
        
        for index in 0..<names.count {
            let person = Person(
                name: names[index],
                surname: surnames[index],
                phone: phones[index],
                email: emails[index]
            )
            persons.append(person)
        }
        
        return persons
    }
}
