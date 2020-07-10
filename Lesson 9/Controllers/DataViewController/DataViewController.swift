//
//  DataViewController.swift
//  Lesson 9
//
//  Created by  Alexander on 10.07.2020.
//  Copyright © 2020  Alexander. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {

//MARK:- Properties
    private let dataLabel = UILabel()
    private let clearButton = UIButton()
    private var defaults = Defaults()
    private let alertController = Alert()

//MARK:- Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBlue
        navigationItem.title = "Данные"
        setupDataLabel()
        setDataLabelConstraints()
        
        dataLabel.text =  defaults.getData()
        
        setupButton()
        setClearButtonConstraints()
    }
}

// MARK:- Login && Password Label settings
extension DataViewController {
    private func setupDataLabel() {
        dataLabel.textAlignment = .center
        dataLabel.textColor = .white
        dataLabel.font = .systemFont(ofSize: 25)
        dataLabel.numberOfLines = 0
        
        view.addSubview(dataLabel)
    }
    
    private func setDataLabelConstraints() {
        dataLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dataLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            dataLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            dataLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dataLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

// MARK:- Button settings
extension DataViewController {
    private func setupButton() {
        clearButton.backgroundColor = .white
        clearButton.setTitle("Очистить", for: .normal)
        clearButton.setTitleColor(.systemBlue, for: .normal)
        clearButton.layer.cornerRadius = 15
        
        clearButton.addTarget(self, action: #selector(clearButtonTapped), for: .touchUpInside)
        
        view.addSubview(clearButton)
    }
    
    @objc private func clearButtonTapped() {
        defaults.clearData()
        
        let alert = alertController.createClearDataAlert()
        present(alert, animated: true)
        dataLabel.text = "No data"
    }
    
    private func setClearButtonConstraints() {
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            clearButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            clearButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            clearButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32),
            clearButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
