//
//  InterfaceController.swift
//  Productivity Timer Apple Watch WatchKit Extension
//
//  Created by Albert Saucedo on 12/1/14.
//  Copyright (c) 2014 Albert Saucedo. All rights reserved.
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {

    @IBOutlet weak var lblTimer: WKInterfaceTimer!
    @IBOutlet weak var btnProductivity: WKInterfaceButton!

    var timerHasFinished : NSTimer?
    var productivityTime : NSTimeInterval = 3
    var resetTime : NSTimeInterval = 2
    var isReset = false

    override init(context: AnyObject?) {
        // Initialize variables here.
        super.init(context: context)

        // Configure interface objects here.
        NSLog("%@ init", self)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        NSLog("%@ will activate", self)
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        NSLog("%@ did deactivate", self)
        super.didDeactivate()
    }
    @IBAction func onProductivityButtonPressed() {
        if isReset == false{
            btnProductivity.setColor(UIColor(red:0.89, green:0, blue:0.12, alpha:1))
            btnProductivity.setTitle("Werk Time!")
        } else if isReset == true{
            btnProductivity.setColor(UIColor(red:0.89, green:0, blue:0.12, alpha:1))
            btnProductivity.setTitle("Break Time!")
        }

        lblTimer.setDate(NSDate(timeIntervalSinceNow: productivityTime))
        lblTimer.start()

        timerHasFinished = NSTimer.scheduledTimerWithTimeInterval(productivityTime, target: self, selector: Selector("productivityFinished:"), userInfo: nil, repeats: false)
    }

    func productivityFinished(timer : NSTimer){
        if isReset == false{
            btnProductivity.setColor(UIColor(red:0.05, green:0.17, blue:0.2, alpha:1))
            btnProductivity.setTitle("Take a Break!")
            isReset = true
        } else if isReset == true {
            btnProductivity.setColor(UIColor(red:0.05, green:0.17, blue:0.2, alpha:1))
            btnProductivity.setTitle("Back to werk!")
            isReset = false
        }
        // Add Sound!
    }
}