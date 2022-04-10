//
//  RepsOrTimerView.swift
//  WorkOut
//
//  Created by Тимур Ахметов on 22.02.2022.
//

import UIKit

class RepsOrTimerView: UIView {
    
    private let setsLabel: UILabel = {
        let label = UILabel()
        label.text = "Sets"
        label.font = .robotoMedium18()
        label.textColor = .specialBlack
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let numberOfSetLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = .robotoMedium24()
        label.textColor = .specialBlack
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var setsSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 20
        slider.minimumTrackTintColor = .specialDarkGreen
        slider.maximumTrackTintColor = .specialGreen
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.addTarget(self, action: #selector(setsSliderChanged), for: .valueChanged)
        return slider
    }()
    
    private let repeatOrTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "Choose repeat or timer"
        label.underline()
        label.font = .robotoMedium16()
        label.textColor = .specialBlack
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let repsLabel: UILabel = {
        let label = UILabel()
        label.text = "Reps"
        label.font = .robotoMedium18()
        label.textColor = .specialBlack
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let numberOfRepsLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = .robotoMedium24()
        label.textColor = .specialBlack
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var repsSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 50
        slider.minimumTrackTintColor = .specialDarkGreen
        slider.maximumTrackTintColor = .specialGreen
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.addTarget(self, action: #selector(repsSliderChanged), for: .valueChanged)
        return slider
    }()
    
    private let timerLabel: UILabel = {
        let label = UILabel()
        label.text = "Timer"
        label.font = .robotoMedium18()
        label.textColor = .specialBlack
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let numberOfTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "0 min"
        label.font = .robotoMedium24()
        label.textColor = .specialBlack
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var timerSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 600
        slider.minimumTrackTintColor = .specialDarkGreen
        slider.maximumTrackTintColor = .specialGreen
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.addTarget(self, action: #selector(timerSliderChanged), for: .valueChanged)
        return slider
    }()
    
    var setsStackView = UIStackView()
    var repsStackView = UIStackView()
    var timerStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .specialGray
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
        addShadowOnView()
        
        setsStackView = UIStackView(arrangedSubviews: [setsLabel,
                                                       numberOfSetLabel],
                                    axis: .horizontal,
                                    spacing: 10)
        addSubview(setsStackView)
        addSubview(setsSlider)
        addSubview(repeatOrTimeLabel)
        
        repsStackView = UIStackView(arrangedSubviews: [repsLabel,
                                                       numberOfRepsLabel],
                                    axis: .horizontal,
                                    spacing: 10)
        addSubview(repsStackView)
        addSubview(repsSlider)
        
        timerStackView = UIStackView(arrangedSubviews: [timerLabel,
                                                        numberOfTimeLabel],
                                     axis: .horizontal,
                                     spacing: 10)
        addSubview(timerStackView)
        addSubview(timerSlider)
    }
    
    @objc func setsSliderChanged() {
        numberOfSetLabel.text = "\(Int(setsSlider.value))"
    }
    
    @objc func repsSliderChanged() {
        numberOfRepsLabel.text = "\(Int(repsSlider.value))"
        setNegative(label: timerLabel, numberLabel: numberOfTimeLabel, slider: timerSlider)
        setActive(label: repsLabel, numberLabel: numberOfRepsLabel, slider: repsSlider)
    }
    
    @objc func timerSliderChanged() {
        let (min, sec) = { (secs: Int) -> (Int, Int) in
            return (secs / 60, secs % 60)}(Int(timerSlider.value))
        
        numberOfTimeLabel.text = (sec != 0 ? "\(min) min \(sec) sec" : "\(min) min")
        
        setNegative(label: repsLabel, numberLabel: numberOfRepsLabel, slider: repsSlider)
        setActive(label: timerLabel, numberLabel: numberOfTimeLabel, slider: timerSlider)
    }
    
    private func setActive(label: UILabel, numberLabel: UILabel, slider: UISlider) {
        label.alpha = 1
        numberLabel.alpha = 1
        slider.alpha = 1
    }
    
    private func setNegative(label: UILabel, numberLabel: UILabel, slider: UISlider) {
        label.alpha = 0.5
        numberLabel.alpha = 0.5
        numberLabel.text = "0"
        slider.alpha = 0.5
        slider.value = 0
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            setsStackView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            setsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            setsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            setsSlider.topAnchor.constraint(equalTo: setsStackView.bottomAnchor, constant: 10),
            setsSlider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            setsSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            repeatOrTimeLabel.topAnchor.constraint(equalTo: setsSlider.bottomAnchor, constant: 20),
            repeatOrTimeLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            repsStackView.topAnchor.constraint(equalTo: repeatOrTimeLabel.bottomAnchor, constant: 5),
            repsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            repsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            repsSlider.topAnchor.constraint(equalTo: repsStackView.bottomAnchor, constant: 10),
            repsSlider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            repsSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            timerStackView.topAnchor.constraint(equalTo: repsSlider.bottomAnchor, constant: 20),
            timerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            timerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            timerSlider.topAnchor.constraint(equalTo: timerStackView.bottomAnchor, constant: 10),
            timerSlider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            timerSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
    }
}
