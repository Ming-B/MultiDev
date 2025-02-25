//
//  LargeAttendeeView.swift
//  MultiDev
//
//  Created by Brian Krupp on 2/24/25.
//

import SwiftUI

struct LargeAttendeeView: View {
    @State var attendeees = AttendeeModel().getAttendees()
    @State var columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 15) {
                    ForEach(attendeees) { attendee in
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
                }
                .padding()
            }
            .navigationTitle("Event Attendees")
        }
    }
}

#Preview {
    LargeAttendeeView()
}
