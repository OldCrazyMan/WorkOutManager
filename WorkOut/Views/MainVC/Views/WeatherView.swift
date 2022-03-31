//
//  WeatherView.swift
//  WorkOut
//
//  Created by Тимур Ахметов on 15.02.2022.
//
//
import UIKit

class WeatherView: UIView {
    
    let weatherImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "sunImage")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let townLabel: UILabel = {
       let label = UILabel()
       label.text = "Калининград"
       label.adjustsFontSizeToFitWidth = true
        label.textColor = .specialDarkGreen
       label.font = .robotoMedium14()
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
   }()
    
     let weatherLabel: UILabel = {
        let label = UILabel()
        label.text = "Sunshine"
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .specialGray
        label.font = .robotoMedium18()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let weatherDetailsLabel: UILabel = {
        let label = UILabel()
        label.text = "Хорошая погода, чтобы позаниматься на улице"
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 2
        label.textColor = .specialBrown
        label.font = .robotoMedium16()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .tertiarySystemGroupedBackground
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
        addShadowOnView()
        addSubview(townLabel)
        addSubview(weatherLabel)
        addSubview(weatherDetailsLabel)
        addSubview(weatherImageView)
    }
    
    //MARK: - SetConstraints
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            weatherImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            weatherImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            weatherImageView.heightAnchor.constraint(equalToConstant: 60),
            weatherImageView.widthAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            townLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            townLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            townLabel.trailingAnchor.constraint(equalTo: weatherImageView.leadingAnchor, constant: 10),
          //  townLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            weatherLabel.topAnchor.constraint(equalTo:townLabel.bottomAnchor, constant: 5),
            weatherLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            weatherLabel.trailingAnchor.constraint(equalTo: weatherImageView.leadingAnchor, constant: 10),
        //    weatherLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            weatherDetailsLabel.topAnchor.constraint(equalTo: weatherLabel.bottomAnchor, constant: 5),
            weatherDetailsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            weatherDetailsLabel.trailingAnchor.constraint(equalTo: weatherImageView.leadingAnchor),
            weatherDetailsLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
}

