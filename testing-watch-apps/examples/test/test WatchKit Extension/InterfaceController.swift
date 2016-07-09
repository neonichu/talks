//
//  InterfaceController.swift
//  test WatchKit Extension
//
//  Created by Boris Bügling on 08/07/2016.
//  Copyright © 2016 👹. All rights reserved.
//

import WatchKit
import Foundation
import testhelper


class InterfaceController: WKInterfaceController {
    @IBOutlet var birthdateLabel: WKInterfaceLabel!
    @IBOutlet var nameLabel: WKInterfaceLabel!

    override func awake(withContext context: AnyObject?) {
        super.awake(withContext: context)

        let model = Person(salutation: "", firstName: "Neo", lastName: "Nacho", birthdate: Date(timeIntervalSince1970: 783734843))
        let viewModel = PersonViewModel(model: model)

        birthdateLabel.setText(viewModel.birthdateText)
        nameLabel.setText(viewModel.nameText)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
