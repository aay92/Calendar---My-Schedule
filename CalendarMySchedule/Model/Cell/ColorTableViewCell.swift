//
//  ColorTableViewCell.swift
//  CalendarMySchedule
//
//  Created by Aleksey Alyonin on 23.12.2022.
//

import UIKit

class ColorTableViewCell: UITableViewCell {

    let backgroundViewCell: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
            setConstraints()
        
//        selectionStyle =  не будет выделения
        self.selectionStyle = .none
        self.backgroundColor = .clear
        
//            print(frame.height)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func cellCofigure(indexPath: IndexPath){
        
        switch indexPath.section {
        case 0: backgroundViewCell.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.08176552867, alpha: 1)
        case 1: backgroundViewCell.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        case 2: backgroundViewCell.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        case 3: backgroundViewCell.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        case 4: backgroundViewCell.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        case 5: backgroundViewCell.backgroundColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
        default:
            backgroundViewCell.backgroundColor = .purple
        }
    }
    private func setConstraints(){
        self.addSubview(backgroundViewCell)
        NSLayoutConstraint.activate([
            backgroundViewCell.topAnchor.constraint(equalTo: self.topAnchor, constant:  0),
            backgroundViewCell.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant:  10),
            backgroundViewCell.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant:  -10),
            backgroundViewCell.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant:  -1),
        ])
    }
}


