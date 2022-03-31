//
//  DateAndRepeatView.swift
//  WorkOut
//
//  Created by Тимур Ахметов on 22.02.2022.
//

import UIKit

class DateAndRepeatView: UIView {
    
    private let dataLabel: UILabel = {
       let label = UILabel()
        label.text = "Date"
        label.font = .robotoMedium18()
        label.textColor = .specialGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
     let datePicker: UIDatePicker = {
        let dataPicker = UIDatePicker()
        dataPicker.datePickerMode = .date
        dataPicker.tintColor = .specialGreen
        dataPicker.translatesAutoresizingMaskIntoConstraints = false
       return dataPicker
    }()
    
    private let repeatLabel: UILabel = {
        let label = UILabel()
        label.text = "Repeat every 7 days"
        label.font = .robotoMedium18()
        label.textColor = .specialBlack
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
     let repeatSwitch: UISwitch = {
       let repeatSwitch = UISwitch()
        repeatSwitch.isOn = true
        repeatSwitch.onTintColor = .specialGreen
        repeatSwitch.translatesAutoresizingMaskIntoConstraints = false
        return repeatSwitch
    }()
    
    var dateStackView = UIStackView()
    
    var repeatStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
    setupViews()
    setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .specialLightBrown
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
        
        dateStackView = UIStackView(arrangedSubviews: [dataLabel,
                                                       datePicker],
                                    axis: .horizontal,
                                    spacing: 10)
        addSubview(dateStackView)
        
        repeatStackView = UIStackView(arrangedSubviews: [repeatLabel,
                                                        repeatSwitch],
                                      axis: .horizontal,
                                      spacing: 10)
        addSubview(repeatStackView)
    }
    
    @objc private func datePickerTap() {
        print("dataPicker")
}
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            dateStackView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            dateStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            dateStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            repeatStackView.topAnchor.constraint(equalTo: dateStackView.bottomAnchor, constant: 5),
            repeatStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            repeatStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
    }
    
}
