//
//  UIColor + Ext.swift
//  CalendarMySchedule
//
//  Created by Aleksey Alyonin on 28.12.2022.
//

import UIKit

extension UIColor {
    static func colorFromHex(hex:String) -> UIColor {
        var hexString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (hexString.hasPrefix("#")) {
            hexString.remove(at: hexString.startIndex)
        }

        if hexString.count != 6 {
            return UIColor.gray
        }

        var rgb:UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgb)

        return UIColor(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
