//
//  reviewTracker.swift
//  USA Tip Calc
//
//  Created by Developer on 02/09/2018.
//  Copyright © 2018 Mark Tiddy Media. All rights reserved.
//

import Foundation
import StoreKit

//Variable for run count
let runIncrementerSetting = "numberOfRuns"
let minimumRunCount = 5



//Create a run counter function

func incrementAppRuns() {
    let usD = UserDefaults()
    let runs = getRunCounts() + 1
    usD.setValuesForKeys([runIncrementerSetting: runs])
    usD.synchronize()
    
}

func getRunCounts() -> Int {
    let usD = UserDefaults()
    let savedRuns = usD.value(forKey: runIncrementerSetting)
    
    var runs = 0
    if (savedRuns != nil) {
        
        runs = savedRuns as! Int
    }
    
    print("Run counts are \(runs)")
    return runs
}

//Now to check to run the function
func showReview() {
    
    let runs = getRunCounts()
    
    print("Show Review")
    
    if (runs > minimumRunCount) {
        
        if #available(iOS 10.3, *) {
            print("Review Requested")
            SKStoreReviewController.requestReview()
            
        } else {
            //fallback on earlier versions
        }
    } else {
        print("Not enough runs")
}
}
