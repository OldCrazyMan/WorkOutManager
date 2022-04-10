//
//  StartWorkoutController.swift
//  WorkOut
//
//  Created by Тимур Ахметов on 28.02.2022.
//

import UIKit

class RepsWorkoutViewController: UIViewController {
    
    private let newWorkoutLabel: UILabel = {
        let label = UILabel()
        label.text = "START WORKOUT"
        label.textColor = .specialBlack
        label.font = .robotoMedium24()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "сloseButton"), for: .normal)
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addShadowOnView()
        return button
    }()
    
    private let sportmanImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "sportmanImageView")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
 
    private lazy var finishButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .specialGreen
        button.setTitle("FINISH", for: .normal)
        button.titleLabel?.font = .robotoBold16()
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(finishButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addShadowOnView()
        return button
    }()
    
    private let detailsLabel = UILabel(text: "Details")
    
    let workoutParametersView = WorkoutParametersView()
    
    var workoutModel = WorkoutModel()
    let customAlert = CustomAlert()
    
    private var numberOfSet = 1
    
    override func viewDidLayoutSubviews() {
        closeButton.layer.cornerRadius = closeButton.frame.height / 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        setWorkoutParameters()
        setDelegates()
    }
    
    private func setDelegates() {
        workoutParametersView.cellNextSetDelegate = self
    }
    
    private func setupViews() {
        view.backgroundColor = .specialBackground
        
        view.addSubview(newWorkoutLabel)
        view.addSubview(closeButton)
        view.addSubview(sportmanImageView)
        view.addSubview(detailsLabel)
        view.addSubview(workoutParametersView)
        view.addSubview(finishButton)
    }
    
    @objc private func closeButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func finishButtonTapped() {
        if numberOfSet == workoutModel.workoutSets {
            dismiss(animated: true)
            RealmManager.shared.updateStatusWorkoutModel(model: workoutModel, bool: true)
        } else {
            alertOkCancel(title: "Warning", message: "You havent finished your workout") {
                self.dismiss(animated: true)
            }
        }
    }
    
    private func setWorkoutParameters() {
        workoutParametersView.workoutNameLabel.text = workoutModel.workoutName
        workoutParametersView.numberOfSetsLabel.text = "\(numberOfSet)/\(workoutModel.workoutSets)"
        workoutParametersView.numberOfRepsLabel.text = "\(workoutModel.workoutReps)"
    }
}

// MARK: - NextSetProtocol

extension RepsWorkoutViewController: NextSetProtocol {
    
    func editingTapped() {
        customAlert.alertCustom(viewController: self, repsOrTimer: "Reps") { [self] sets, reps in
            if sets != "" && reps != "" {
                workoutParametersView.numberOfSetsLabel.text = "\(numberOfSet)/\(sets)"
                workoutParametersView.numberOfRepsLabel.text = reps
                guard let numberOfSets = Int(sets) else { return }
                guard let numberOfReps = Int(reps) else { return }
                RealmManager.shared.updateSetsRepsWorkoutModel(model: workoutModel, sets: numberOfSets, reps: numberOfReps)
            }
        }
    }
    
    func nextSetTapped() {
        if numberOfSet < workoutModel.workoutSets {
            numberOfSet += 1
            workoutParametersView.numberOfSetsLabel.text = "\(numberOfSet)/\(workoutModel.workoutSets)"
        } else {
            alertOk(title: "Your workout is done", message: .none)
        }
    }
}

//MARK: - SetConstraints

extension RepsWorkoutViewController {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            newWorkoutLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            newWorkoutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            closeButton.centerYAnchor.constraint(equalTo: newWorkoutLabel.centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            closeButton.heightAnchor.constraint(equalToConstant: 30),
            closeButton.widthAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            sportmanImageView.topAnchor.constraint(equalTo: newWorkoutLabel.bottomAnchor, constant: 20),
            sportmanImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sportmanImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            sportmanImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7)
        ])
        
        NSLayoutConstraint.activate([
            detailsLabel.topAnchor.constraint(equalTo: sportmanImageView.bottomAnchor, constant: 20),
            detailsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            detailsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            workoutParametersView.topAnchor.constraint(equalTo: detailsLabel.bottomAnchor, constant: 5),
            workoutParametersView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            workoutParametersView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            workoutParametersView.heightAnchor.constraint(equalToConstant: 230)
        ])
        
        NSLayoutConstraint.activate([
            finishButton.topAnchor.constraint(equalTo: workoutParametersView.bottomAnchor, constant: 20),
            finishButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            finishButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            finishButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
}
