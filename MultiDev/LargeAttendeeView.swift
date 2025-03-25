//
//  LargeAttendeeView.swift
//  MultiDev
//
//  Created by Ming Bian on 2/24/25.
//

import SwiftUI

struct LargeAttendeeView: View {
    @State var attendeees = AttendeeModel().getAttendees()
    @State var columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    let portraitColumns = [GridItem(.flexible()), GridItem(.flexible())]
    let landscapeColumns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    

    func updateLayout() {
        if UIDevice.current.orientation.isLandscape {
            columns = landscapeColumns
        }
        else{
            columns = portraitColumns
        }
    }
    
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
        .onAppear {
            updateLayout()
        }
        .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
            updateLayout()
            
        }
    }
}

#Preview {
    LargeAttendeeView()
}
