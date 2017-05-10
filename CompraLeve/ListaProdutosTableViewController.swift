//
//  ListaProdutosTableViewController.swift
//  CompraLeve
//
//  Created by Student on 5/8/17.
//  Copyright © 2017 Wolves. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import ActionSheetPicker_3_0

class ListaProdutosTableViewController: UITableViewController {
    var produtos = [Produto]()
    static var itens = [Item]()
    
    @IBOutlet weak var secaoButton: UIButton!

    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    @IBAction func secaoButtonTouched(_ sender: Any) {
        ActionSheetStringPicker.show(withTitle: "Multiple String Picker", rows: ["Todos", "Limpeza", "Descartaveis"], initialSelection: 0, doneBlock: {
                picker, indexes, values in
                
                print("values = \(values)")
                print("indexes = \(indexes)")
                print("picker = \(picker)")
                return
        }, cancel: { ActionMultipleStringCancelBlock in return }, origin: sender)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadingView.startAnimating()
        
        let ref = FIRDatabase.database().reference(withPath: "produtos")
        ref.observe(.value, with: { snapshot in
            // 2
            var newProducts: [Produto] = []
            
            // 3
            for item in snapshot.children {
                // 4
                let productItem = Produto(snapshot: item as! FIRDataSnapshot)
                newProducts.append(productItem)
            }
            
            // 5
            self.produtos = newProducts
            if(self.produtos.count > 0){
                self.loadingView.stopAnimating()
            }
            print("RECARREGANDO")
            self.tableView.reloadData()
        })
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.produtos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "produtoCell", for: indexPath)

        let produto: Produto
        produto = produtos[indexPath.row]
        
        if let produtoCell = cell as? ListaProdutosTableViewCell {
            
            produtoCell.qntLabel.text = String(0)
            produtoCell.quantidade = 0
            produtoCell.qntStepper.value = 0
            for item in ListaProdutosTableViewController.itens{
                if(item.produto.nome == produto.nome){
                    produtoCell.qntLabel.text = String(item.quantidade)
                    produtoCell.quantidade = item.quantidade
                    produtoCell.qntStepper.value = Double(item.quantidade)
                }
            }
            produtoCell.nomeLabel.text = produto.nome
            produtoCell.precoLabel.text = String(produto.preco)
            produtoCell.produto = produto
            
        }
        
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation

}
