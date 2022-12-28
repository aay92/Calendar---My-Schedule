//
//  TasksTableViewCell.swift
//  CalendarMySchedule
//
//  Created by Aleksey Alyonin on 18.12.2022.
//

import UIKit

class TasksTableViewCell: UITableViewCell {

    let tasksName = UILabel(text: "Программирование", font: .avenirNext20DemiBold()!)
    let tasksDescription = UILabel(text: "Научится писать extension и правельно их применять", font: .avenirNext14()!)
    
    let readyButton: UIButton = {
        let btn = UIButton()
        btn.setBackgroundImage(UIImage(systemName: "chevron.down.circle"), for: .normal)
        btn.tintColor = .black
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
//    Delegate
    weak var cellTaskDelegate: PressReadyTaskButtonProtocols?
    var index: IndexPath?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
            setConstraints()
        
//        selectionStyle =  не будет выделения
        self.selectionStyle = .none
        tasksDescription.numberOfLines = 2
        readyButton.addTarget(self, action: #selector(readyButtonTap), for: .touchUpInside)
//            print(frame.height)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func readyButtonTap(){
//        print("tap")
        guard let index = index else { return }
        cellTaskDelegate?.readyButtonTapped(indexPath: index)
    }
    
    private func setConstraints(){
        
//        contentView - так как кнопка расположенна под всеми слоями контента
        self.contentView.addSubview(readyButton)
        NSLayoutConstraint.activate([
            readyButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            readyButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            readyButton.widthAnchor.constraint(equalToConstant: 40),
            readyButton.heightAnchor.constraint(equalToConstant: 40),
        ])
        
        self.addSubview(tasksName)
        NSLayoutConstraint.activate([
            tasksName.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            tasksName.trailingAnchor.constraint(equalTo: readyButton.leadingAnchor, constant: -5),
            tasksName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            tasksName.heightAnchor.constraint(equalToConstant: 25),
        ])
        
        self.addSubview(tasksDescription)
        NSLayoutConstraint.activate([
            tasksDescription.topAnchor.constraint(equalTo: tasksName.bottomAnchor, constant: 5),
            tasksDescription.trailingAnchor.constraint(equalTo: readyButton.leadingAnchor, constant: -5),
            tasksDescription.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            tasksDescription.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5)
        ])
    }
}


