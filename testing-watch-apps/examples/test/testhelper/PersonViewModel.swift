//
//  PersonViewModel.swift
//  test
//
//  Created by Boris Bügling on 08/07/2016.
//  Copyright © 2016 👹. All rights reserved.
//

import Foundation

public struct PersonViewModel {
    public let nameText: String
    public let birthdateText: String

    public init(model: Person?) {
        if let model = model {
            if model.salutation.characters.count > 0 {
                nameText = "\(model.salutation) \(model.firstName) \(model.lastName)"
            } else {
                nameText = "\(model.firstName) \(model.lastName)"
            }

            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEEE MMMM d, yyyy"
            birthdateText = dateFormatter.string(from: model.birthdate)
        } else {
            nameText = ""
            birthdateText = ""
        }
    }
}
