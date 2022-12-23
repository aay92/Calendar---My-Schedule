//
//  UIAlertController + Ext.swift
//  CalendarMySchedule
//
//  Created by Aleksey Alyonin on 21.12.2022.
//

import UIKit

extension UIAlertController {
    
//    Убираю ошибки в алертах
    func negativeWidthConstraint(){
        for subView in self.view.subviews {
            for constraints in subView.constraints where constraints.debugDescription.contains("width == - 16") {
                subView.removeConstraint(constraints)
            }
        }
    }
}
