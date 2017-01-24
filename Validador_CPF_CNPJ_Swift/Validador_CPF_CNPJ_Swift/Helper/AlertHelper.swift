//
//  AlertHelper.swift
//  Validador_CPF_CNPJ_Swift
//
//  Created by Gustavo Cruz Priebe on 12/10/16.
//  Copyright © 2016 Gustavo Priebe. All rights reserved.
//

import Foundation
import UIKit

class AlertHelper {
    static func showAlert(message: String, vc: UIViewController) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        vc.present(alert, animated: true)
    }
}
