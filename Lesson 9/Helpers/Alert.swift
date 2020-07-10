//
//  Alert.swift
//  Lesson 9
//
//  Created by  Alexander on 10.07.2020.
//  Copyright © 2020  Alexander. All rights reserved.
//

import UIKit


final class Alert {
    
    func createErrorAlert() -> UIAlertController {
        let alert = UIAlertController(title: "Ошибка",
                                      message: "Не все данные введены",
                                      preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "OK",
                                        style: .cancel,
                                        handler: nil)
        
        alert.addAction(alertAction)
        
        return alert
    }
    
    func createClearDataAlert() -> UIAlertController {
        let alert = UIAlertController(title: nil, message: "Данные очищены",
                                      preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "OK",
                                        style: .cancel,
                                        handler: nil)
        
        alert.addAction(alertAction)
        
        return alert
    }
    
}
