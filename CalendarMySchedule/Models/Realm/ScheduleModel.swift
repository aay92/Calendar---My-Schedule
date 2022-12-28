//
//  ScheduleModel.swift
//  CalendarMySchedule
//
//  Created by Aleksey Alyonin on 28.12.2022.
//

import RealmSwift
import Foundation

class ScheduleModel: Object {
    @Persisted var scheduleDate = Date()
    @Persisted var scheduleTime = Date()
    @Persisted var scheduleName: String = ""
    @Persisted var scheduleType: String = ""
    @Persisted var scheduleBuilding: String = ""
    @Persisted var scheduleAudience: String = ""
    @Persisted var scheduleTeacher: String = "Name Lastname"
    @Persisted var scheduleColor: String = "FFFFFF"
    @Persisted var scheduleRepeat: Bool = true
    @Persisted var scheduleWeekday: Int = 1
}



