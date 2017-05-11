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
    var produtosFiltrados = [Produto]()
    static var itens = [Item]()
    var categorias = [String]()
    var filtroCategorias = 0
    
    @IBOutlet weak var secaoButton: UIButton!

    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    @IBAction func secaoButtonTouched(_ sender: Any) {
        ActionSheetStringPicker.show(withTitle: "Categorias", rows: self.categorias, initialSelection: filtroCategorias, doneBlock: {
                picker, indexes, values in
                
                print("values = \(values)")
                print("indexes = \(indexes)")
                self.filtroCategorias = indexes
                self.filtrarProdutos()
                self.secaoButton.setTitle(values as! String?, for: .normal)
                print("picker = \(picker)")
                return
        }, cancel: { ActionMultipleStringCancelBlock in return }, origin: sender)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadingView.startAnimating()
        
        let ref = FIRDatabase.database().reference(withPath: "produtos")
        ref.observe(.value, with: { snapshot in
            var newProducts: [Produto] = []
            for item in snapshot.children {
                let productItem = Produto(snapshot: item as! FIRDataSnapshot)
                newProducts.append(productItem)
            }
            self.produtos = newProducts
            if(self.produtos.count > 0){
                self.loadingView.stopAnimating()
            }
            print("RECARREGANDO")
            self.tableView.reloadData()
        })
        let refCat = FIRDatabase.database().reference(withPath: "categorias")
        refCat.observe(.value, with: { snapshot in
            var novasCategorias: [String] = []
            for cat in snapshot.children {
                novasCategorias.append((cat as AnyObject).value)
            }
            self.categorias = novasCategorias
            print("RECARREGANDO CATEGORIAS")
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
        if filtroCategorias != 0 {
            return self.produtosFiltrados.count
        }
        return self.produtos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "produtoCell", for: indexPath)

        let produto: Produto
        if filtroCategorias != 0 {
            produto = produtosFiltrados[indexPath.row]
        } else {
            produto = produtos[indexPath.row]
        }
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
            produtoCell.precoLabel.text = "R$ "+String(produto.preco)
            let urlString = produto.imgUrl
            if let url = URL(string: urlString) {
                let request = URLRequest(url: url)
                
                let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                    if let responseData = data {
                        produtoCell.imgView.image = UIImage(data: responseData)
                    }
                    
                })
                task.resume()
            }
            produtoCell.produto = produto
            
        }
        
        
        return cell
    }
    
    func filtrarProdutos() {
        produtosFiltrados = self.produtos.filter { produto in
            return produto.categoria == filtroCategorias
        }
        tableView.reloadData()
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
