//
//  Bairro.swift
//  CompraLeve
//
//  Created by Artur Miranda on 11/05/17.
//  Copyright © 2017 Wolves. All rights reserved.
//

import Foundation
import Foundation
import FirebaseDatabase
import Firebase

public class Bairro {
    let nome: String
    let taxa: Double
    let key: String
    let ref: FIRDatabaseReference?
    
    init(nome: String, taxa:Double, key: String = "") {
        self.nome = nome
        self.taxa = taxa

        self.key = key
        self.ref = nil
    }
    
    init(snapshot: FIRDataSnapshot) {
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        nome = snapshotValue["nome"] as! String
        taxa = snapshotValue["taxa"] as! Double
        ref = snapshot.ref
    }
}
