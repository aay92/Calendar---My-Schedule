//
//  OptionsScheduleTableViewCell.swift
//  CalendarMySchedule
//
//  Created by Aleksey Alyonin on 19.12.2022.
//

import UIKit

class OptionsScheduleTableViewCell: UITableViewCell {

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
    
    let repeatSwitch: UISwitch = {
        let repeatSwitch = UISwitch()
        repeatSwitch.isOn = true
        repeatSwitch.isHidden = true
        repeatSwitch.onTintColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        repeatSwitch.translatesAutoresizingMaskIntoConstraints = false
        return repeatSwitch
    }()
    
    let cellNameArray = [["Date","Time"],
                         ["Name", "Type", "Building", "Audience"],
                         ["Tether Name"],
                         ["",""],
                         ["Repeat every 7 days"]]
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
            setConstraints()
        
//        selectionStyle =  не будет выделения
        self.selectionStyle = .none
        self.backgroundColor = .clear
        repeatSwitch.addTarget(self, action: #selector(switchChange(paramTarget:)), for: .valueChanged)
//            print(frame.height)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func cellCofigure(indexPath: IndexPath){
        //        section - массив( ["Date","Time"] ), row - ячейки( "Date","Time" )
        nameCellLabel.text = cellNameArray[indexPath.section][indexPath.row]
        
        //        Менякм цвет ячкйки - Сolor ([3,0] - расположение ячеки)
        if indexPath == [3,0] {
            backgroundViewCell.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        }
        //        Менякм цвет ячкйки - Сolor ([0,0] - расположение ячеки)
        //        else if indexPath == [0,0] { backgroundViewCell.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1) }
        if indexPath == [4,0] {
            repeatSwitch.isHidden = false
        }
    }
    
    @objc func switchChange(paramTarget: UISwitch){
        if paramTarget.isOn {
            print("ON")
        } else {
            print("OFF")
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
//       switch нужно добавить на contentView, а не на self, чтобы работал
        self.contentView.addSubview(repeatSwitch)
        NSLayoutConstraint.activate([
            repeatSwitch.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            repeatSwitch.trailingAnchor.constraint(equalTo: backgroundViewCell.trailingAnchor,constant:  -20),
            
        ])
    }
}


