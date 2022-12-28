//
//  AlertFriendOrTeacher.swift
//  CalendarMySchedule
//
//  Created by Aleksey Alyonin on 26.12.2022.
//

import UIKit

extension UIViewController {
    
    func alertFriendOrTeacher(label:UILabel, completionHandle: @escaping(String)->Void){
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let friend = UIAlertAction(title: "Friend", style: .default){ _ in
            label.text = "Friend"
            let typeContact = "Friend"
            completionHandle(typeContact)
        }
        
        let teacher = UIAlertAction(title: "Teacher", style: .default){ _ in
            label.text = "Teacher"
            let typeContact = "Teacher"
            completionHandle(typeContact)
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertController.negativeWidthConstraint()
        alertController.addAction(friend)
        alertController.addAction(teacher)
        alertController.addAction(cancel)

        present(alertController, animated: true)
        
    }
    
}
