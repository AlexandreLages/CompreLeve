//
//  Produto+CoreDataClass.swift
//  CompraLeve
//
//  Created by Student on 5/8/17.
//  Copyright © 2017 Wolves. All rights reserved.
//

import Foundation
import FirebaseDatabase
import Firebase

public class Produto {
    let nome: String
    let preco: Double
    let categoria: Int
    let unidadeDeMedida:Int
    let descricao:String
    let imgUrl:String
    let key: String
    let ref: FIRDatabaseReference?
    
    init(nome: String, preco:Double, categoria:Int, unidadeDeMedida:Int, descricao:String, imgUrl:String, key: String = "") {
        self.nome = nome
        self.preco = preco
        self.categoria = categoria
        self.unidadeDeMedida = unidadeDeMedida
        self.descricao = descricao
        self.imgUrl = imgUrl
        self.key = key
        self.ref = nil
    }
    
    init(snapshot: FIRDataSnapshot) {
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        nome = snapshotValue["nome"] as! String
        preco = snapshotValue["preco"] as! Double
        categoria = snapshotValue["categoria"] as! Int
        unidadeDeMedida = snapshotValue["unidadeDeMedida"] as! Int
        descricao = snapshotValue["descricao"] as! String
        imgUrl = snapshotValue["imgUrl"] as! String
        ref = snapshot.ref
    }
}
