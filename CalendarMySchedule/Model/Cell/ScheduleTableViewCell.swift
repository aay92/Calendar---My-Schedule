//
//  ScheduleTableViewCell.swift
//  CalendarMySchedule
//
//  Created by Aleksey Alyonin on 14.12.2022.
//

import UIKit

class ScheduleTableViewCell: UITableViewCell {

    let lessonName = UILabel(text: "Програмирование",
                             font: .avenirNext20DemiBold()!)
    
    let teacherName = UILabel(text: "Антонов Антон Анатольевич",
                              font: .avenirNext20()!,
                              alignment: .right)
    
    let lessonTime = UILabel(text: "08.00",
                             font: .avenirNext20DemiBold()!)
    
    let typeLabel = UILabel(text: "Тип:",
                            font:.avenirNext14()!,
                            alignment: .right)

    let lessonType = UILabel(text: "Лекция",
                             font:.avenirNext14DemiBold()!,
                             alignment: .left)

    let buildingLabel = UILabel(text: "Корпус",
                                font: .avenirNext14()!,
                                alignment: .right)

    let lessonBuilding = UILabel(text: "1",
                                 font: .avenirNext14DemiBold()!)

    let audLabel = UILabel(text: "Аудитория",
                           font: .avenirNext14()!,
                           alignment: .right)

    let lessonAud = UILabel(text: "101",
                            font: .avenirNext14DemiBold()!,
                            alignment: .left)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
            setConstraints()
        
//        selectionStyle =  не будет выделения
        self.selectionStyle = .none
//            print(frame.height)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints(){
        let topsStackView = UIStackView(arrangedSubviews: [lessonName, teacherName],
                                    axis: .horizontal,
                                    spacing: 10,
                                    distribution: .fillEqually)
        
        self.addSubview(topsStackView)
        NSLayoutConstraint.activate([
            topsStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            topsStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            topsStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            topsStackView.heightAnchor.constraint(equalToConstant: 25),
        ])
        
        self.addSubview(lessonTime)
        NSLayoutConstraint.activate([
            lessonTime.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            lessonTime.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            lessonTime.widthAnchor.constraint(equalToConstant: 100),
            lessonTime.heightAnchor.constraint(equalToConstant: 25),
        ])
        
        let bottomStackView = UIStackView(arrangedSubviews: [typeLabel, lessonType, buildingLabel, lessonBuilding, audLabel, lessonAud],
                                    axis: .horizontal,
                                    spacing: 5,
                                          distribution: .fillProportionally)
        self.addSubview(bottomStackView)
        NSLayoutConstraint.activate([
            bottomStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            bottomStackView.leadingAnchor.constraint(equalTo: lessonTime.trailingAnchor, constant: 5),
            bottomStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            bottomStackView.heightAnchor.constraint(equalToConstant: 25),
        ])
    }
}

