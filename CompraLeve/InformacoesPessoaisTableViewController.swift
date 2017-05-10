//
//  InformacoesPessoaisTableViewController.swift
//  CompraLeve
//
//  Created by Student on 5/9/17.
//  Copyright © 2017 Wolves. All rights reserved.
//

import UIKit

class InformacoesPessoaisTableViewController: UITableViewController {

    var informacoesPessoais = [InformacoesPessoais]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.informacoesPessoais = InformacoesPessoaisDAO.getInformacoesPessoais()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.informacoesPessoais = InformacoesPessoaisDAO.getInformacoesPessoais()
        self.tableView.reloadData()
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
        return informacoesPessoais.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "informacaoPessoalIdentifier", for: indexPath)

        if let informacaoPessoalCell = cell as? InformacaoPessoalTableViewCell {
            let informacaoPessoal = self.informacoesPessoais[indexPath.row]
            informacaoPessoalCell.nomeLabel.text = informacaoPessoal.nome
            informacaoPessoalCell.celularLabel.text = informacaoPessoal.celular
            informacaoPessoalCell.ruaLabel.text = informacaoPessoal.rua
            informacaoPessoalCell.bairroLabel.text = String (informacaoPessoal.bairro)
            informacaoPessoalCell.numeroLabel.text = String (informacaoPessoal.numero)
            informacaoPessoalCell.complementoLabel.text = informacaoPessoal.complemento
            informacaoPessoalCell.cpfLabel.text = informacaoPessoal.cpf
            informacaoPessoalCell.rgLabel.text = informacaoPessoal.rg
        }
        return cell
    }

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            InformacoesPessoaisDAO.delete(informacaoPessoal: self.informacoesPessoais[indexPath.row])
            self.informacoesPessoais = InformacoesPessoaisDAO.getInformacoesPessoais()
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
