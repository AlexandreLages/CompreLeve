//
//  InformacaoPessoalViewController.swift
//  CompraLeve
//
//  Created by Student on 5/9/17.
//  Copyright © 2017 Wolves. All rights reserved.
//

import UIKit

class InformacaoPessoalViewController: UIViewController {

    @IBOutlet weak var nomeTextField: UITextField!
    
    @IBOutlet weak var celularTextField: UITextField!
    
    @IBOutlet weak var ruaTextField: UITextField!
    
    @IBOutlet weak var bairroTextField: UITextField!
    
    @IBOutlet weak var numeroTextField: UITextField!
    
    @IBOutlet weak var rgTextField: UITextField!
    
    @IBOutlet weak var cpfTextField: UITextField!
    
    @IBOutlet weak var complementoTextField: UITextField!
    
    var numeroInt16: Int16 {
        if let text = numeroTextField.text {
            if let intValue = Int16(text) {
                return intValue
            }
        }
        return 0
    }
    
    var bairroInt16: Int16 {
        if let text = bairroTextField.text {
            if let intValue = Int16(text) {
                return intValue
            }
        }
        return 0
    }
    
    @IBAction func addButton() {
        let nome = nomeTextField.text
        let celular = celularTextField.text
        let rua = ruaTextField.text
        let bairro = bairroInt16
        let numero = numeroInt16
        let rg = rgTextField.text
        let cpf = cpfTextField.text
        let complemento = complementoTextField.text
        
        let informacaoPessoal = InformacoesPessoais()
        informacaoPessoal.nome = nome
        informacaoPessoal.celular = celular
        informacaoPessoal.rua = rua
        informacaoPessoal.bairro = bairro
        informacaoPessoal.numero = numero
        informacaoPessoal.rg = rg
        informacaoPessoal.cpf = cpf
        informacaoPessoal.complemento = complemento
        
        if InformacoesPessoaisDAO.insert(informacaoPessoal: informacaoPessoal) {
            print("Informações salvas com sucesso")
            self.navigationController?.popViewController(animated: true)
        } else {
            print("Deu merda")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
