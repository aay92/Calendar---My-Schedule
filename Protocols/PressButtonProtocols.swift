//
//  PressButtonProtocols.swift
//  CalendarMySchedule
//
//  Created by Aleksey Alyonin on 18.12.2022.
//

import Foundation

protocol PressReadyTaskButtonProtocols: AnyObject {
    func readyButtonTapped(indexPath: IndexPath)
}

protocol SwitchRepeatProtocols: AnyObject {
    func switchRepeat(value: Bool)
}
