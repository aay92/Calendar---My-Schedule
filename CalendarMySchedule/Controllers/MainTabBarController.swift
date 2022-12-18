//
//  MainTabBarController.swift
//  CalendarMySchedule
//
//  Created by Aleksey Alyonin on 08.12.2022.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
    }
    
    func setupTabBar(){
        
        tabBar.backgroundColor = .white
        tabBar.layer.shadowColor = UIColor.gray.withAlphaComponent(0.5).cgColor
        tabBar.layer.shadowRadius = 10
        tabBar.layer.shadowOpacity = 0.5
        
        let scheduleViewController = createNavController(vc: ScheduleViewController(), itemName: "Schedule", itemImage: "calendar.badge.clock")
        
        let tasksViewController = createNavController(vc: TasksViewController(), itemName: "Tasks", itemImage: "text.badge.checkmark")

        let contactViewController = createNavController(vc: ContactsViewController(), itemName: "Contacts", itemImage: "rectangle.stack.person.crop")

        viewControllers = [scheduleViewController, tasksViewController, contactViewController]

    }

    func createNavController(vc: UIViewController, itemName: String, itemImage: String)-> UINavigationController {
       
        let item = UITabBarItem(title: itemName,
                                image: UIImage(systemName: itemImage)?.withAlignmentRectInsets(.init(top: 10, left: 0, bottom: 0, right: 0)),
                                tag: 0)
        item.titlePositionAdjustment = .init(horizontal: 0, vertical: 10)
        
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem = item

        
        return navController
    }

}
