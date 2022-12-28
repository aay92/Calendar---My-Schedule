//
//  ScheduleOptionsTableViewController.swift
//  CalendarMySchedule
//
//  Created by Aleksey Alyonin on 19.12.2022.
//

import UIKit

class ScheduleOptionsTableViewController: UITableViewController {
  
    let idOptionsScheduleCell = "OptionsTableViewCell"
    let idOptionsScheduleHeader = "idOptionsScheduleHeader"
    let headerNameArray = ["Date and time","Lesson","Teacher","Color","Period"]
    
    let cellNameArray = [["Date","Time"],
                         ["Name", "Type", "Building", "Audience"],
                         ["Tether Name"],
                         ["",""],
                         ["Repeat every 7 days"]]
    
    private let scheduleModel = ScheduleModel()

        
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "OptionsSchedule"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = #colorLiteral(red: 0.9594197869, green: 0.9599153399, blue: 0.975127399, alpha: 1)
        tableView.separatorStyle = .none
        tableView.bounces = false
        
        tableView.register(HeaderOptionsTableViewCell.self, forHeaderFooterViewReuseIdentifier: idOptionsScheduleHeader)
        tableView.register(OptionsTableViewCell.self, forCellReuseIdentifier: idOptionsScheduleCell)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonTab))
    }
    
    @objc private func saveButtonTab(){
        RealmManager.shared.saveScheduleModel(model: scheduleModel)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 2
        case 1: return 4
        case 2: return 1
        case 3: return 1
        default: return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idOptionsScheduleCell, for: indexPath) as! OptionsTableViewCell
        cell.cellScheduleCofigure(nameArray: cellNameArray, indexPath: indexPath)
        cell.switchRepeatDelegate = self
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: idOptionsScheduleHeader) as! HeaderOptionsTableViewCell
        header.headerConfigure(nameArray: headerNameArray, section: section)
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! OptionsTableViewCell
     
        switch indexPath{
            
        case [0,0]: alertDate(label: cell.nameCellLabel) {(numberWeekDay, date) in
            self.scheduleModel.scheduleDate = date
            self.scheduleModel.scheduleWeekday = numberWeekDay
        }
        case [0,1]: alertTime(label: cell.nameCellLabel) {(time) in
            self.scheduleModel.scheduleTime = time
        }
            
            
        case [1,0]:
            alertForCellName(label: cell.nameCellLabel, name: "Name lesson", placeholder: "Enter name lesson") { text in
                self.scheduleModel.scheduleName = text

            }
        case [1,1]:
            alertForCellName(label: cell.nameCellLabel, name: "Type", placeholder: "Enter type lesson") { text in
                self.scheduleModel.scheduleType = text

            }
        case [1,2]:
            alertForCellName(label: cell.nameCellLabel, name: "Building number", placeholder: "Enter Building number") { text in
                self.scheduleModel.scheduleBuilding = text

            }
        case [1,3]:
            alertForCellName(label: cell.nameCellLabel, name: "Audience number", placeholder: "Enter Audience number") { text in
                self.scheduleModel.scheduleAudience = text

            }

        case [2,0]: pushControllers(vc: TeachersViewController())
        case [3,0]: pushControllers(vc: ScheduleColorViewController())
        default:
            print("Tap error(default) ScheduleOptionsTableViewController")
        }
    }
    
//    Переход на экран с выбранный viewController
    func pushControllers(vc: UIViewController){
        let viewController = vc
        navigationController?.navigationBar.topItem?.title = "Options"
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension ScheduleOptionsTableViewController: SwitchRepeatProtocols {
    func switchRepeat(value: Bool) {
        scheduleModel.scheduleRepeat = value
    }
}

