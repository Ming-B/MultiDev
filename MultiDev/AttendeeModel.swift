//
//  AttendeeModel.swift
//  MultiDev
//
//  Created by Ming Bian on 2/24/25.
//

import Foundation

struct AttendeeModel {
    private let testAttendees: [Attendee] = (1...50).map { _ in
        let firstNames = ["John", "Jane", "Alex", "Emily", "Chris", "Katie", "Max", "Sarah", "Ryan", "Olivia"]
        let lastNames = ["Smith", "Johnson", "Williams", "Brown", "Jones", "Davis", "Miller", "Wilson", "Moore", "Taylor"]
        
        let randomFirstName = firstNames.randomElement()!
        let randomLastName = lastNames.randomElement()!
        let randomEmail = "\(randomFirstName.lowercased()).\(randomLastName.lowercased())@example.com"
        
        return Attendee(
            id: UUID(),
            firstName: randomFirstName,
            lastName: randomLastName,
            email: randomEmail
        )
    }
    
    func getAttendees() -> [Attendee] {
        // Way fo performing a custom sort
        return testAttendees.sorted { $0.lastName < $1.lastName }
    }
    
}
