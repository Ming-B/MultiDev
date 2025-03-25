//
//  ContentView.swift
//  MultiDev
//
//  Created by Ming Bian on 2/24/25.
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
            //toolbar with clear button that makes sure a confirmation dialog is shown when trying to delete list of attendees
            .toolbar {
                Button("Clear", systemImage: "checkmark") {
                    showConfirmation = true
                        
                }
                //attach confirmationDialog to button because iPad is a larger screen
                .confirmationDialog("Confirm Delete?", isPresented: $showConfirmation) {
                    Button("Confirm all attendees?", role: .destructive) {
                        attendees = []
                        showConfirmation = false
                    }
                    Button("Cancel", role: .cancel) {
                        showConfirmation = false
                    }
                }
            }
        }
        
    }
}

#Preview {
    ContentView()
}
