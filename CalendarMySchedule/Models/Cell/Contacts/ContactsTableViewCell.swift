//
//  ContactsTableViewCell.swift
//  CalendarMySchedule
//
//  Created by Aleksey Alyonin on 26.12.2022.
//

import UIKit

class ContactsTableViewCell: UITableViewCell {

    
    let contactImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "dos")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let phoneImageView: UIImageView = {
        let iv = UIImageView()
//        ?.withRenderingMode(.alwaysTemplate) - смена цвета иконки ( .tintColor = .red )
        iv.image = UIImage(systemName: "phone.fill")?.withRenderingMode(.alwaysTemplate)
        iv.tintColor = .red
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let mailImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "envelope.fill")
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    let nameLabel = UILabel(text: "Crulla De Vil", font: .avenirNext20()!)
    let phoneLabel = UILabel(text: "+7 987 678 66 44", font: .avenirNext14()!)
    let mailLabel = UILabel(text: "CrullaDeVil@mail,ru", font: .avenirNext14()!)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
            setConstraints()
        
//        selectionStyle = .none =  не будет выделения
        self.selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        
        contactImageView.layer.cornerRadius = contactImageView.frame.height / 2
    }
    
    private func setConstraints(){
        self.addSubview(contactImageView)
        NSLayoutConstraint.activate([
            contactImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            contactImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant:  15),
            contactImageView.widthAnchor.constraint(equalToConstant: 70),
            contactImageView.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        self.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            nameLabel.leadingAnchor.constraint(equalTo: contactImageView.trailingAnchor, constant:  10),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant:  -10),
            nameLabel.heightAnchor.constraint(equalToConstant: 21)
        ])
        
        let stackView = UIStackView(arrangedSubviews: [phoneImageView, phoneLabel, mailImageView, mailLabel], axis: .horizontal, spacing: 3, distribution: .fillProportionally)
        
        self.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: contactImageView.trailingAnchor, constant:  10),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant:  -10),
            stackView.heightAnchor.constraint(equalToConstant: 21)
        ])
    }
    
    
}


