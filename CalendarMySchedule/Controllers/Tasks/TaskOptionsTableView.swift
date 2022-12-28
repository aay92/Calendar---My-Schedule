//
//  TaskOptionTableView.swift
//  CalendarMySchedule
//
//  Created by Aleksey Alyonin on 23.12.2022.
//

import UIKit

class TaskOptionsTableView: UITableViewController {
  
    let idOptionsTasksCell = "idOptionsTasksCell"
    let idOptionsTasksHeader = "idOptionsTasksHeader"
    let headerNameArray = ["DATE","LESSON","TASK","COLOR"]
    let cellNameArray = ["Date", "Lesson", "Task", ""]

        
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Options Tasks"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = #colorLiteral(red: 0.9594197869, green: 0.9599153399, blue: 0.975127399, alpha: 1)
        tableView.separatorStyle = .none
        tableView.bounces = false
        
        tableView.register(HeaderOptionsTableViewCell.self, forHeaderFooterViewReuseIdentifier: idOptionsTasksHeader)
        tableView.register(OptionsTableViewCell.self, forCellReuseIdentifier: idOptionsTasksCell)
        
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idOptionsTasksCell, for: indexPath) as! OptionsTableViewCell
        cell.cellTasksCofigure(nameArray: cellNameArray, indexPath: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: idOptionsTasksHeader) as! HeaderOptionsTableViewCell
        header.headerConfigure(nameArray: headerNameArray, section: section)
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! OptionsTableViewCell
        
        switch indexPath.section {
        case 0: alertDate(label: cell.nameCellLabel) { (numberWeekDay, date) in
            print(numberWeekDay, date)
        }
        case 1: alertForCellName(label: cell.nameCellLabel, name: "Name lesson", placeholder: "Enter name lesson")
        case 2: alertForCellName(label: cell.nameCellLabel, name: "Name Task", placeholder: "Enter name Task")
        case 3: pushControllers(vc: ColorTaskTableViewController())
        default:
            print("Error ")
        }
    }
        
//    Переход на экран с выбранный viewController
    func pushControllers(vc: UIViewController){
        let viewController = vc
        navigationController?.navigationBar.topItem?.title = "Options"
        navigationController?.pushViewController(viewController, animated: true)
    }
}

