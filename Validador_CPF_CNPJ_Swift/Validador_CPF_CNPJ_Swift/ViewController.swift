//
//  ViewController.swift
//  Validador_CPF_CNPJ_Swift
//
//  Created by Gustavo Cruz Priebe on 12/10/16.
//  Copyright © 2016 Gustavo Priebe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var campoCPF: UITextField!
    @IBOutlet weak var campoCNPJ: UITextField!
    
    @IBAction func botaoCPF(_ sender: Any) {
        let cpf = self.campoCPF.text! as NSString
        let error = Validador_CPF_CNPJ.validaCPF(cpf: cpf) as NSDictionary
        let errorString = error["mensagem"] as! String
        
        AlertHelper.showAlert(message: errorString, vc: self)
    }
    
    @IBAction func botaoCNPJ(_ sender: Any) {
        let cnpj = self.campoCNPJ.text! as NSString
        let error = Validador_CPF_CNPJ.validaCNPJ(cnpj: cnpj) as NSDictionary
        let errorString = error["mensagem"] as! String
        
        AlertHelper.showAlert(message: errorString, vc: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

