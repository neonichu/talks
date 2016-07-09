//
//  Person.swift
//  test
//
//  Created by Boris Bügling on 08/07/2016.
//  Copyright © 2016 👹. All rights reserved.
//

import Foundation

public struct Person {
    public let salutation: String
    public let firstName: String
    public let lastName: String
    public let birthdate: Date

    public init(salutation: String, firstName: String, lastName: String, birthdate: Date) {
        self.salutation = salutation
        self.firstName = firstName
        self.lastName = lastName
        self.birthdate = birthdate
    }
}
