//
//  ScheduleColorViewController.swift
//  CalendarMySchedule
//
//  Created by Aleksey Alyonin on 21.12.2022.
//

import UIKit

class ScheduleColorViewController: UITableViewController {
        
        let idOptionsColorCell = "idOptionsColorCell"
        let idOptionsScheduleHeader = "idOptionsScheduleHeader"
    
        let headerNameArray = ["RED","ORANGE","YELLOW","GREEN","BLUE","DEEP BLUE", "PURPLE"]

            
        override func viewDidLoad() {
            super.viewDidLoad()
            title = "Color Schedule"
            
            tableView.delegate = self
            tableView.dataSource = self
            tableView.backgroundColor = #colorLiteral(red: 0.9594197869, green: 0.9599153399, blue: 0.975127399, alpha: 1)
            tableView.separatorStyle = .none
            tableView.bounces = false
            
            tableView.register(HeaderOptionsTableViewCell.self, forHeaderFooterViewReuseIdentifier: idOptionsScheduleHeader)
            tableView.register(ColorTableViewCell.self, forCellReuseIdentifier: idOptionsColorCell)
        }
        
        override func numberOfSections(in tableView: UITableView) -> Int {
            return headerNameArray.count
        }
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: idOptionsColorCell, for: indexPath) as! ColorTableViewCell
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
                print("Tap error(default) OptionsScheduleTableViewController")
            
        }
        
    //    Переход на экран с выбранный viewController
//        func pushControllers(vc: UIViewController){
//            let viewController = vc
//            navigationController?.navigationBar.topItem?.title = "Options"
//            navigationController?.pushViewController(viewController, animated: true)
//        }
    }

