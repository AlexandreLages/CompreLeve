//
//  FinalizarCompraViewController.swift
//  CompraLeve
//
//  Created by Student on 5/10/17.
//  Copyright © 2017 Wolves. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class FinalizarCompraViewController: UIViewController {
    
    var string = ""
    var informacoesPessoais: InformacoesPessoais?
    
    @IBOutlet weak var reciboTextView: UITextView!
    
    @IBAction func finalizarCompraButton() {
        let recibo = Recibo()
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        let result = formatter.string(from: date)
        recibo.titulo = "Recibo "+result
        recibo.recibo = string
        let comprasRef = FIRDatabase.database().reference(withPath: "compras")
        comprasRef.childByAutoId().setValue(recibo.toAnyObject())
        if ReciboDAO.insert(recibo: recibo) {
            print("Recibo salvo com sucesso")
        } else {
            print("Erro ao salvar recibo")
        }
        ListaProdutosTableViewController.itens.removeAll()
        //self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
        //self.navigationController?.popToRootViewController(animated: true)
        //let alert = UIAlertController(title: "Aviso", message: "Sua compra foi realizada! Aguarde a entrega.", preferredStyle: UIAlertControllerStyle.alert)
        //alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        //self.present(alert, animated: true, completion: nil)
        
        let alert = UIAlertController(title: "Aviso", message: "Sua compra foi realizada com sucesso!", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: alertHandler))
        self.present(alert, animated: true, completion: nil)
    }
    func alertHandler(action:UIAlertAction) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func transformarEmString(){
        var totalDoTotal: Double = 0
        
        string += "Nome: "+(informacoesPessoais?.nome!)!
        string += "\n"
        string += "CPF: "+(informacoesPessoais?.cpf!)!
        string += "\n"
        string += "Rg: "+(informacoesPessoais?.rg!)!
        string += "\n"
        string += "Celular: "+(informacoesPessoais?.celular!)!
        string += "\n"
        string += "Rua: "+(informacoesPessoais?.rua!)!
        string += "\n"
        string += "Bairro: "+String((informacoesPessoais?.bairro)!)
        string += "\n"
        string += "Numero: "+String((informacoesPessoais?.numero)!)
        string += "\n\n"
        for i in ListaProdutosTableViewController.itens{
            let total = i.produto.preco * Double(i.quantidade)
            string+="\n\(i.produto.nome) \nQtd: \(i.quantidade) \tPreco uni: R$ = \(i.produto.preco) \nTotal R$ = \(total)\n"
            totalDoTotal += total
        }
        
        
        string += "\nTOTAL: \(totalDoTotal)\n"
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
