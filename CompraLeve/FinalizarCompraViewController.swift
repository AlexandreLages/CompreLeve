//
//  FinalizarCompraViewController.swift
//  CompraLeve
//
//  Created by Student on 5/10/17.
//  Copyright © 2017 Wolves. All rights reserved.
//

import UIKit

class FinalizarCompraViewController: UIViewController {
    
    var string = ""
    var informacoesPessoais: InformacoesPessoais?
    
    @IBOutlet weak var reciboTextView: UITextView!
    
    @IBAction func finalizarCompraButton() {
        let recibo = Recibo()
        recibo.recibo = string
        if ReciboDAO.insert(recibo: recibo) {
            print("Recibo salvo com sucesso")
        } else {
            print("Erro ao salvar recibo")
        }
    }
    
    func transformarEmString(){
        var totalDoTotal: Double = 0
        
        string += "-------------COMPRA LEVE--------------\n"
        string += "\n"
        string += (informacoesPessoais?.nome)!
        string += "\n"
        string += (informacoesPessoais?.cpf)!
        string += "\n"
        string += (informacoesPessoais?.rg)!
        string += "\n"
        string += (informacoesPessoais?.celular)!
        string += "\n"
        string += (informacoesPessoais?.rua)!
        string += "\n"
        string += String((informacoesPessoais?.bairro)!)
        string += "\n"
        string += String((informacoesPessoais?.numero)!)
        string += "\n"
        for i in ListaProdutosTableViewController.itens{
            let total = i.produto.preco * Double(i.quantidade)
            string+="\(i.produto.nome) qtd \(i.quantidade) preco unt R$ = \(i.produto.preco) total R$ = \(total)\n"
            totalDoTotal += total
        }
        
        
        string += "TOTAL: \(totalDoTotal)\n"
        reciboTextView.text = string
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        transformarEmString()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
