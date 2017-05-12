//
//  ProdutosSelecionadosTableViewCell.swift
//  CompraLeve
//
//  Created by Student on 5/9/17.
//  Copyright © 2017 Wolves. All rights reserved.
//

import UIKit

class ProdutosSelecionadosTableViewCell: UITableViewCell {

    @IBOutlet weak var nomeProdutoLabel: UILabel!
    @IBOutlet weak var quantidadeLabel: UILabel!
    @IBOutlet weak var precoTotalLabel: UILabel!
    @IBOutlet weak var precoLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
