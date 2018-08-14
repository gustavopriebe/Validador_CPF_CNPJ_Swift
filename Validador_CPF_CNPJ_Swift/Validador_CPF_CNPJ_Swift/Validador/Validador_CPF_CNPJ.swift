//
//  Validador_CPF_CNPJ.swift
//  Validador_CPF_CNPJ_Swift
//
//  Created by Gustavo Cruz Priebe on 12/10/16.
//  Copyright © 2016 Gustavo Priebe. All rights reserved.
//

class Validador_CPF_CNPJ {
  
  enum StatusCPF: String {
    case invalido
    case valido
    case inferior11Digitos
    case naoPermitido
    case desconhecido
  }
  
  static func validaCPF(cpf: String) -> StatusCPF {
    let cpf = NSString(string: cpf)
    
    var status: StatusCPF
    
    let retornoVerificarComuns = verificaComunsCPF(cpf: cpf)
    
    switch retornoVerificarComuns {
    case 0:
      let retornoValidarDigitos: Bool = validaDigitosCPF(cpf: cpf)
      
      if (retornoValidarDigitos == false) {
        status = .invalido
      } else {
        status = .valido
      }
      break
      
    case 1:
      status = .inferior11Digitos
      break
      
    case 2:
      status = .naoPermitido
      break
      
    default:
      status = .desconhecido
      break
    }
    
    return status
  }
  
  /*
   0 - Validado
   1 - Não possui 11 digitos
   2 - CPF não permitido: Sequencia de números
   */
  fileprivate static func verificaComunsCPF(cpf: NSString) -> Int {
    if (cpf.length != 11 || cpf.isEqual(to: "")) {
      return 1
    } else if (cpf.isEqual(to: "00000000000") ||
      cpf.isEqual(to: "11111111111") ||
      cpf.isEqual(to: "22222222222") ||
      cpf.isEqual(to: "33333333333") ||
      cpf.isEqual(to: "44444444444") ||
      cpf.isEqual(to: "55555555555") ||
      cpf.isEqual(to: "66666666666") ||
      cpf.isEqual(to: "77777777777") ||
      cpf.isEqual(to: "88888888888") ||
      cpf.isEqual(to: "99999999999")) {
      return 2
    } else {
      return 0
    }
  }
  
  fileprivate static func validaDigitosCPF(cpf: NSString) -> Bool {
    var soma: Int = 0
    var peso: Int
    let digito_verificador_10: Int = Int(cpf.substring(with: NSMakeRange(9, 1)))!
    let digito_verificador_11: Int = Int(cpf.substring(with: NSMakeRange(10, 1)))!
    var digito_verificador_10_correto: Int
    var digito_verificador_11_correto: Int
    
    // Verificação do 10 dígito
    peso = 10
    for i in 0..<9 {
      soma = soma + (Int(cpf.substring(with: NSMakeRange(i, 1)))! * peso)
      peso = peso - 1
    }
    
    if (soma % 11 < 2) {
      digito_verificador_10_correto = 0
    } else {
      digito_verificador_10_correto = 11 - (soma % 11)
    }
    
    // Verifição do 11 dígito
    soma = 0
    peso = 11
    for i in 0..<10 {
      soma = soma + (Int(cpf.substring(with: NSMakeRange(i, 1)))! * peso)
      peso = peso - 1
    }
    
    if (soma % 11 < 2) {
      digito_verificador_11_correto = 0
    } else {
      digito_verificador_11_correto = 11 - (soma % 11)
    }
    
    // Retorno
    if (digito_verificador_10_correto == digito_verificador_10 && digito_verificador_11_correto == digito_verificador_11) {
      
      return true
      
    } else {
      return false
    }
  }
  
  enum StatusCNPJ: String {
    case invalido
    case valido
    case inferior14Digitos
    case naoPermitido
    case desconhecido
  }
  
  static func validaCNPJ(cnpj: String) -> StatusCNPJ {
    let cnpj = NSString(string: cnpj)
    
    var status: StatusCNPJ
    
    let retornoVerificarComuns = verificaComunsCNPJ(cnpj: cnpj)
    
    switch retornoVerificarComuns {
    case 0:
      let retornoValidarDigitos: Bool = validaDigitosCNPJ(cnpj: cnpj)
      
      if (retornoValidarDigitos == false) {
        status = .invalido
      } else {
        status = .valido
      }
      break
      
    case 1:
      status = .inferior14Digitos
      break
      
    case 2:
      status = .naoPermitido
      break
      
    default:
      status = .desconhecido
      break
    }
    
    return status
  }
  
  fileprivate static func validaDigitosCNPJ(cnpj: NSString) -> Bool {
    var soma: Int = 0
    var peso: Int
    let digito_verificador_13: Int = Int(cnpj.substring(with: NSMakeRange(12, 1)))!
    let digito_verificador_14: Int = Int(cnpj.substring(with: NSMakeRange(13, 1)))!
    var digito_verificador_13_correto: Int
    var digito_verificador_14_correto: Int
    
    // Verificação do 13 dígito
    peso = 2
    for i in (0...11).reversed() {
      soma = soma + (Int(cnpj.substring(with: NSMakeRange(i, 1)))! * peso)
      peso = peso + 1
      
      if (peso == 10) {
        peso = 2
      }
    }
    
    if (soma % 11 == 0 || soma % 11 == 1) {
      digito_verificador_13_correto = 0
    } else {
      digito_verificador_13_correto = 11 - (soma % 11)
    }
    
    // Verifição do 14 dígito
    soma = 0
    peso = 2
    for i in (0...12).reversed() {
      soma = soma + (Int(cnpj.substring(with: NSMakeRange(i, 1)))! * peso)
      peso = peso + 1
      
      if (peso == 10) {
        peso = 2
      }
    }
    
    if (soma % 11 == 0 || soma % 11 == 1) {
      digito_verificador_14_correto = 0
    } else {
      digito_verificador_14_correto = 11 - (soma % 11)
    }
    
    // Retorno
    if (digito_verificador_13_correto == digito_verificador_13 && digito_verificador_14_correto == digito_verificador_14) {
      
      return true
      
    } else {
      return false
    }
  }
  
  /*
   0 - Validado
   1 - Não possui 14 digitos
   2 - CNPJ não permitido: Sequencia de números
   */
  fileprivate static func verificaComunsCNPJ(cnpj: NSString) -> Int {
    if (cnpj.length != 14 || cnpj.isEqual(to: "")) {
      return 1
    } else if (cnpj.isEqual(to: "00000000000000") ||
      cnpj.isEqual(to: "11111111111111") ||
      cnpj.isEqual(to: "22222222222222") ||
      cnpj.isEqual(to: "33333333333333") ||
      cnpj.isEqual(to: "44444444444444") ||
      cnpj.isEqual(to: "55555555555555") ||
      cnpj.isEqual(to: "66666666666666") ||
      cnpj.isEqual(to: "77777777777777") ||
      cnpj.isEqual(to: "88888888888888") ||
      cnpj.isEqual(to: "99999999999999")) {
      return 2
    } else {
      return 0
    }
  }
}
