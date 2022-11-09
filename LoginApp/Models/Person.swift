//
//  Personal.swift
//  LoginApp
//
//  Created by Eugene on 9.11.22.
//

struct User {
    let username: String
    let password: String
    var person: Person?
}

struct Person {
    let name: String
    let surname: String
    let age: Int
    let work: String
    let description: String
}

extension User {
    static func getUserInfo() -> User {
        User(username: "User",
             password: "qwe",
             person: .getUserPerson())
    }
}

extension Person {
    static func getUserPerson() -> Person {
        Person(name: "Eugene",
               surname: "Yushkevich",
               age: 42,
               work: "Learning :)",
               description: "My description")
    }
}
