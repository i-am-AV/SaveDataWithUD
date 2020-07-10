//
//  RegistrationViewController.swift
//  Lesson 9
//
//  Created by  Alexander on 09.07.2020.
//  Copyright © 2020  Alexander. All rights reserved.
//

import UIKit

final class RegistrationViewController: UIViewController {
    
    //MARK:- Properties
    private let registrateButton = UIButton()
    private let loginTextField = UITextField()
    private let passwordTextField = UITextField()
    private let alertController = Alert()
    private var defaults = Defaults()
    
    //MARK:- Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let _ = defaults.getData() {
            navigationController?.pushViewController(DataViewController(), animated: false)
        }
        
        view.backgroundColor = .white
        navigationItem.title = "Регистрация"
        allSetup()
        allConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        clearTextFields()
    }
}

// MARK:- Button settings
extension RegistrationViewController {
    private func setupButton() {
        registrateButton.backgroundColor = .systemBlue
        registrateButton.setTitle("Зарегистрироваться", for: .normal)
        registrateButton.setTitleColor(.white, for: .normal)
        registrateButton.layer.cornerRadius = 15
        
        registrateButton.addTarget(self, action: #selector(registrateButtonTapped), for: .touchUpInside)
        
        view.addSubview(registrateButton)
    }
    
    @objc private func registrateButtonTapped() {
        if let login = loginTextField.text?.filter({ $0 != " "}), login != "",
           let password = passwordTextField.text?.filter({ $0 != " "}), password != "" {
            
            defaults.save(login: login, password: password)
            show(DataViewController(), sender: nil)
            
        } else {
            let alert = alertController.createErrorAlert()
            present(alert, animated: true)
        }
    }
    
    private func setRegistrateButtonConstraints() {
        registrateButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            registrateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            registrateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            registrateButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32),
            registrateButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}

// MARK:- Login Text Field settings

extension RegistrationViewController {
    private func setupLoginTextField() {
        loginTextField.placeholder = "Login"
        view.addSubview(loginTextField)
    }
    
    private func setLoginTextFieldConstraints() {
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            loginTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -32)
        ])
    }
    
}

// MARK:- Password Text Field settings

extension RegistrationViewController {
    private func setupPasswordTextField() {
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        view.addSubview(passwordTextField)
    }
    
    private func setPasswordTextFieldConstraints() {
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            passwordTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 32)
        ])
    }
}

// MARK:- Additional functions

extension RegistrationViewController {
    private func allSetup() {
        setupButton()
        setupLoginTextField()
        setupPasswordTextField()
    }
    
    private func allConstraints() {
        setRegistrateButtonConstraints()
        setLoginTextFieldConstraints()
        setPasswordTextFieldConstraints()
    }
    
    private func clearTextFields() {
        loginTextField.text = ""
        passwordTextField.text = ""
    }
}
