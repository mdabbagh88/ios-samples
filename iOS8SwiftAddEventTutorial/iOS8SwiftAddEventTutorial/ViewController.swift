//
//  ViewController.swift
//  iOS8SwiftAddEventTutorial
//
//  Created by Arthur Knopper on 18/01/15.
//  Copyright (c) 2015 Arthur Knopper. All rights reserved.
//

import UIKit
import EventKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1
        let eventStore = EKEventStore()
        
        // 2
        switch EKEventStore.authorizationStatus(for: .event) {
        case .authorized:
            insertEvent(store: eventStore)
        case .denied:
            print("Access denied")
        case .notDetermined:
            // 3
            eventStore.requestAccess(to: .event, completion: { [weak self] (granted, error) in
                if granted {
                    self?.insertEvent(store: eventStore)
                } else {
                    print("Access denied")
                }
            })
        default:
            print("Case Default")
        }
    }
    
    func insertEvent(store: EKEventStore) {
        // 1
        let calendars = store.calendars(for: .event)
        
        for calendar in calendars {
            // 2
            if calendar.title == "ioscreator" {
                // 3
                let startDate = Date()
                // 2 hours
                let endDate = startDate.addingTimeInterval(2 * 60 * 60)
                
                // 4
                // Create Event
                let event = EKEvent(eventStore: store)
                event.calendar = calendar
                
                event.title = "New Meeting"
                event.startDate = startDate
                event.endDate = endDate
                
                // 5
                // Save Event in Calendar
                do {
                    try store.save(event, span: .thisEvent)
                } catch {
                    print("An error occured")
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

