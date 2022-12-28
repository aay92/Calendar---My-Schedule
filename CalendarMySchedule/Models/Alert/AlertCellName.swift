//
//  AlertCellName.swift
//  CalendarMySchedule
//
//  Created by Aleksey Alyonin on 21.12.2022.
//

import UIKit

extension UIViewController {
    func alertForCellName(label: UILabel, name: String, placeholder: String, completionHandler: @escaping (String) -> Void){
        let alert = UIAlertController(title: name, message: nil, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "Ok", style: .default){ (action) in
            let tfAlert = alert.textFields?.first
            guard let text = tfAlert?.text else { return }
            label.text = text
            completionHandler(text)
        }
        
        alert.addTextField {(textFieldAlert) in
            textFieldAlert.placeholder = placeholder
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .default)
       
        alert.addAction(ok)
        alert.addAction(cancel)
        alert.negativeWidthConstraint()
        
        present(alert, animated: true, completion: nil)
    }
}
