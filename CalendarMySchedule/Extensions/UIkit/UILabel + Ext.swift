//
//  UILabel + Ext.swift
//  CalendarMySchedule
//
//  Created by Aleksey Alyonin on 18.12.2022.
//

import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont, alignment: NSTextAlignment = .left){
        self.init()
        self.text = text
        self.font = font
        self.textColor = .black
        self.textAlignment = alignment
        //adjustsFontSizeToFitWidth - подгонка текста под размеры лейбла
        self.adjustsFontSizeToFitWidth = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
