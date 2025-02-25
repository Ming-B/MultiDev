//
//  ContentView.swift
//  MultiDev
//
//  Created by Brian Krupp on 2/24/25.
//

import SwiftUI

struct ContentView: View {
    @State var attendees = AttendeeModel().getAttendees()
    @State var showConfirmation = false
    var body: some View {
        NavigationStack {
            List(attendees) { attendee in
                VStack {
                    HStack {
                        Text(attendee.lastName)
                        Text(attendee.firstName)
                            .foregroundStyle(.secondary)
                        Spacer()
                    }
                    HStack {
                        Text(attendee.email)
                        Spacer()
                    }
                    .foregroundStyle(.secondary)
                    .font(.caption)
                }
            }
            .navigationTitle("Event Attendees")
        }
        
    }
}

#Preview {
    ContentView()
}
