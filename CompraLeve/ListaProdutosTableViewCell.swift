//
//  ListaProdutosTableViewCell.swift
//  CompraLeve
//
//  Created by Student on 5/8/17.
//  Copyright © 2017 Wolves. All rights reserved.
//

import UIKit

class ListaProdutosTableViewCell: UITableViewCell {

    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var precoLabel: UILabel!
    @IBOutlet weak var qntLabel: UILabel!
    var produto: Produto? = nil
    var quantidade: Int = 0
    
    @IBAction func defineQnt(_ sender: UIStepper) {
        for item in ListaProdutosTableViewController.itens{
            if(item.produto.nome == self.produto!.nome){
                item.quantidade = Int(sender.value)
                qntLabel.text = String(Int(sender.value))
                return
            }
        }
        ListaProdutosTableViewController.itens.append(Item(self.produto!, Int(sender.value)))
        print(ListaProdutosTableViewController.itens)
        qntLabel.text = String(Int(sender.value))
    }
    
}
