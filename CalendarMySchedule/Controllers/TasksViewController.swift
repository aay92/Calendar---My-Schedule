//
//  TasksViewController.swift
//  CalendarMySchedule
//
//  Created by Aleksey Alyonin on 08.12.2022.
//

import UIKit
import FSCalendar

class TasksViewController: UIViewController {
   
    private var calendarHeightConstraints : NSLayoutConstraint!
    
    private var calendar: FSCalendar = {
        let cal = FSCalendar()
        cal.translatesAutoresizingMaskIntoConstraints = false
        return cal
    }()
    
    private let colorButton = #colorLiteral(red: 0.1339893937, green: 0.5584381819, blue: 0.5227751136, alpha: 1)
    private let showHidebutton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Open calendar", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir Next DeminBold", size: 14)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
       
        configure()
        setConstraints()
        swipeAction()
        showHidebutton.addTarget(self, action: #selector(shoeButtonTapped), for: .touchUpInside)
    }
    
    @objc func shoeButtonTapped(){
        if calendar.scope == .week {
            calendar.setScope(.month, animated: true)
            showHidebutton.setTitle("Close calendar", for: .normal)
        } else {
            calendar.setScope(.week, animated: true)
            showHidebutton.setTitle("Open calendar", for: .normal)
        }
    }
    
//    MARK: - UISwipeGestureRecognizer
    private func swipeAction(){
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeUp.direction = .up
        calendar.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeDown.direction = .down
        calendar.addGestureRecognizer(swipeDown)
    }
    @objc private func handleSwipe(gesture: UISwipeGestureRecognizer){
        switch gesture.direction {
        case .up:
            shoeButtonTapped()
        case .down:
            shoeButtonTapped()
        default:
            break
        }
    }
}
//MARK: - FSCalendarDelegate, FCalendarDataSource
extension TasksViewController: FSCalendarDelegate, FSCalendarDataSource {
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        calendarHeightConstraints.constant = bounds.height
//        layoutIfNeeded() - плавная анимация
        view.layoutIfNeeded()
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print(date)
    }
}

//MARK: - setConstraints, configure
extension TasksViewController {
    
    private func configure(){
    
        view.backgroundColor = .white
        title = "Tasks"
        
        view.addSubview(calendar)
        view.addSubview(showHidebutton)
        
        calendar.delegate = self
        calendar.dataSource = self

        //        смена размера
        calendar.scope = .week
        calendarHeightConstraints = NSLayoutConstraint(item: calendar, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 300)
        calendar.addConstraint(calendarHeightConstraints)

    }
    
   private func setConstraints(){
       
       NSLayoutConstraint.activate([
        
        calendar.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
        calendar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        calendar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        
        showHidebutton.topAnchor.constraint(equalTo: calendar.bottomAnchor, constant: 0),
        showHidebutton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
        showHidebutton.heightAnchor.constraint(equalToConstant: 20),
        showHidebutton.widthAnchor.constraint(equalToConstant: 130),
        
        ])
        
    }
}


