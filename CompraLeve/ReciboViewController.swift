//
//  ReciboViewController.swift
//  CompraLeve
//
//  Created by Student on 5/11/17.
//  Copyright © 2017 Wolves. All rights reserved.
//

import UIKit

class ReciboViewController: UIViewController {
    var recibo:Recibo? = nil
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var contentLabel: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tituloLabel.text = recibo?.titulo
        contentLabel.text = recibo?.recibo
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
