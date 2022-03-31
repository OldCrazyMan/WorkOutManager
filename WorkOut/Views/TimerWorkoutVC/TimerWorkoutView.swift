//
//  TimerWorkoutView.swift
//  WorkOut
//
//  Created by Тимур Ахметов on 07.03.2022.
//

import UIKit
import SwiftUI

protocol NextSetTimerProtocol: AnyObject {
    func nextSetTimerTapped()
    func editingTimerButtonTap()
}

class TimerWorkoutView: UIView {
    
    let workoutNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Squats"
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.font = .robotoMedium22()
        label.textColor = .specialGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let setsLabel: UILabel = {
        let label = UILabel()
        label.text = "Sets"
        label.font = .robotoMedium18()
        label.textColor = .specialGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let numberOfSetsLabel: UILabel = {
        let label = UILabel()
        label.text = "1/4"
        label.font = .robotoMedium24()
        label.textColor = .specialGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let timerLabel: UILabel = {
        let label = UILabel()
        label.text = "Time of set"
        label.font = .robotoMedium18()
        label.textColor = .specialGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let numberOfTimerLabel: UILabel = {
        let label = UILabel()
       // label.text = "1 min 20 sec"
        label.font = .robotoMedium24()
        label.textColor = .specialGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let timerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialLine
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let setsLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialLine
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var editingButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .none
        button.setImage(UIImage(named: "editing"), for: .normal)
        button.setTitle("Editing", for: .normal)
        button.titleLabel?.font = .robotoMedium14()
        button.tintColor = .specialDarkGreen
        button.addTarget(self, action: #selector(editingTimerButtonTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var nextSetButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .specialYellow
        button.setTitle("NEXT SET", for: .normal)
        button.titleLabel?.font = .robotoMedium16()
        button.tintColor = .specialDarkGreen
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(nextSetButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var timerStackView = UIStackView()
    var setsStackView = UIStackView()
    
    weak var cellNextSetTimerDelegate: NextSetTimerProtocol?
    
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
        
        addSubview(workoutNameLabel)
        setsStackView = UIStackView(arrangedSubviews: [setsLabel,
                                                       numberOfSetsLabel],
                                    axis: .horizontal,
                                    spacing: 10)
        setsStackView.distribution = .equalSpacing
        addSubview(setsStackView)
        addSubview(setsLineView)
        timerStackView = UIStackView(arrangedSubviews: [timerLabel,
                                                        numberOfTimerLabel],
                                     axis: .horizontal,
                                     spacing: 10)
        timerStackView.distribution = .equalSpacing
        addSubview(timerLineView)
        addSubview(timerStackView)
        addSubview(editingButton)
        addSubview(nextSetButton)
    }
    
    @objc private func editingTimerButtonTap() {
        cellNextSetTimerDelegate?.editingTimerButtonTap()
    }
    
    @objc private func nextSetButtonTapped() {
        cellNextSetTimerDelegate?.nextSetTimerTapped()
    }
    
    
    //MARK: - setConstraints
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            workoutNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            workoutNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            workoutNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            setsStackView.topAnchor.constraint(equalTo: workoutNameLabel.bottomAnchor, constant: 10),
            setsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            setsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            setsStackView.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            setsLineView.topAnchor.constraint(equalTo: setsStackView.bottomAnchor, constant: 2),
            setsLineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            setsLineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            setsLineView.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            timerStackView.topAnchor.constraint(equalTo: setsLineView.bottomAnchor, constant: 20),
            timerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            timerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            timerStackView.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        NSLayoutConstraint.activate([
            timerLineView.topAnchor.constraint(equalTo: timerStackView.bottomAnchor, constant: 2),
            timerLineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            timerLineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            timerLineView.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            editingButton.topAnchor.constraint(equalTo: timerLineView.bottomAnchor, constant: 10),
            editingButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            editingButton.heightAnchor.constraint(equalToConstant: 20),
            editingButton.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        NSLayoutConstraint.activate([
            nextSetButton.topAnchor.constraint(equalTo: editingButton.bottomAnchor, constant: 10),
            nextSetButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            nextSetButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            nextSetButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
}
