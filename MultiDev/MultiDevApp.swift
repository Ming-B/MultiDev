//
//  MultiDevApp.swift
//  MultiDev
//
//  Created by Brian Krupp on 2/24/25.
//

import SwiftUI

@main
struct MultiDevApp: App {
    var body: some Scene {
        WindowGroup {
            if UIDevice.current.userInterfaceIdiom == .pad {
                LargeAttendeeView()
            }
                
            else {
                ContentView()
            }
            //call the necessary view here for ipad, iphone, etc
            
        }
    }
}
