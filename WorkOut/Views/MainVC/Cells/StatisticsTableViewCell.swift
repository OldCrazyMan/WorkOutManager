//
//  StatisticsTableViewCell.swift
//  WorkOut
//
//  Created by Тимур Ахметов on 09.03.2022.
//

import UIKit

class StatisticsTableViewCell: UITableViewCell {
    
//    private let backgroundCell: UIView = {
//        let view = UIView()
//        view.backgroundColor = .specialBackground
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
    
    private let workoutNameLabel: UILabel = {
       let label = UILabel()
        label.text = "Pull Ups"
        label.textColor = .specialGray
        label.font = .robotoMedium22()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let beforeLabel: UILabel = {
       let label = UILabel()
        label.text = "Before: 2"
        label.textColor = .specialBrown
        label.font = .robotoMedium14()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let nowLabel: UILabel = {
       let label = UILabel()
        label.text = "Now: 2"
        label.textColor = .specialBrown
        label.font = .robotoMedium14()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let differenceLabel: UILabel = {
       let label = UILabel()
        label.textColor = .specialYellow
        label.font = .robotoMedium24()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var labelsStackView = UIStackView()
    var workoutModel = WorkoutModel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .clear
        selectionStyle = .none
        
        addSubview(workoutNameLabel)
        labelsStackView = UIStackView(arrangedSubviews: [beforeLabel,
                                                         nowLabel],
                                      axis: .horizontal,
                                      spacing: 10)
        addSubview(labelsStackView)
        addSubview(differenceLabel)
    }
    
        func cellConfigure(differenceWorkout: DifferenceWorkout) {
        workoutNameLabel.text = differenceWorkout.name
        beforeLabel.text = "Before: \(differenceWorkout.firstReps)"
        nowLabel.text = "Now: \(differenceWorkout.lastReps)"
        
        let difference = differenceWorkout.lastReps - differenceWorkout.firstReps
        differenceLabel.text = "\(difference)"
        
        switch difference {
        case ..<0: differenceLabel.textColor = .specialGreen
        case 1...: differenceLabel.textColor = .specialDarkYellow
        default:
            differenceLabel.textColor = .specialGray
        }
    }

    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            workoutNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            workoutNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            workoutNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        ])
        
        NSLayoutConstraint.activate([
            labelsStackView.topAnchor.constraint(equalTo: workoutNameLabel.bottomAnchor, constant: 5),
            labelsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
        NSLayoutConstraint.activate([
            differenceLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            differenceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 20),
            differenceLabel.widthAnchor.constraint(equalToConstant: 60)
        ])
    } 
}
