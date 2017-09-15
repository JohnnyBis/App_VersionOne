//
//  MainTabBar.swift
//  Bar_Gain
//
//  Created by Gianmaria Biselli on 9/15/17.
//  Copyright © 2017 Gianmaria Biselli. All rights reserved.
//

import UIKit

class MainTabBar: UITabBar {
    var cleanDone = false
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.deleteUnusedViews()
    }
    
    func deleteUnusedViews() {
        if !self.cleanDone {
            var removeCount = 0
            for (_, eachView) in (self.subviews.enumerated()) {
                if NSStringFromClass(eachView.classForCoder).range(of: "_UIBarBackground") != nil {
                    eachView.removeFromSuperview()
                    removeCount += 1
                }
                if removeCount == 2 {
                    self.cleanDone = true
                    break
                }
            }
        }
    }
}
