//
//  OptionsScheduleTableViewController.swift
//  CalendarMySchedule
//
//  Created by Aleksey Alyonin on 19.12.2022.
//

import UIKit

class OptionsScheduleTableViewController: UITableViewController {
  
    let idOptionsScheduleCell = "OptionsScheduleTableViewCell"
    let idOptionsScheduleHeader = "idOptionsScheduleHeader"
    let headerNameArray = ["Date and time","Lesson","Teacher","Color","Period"]

        
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "OptionsSchedule"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = #colorLiteral(red: 0.9594197869, green: 0.9599153399, blue: 0.975127399, alpha: 1)
        tableView.separatorStyle = .none
        tableView.bounces = false
        
        tableView.register(HeaderOptionsTableViewCell.self, forHeaderFooterViewReuseIdentifier: idOptionsScheduleHeader)
        tableView.register(OptionsScheduleTableViewCell.self, forCellReuseIdentifier: idOptionsScheduleCell)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: idOptionsScheduleCell, for: indexPath) as! OptionsScheduleTableViewCell
        cell.cellCofigure(indexPath: indexPath)
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
        let cell = tableView.cellForRow(at: indexPath) as! OptionsScheduleTableViewCell
        
        switch indexPath{
            
        case [0,0]: alertDate(label: cell.nameCellLabel) { (numberWeekDay, date) in
            print(numberWeekDay, date)
        }
        case [0,1]: alertTime(label: cell.nameCellLabel) { (date) in
            print(date)}
            
            
        case [1,0]:
            alertForCellName(label: cell.nameCellLabel, name: "Name lesson", placeholder: "Enter name lesson")
        case [1,1]:
            alertForCellName(label: cell.nameCellLabel, name: "Type", placeholder: "Enter type lesson")
        case [1,2]:
            alertForCellName(label: cell.nameCellLabel, name: "Building number", placeholder: "Enter Building number")
        case [1,3]:
            alertForCellName(label: cell.nameCellLabel, name: "Audience number", placeholder: "Enter Audience number")

        case [2,0]: pushControllers(vc: TeachersViewController())
        case [3,0]: pushControllers(vc: ScheduleColorViewController())
        default:
            print("Tap error(default) OptionsScheduleTableViewController")
        }
    }
    
//    Переход на экран с выбранный viewController
    func pushControllers(vc: UIViewController){
        let viewController = vc
        navigationController?.navigationBar.topItem?.title = "Options"
        navigationController?.pushViewController(viewController, animated: true)
    }
}
