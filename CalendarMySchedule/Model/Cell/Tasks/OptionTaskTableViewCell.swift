//
//  OptionTaskTableViewCell.swift
//  CalendarMySchedule
//
//  Created by Aleksey Alyonin on 23.12.2022.
//

import UIKit

class OptionTaskTableViewCell: UITableViewCell {

    let backgroundViewCell: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let nameCellLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let cellNameArray = ["Date", "Lesson", "Task", ""]
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
            setConstraints()
        
//        selectionStyle =  не будет выделения
        self.selectionStyle = .none
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func cellCofigure(indexPath: IndexPath){
        //        section - массив( ["Date","Time"] ), row - ячейки( "Date","Time" )
        nameCellLabel.text = cellNameArray[indexPath.section]
        
        //        Менякм цвет ячкйки - Сolor ([3,0] - расположение ячеки)
        if indexPath == [3,0] {
            backgroundViewCell.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
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
        
        self.addSubview(nameCellLabel)
        NSLayoutConstraint.activate([
            nameCellLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            nameCellLabel.leadingAnchor.constraint(equalTo: backgroundViewCell.leadingAnchor,constant:  15),
            
        ])
    }
}



