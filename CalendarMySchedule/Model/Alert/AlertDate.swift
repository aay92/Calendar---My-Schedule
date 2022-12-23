//
//  AlertDate.swift
//  CalendarMySchedule
//
//  Created by Aleksey Alyonin on 20.12.2022.
//

import UIKit

extension UIViewController {
    func alertDate(label: UILabel, completionHandler: @escaping (Int, NSDate) -> Void) {
        let alert = UIAlertController(title: "", message: nil, preferredStyle: .actionSheet)
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        
        alert.view.addSubview(datePicker)
        
        let ok = UIAlertAction(title: "Ok", style: .default) { (action) in
            let dateFormattor = DateFormatter()
            dateFormattor.dateFormat = "dd.MM.yyyy"
            
//            какой день недели
            let dateString = dateFormattor.string(from: datePicker.date)
            let calendar = Calendar.current
            let component = calendar.dateComponents([.weekday], from: datePicker.date)
            guard let weekDay = component.weekday else { return }
            let numberWeekDay = weekDay
            
            let date = datePicker.date as NSDate
            completionHandler(numberWeekDay, date)
            
            label.text = dateString
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .default)
        
        alert.addAction(ok)
        alert.addAction(cancel)
        alert.negativeWidthConstraint()

        
        alert.view.heightAnchor.constraint(equalToConstant: 300).isActive = true
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.widthAnchor.constraint(equalTo: alert.view.widthAnchor).isActive = true
        datePicker.heightAnchor.constraint(equalToConstant: 160).isActive = true
        datePicker.topAnchor.constraint(equalTo: alert.view.topAnchor, constant: 20).isActive = true

        
        present(alert, animated: true)
        
    }
}
