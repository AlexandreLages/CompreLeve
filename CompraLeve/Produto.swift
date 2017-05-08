//
//  Produto+CoreDataClass.swift
//  CompraLeve
//
//  Created by Student on 5/8/17.
//  Copyright © 2017 Wolves. All rights reserved.
//

import Foundation

public class Produto {
    let nome: String
    let preco: Double
    let categoria: Int
    let unidadeDeMedida:Int
    let descricao:String
    
    init(nome: String, preco:Double, categoria:Int, unidadeDeMedida:Int, descricao:String) {
        self.nome = nome
        self.preco = preco
        self.categoria = categoria
        self.unidadeDeMedida = unidadeDeMedida
        self.descricao = descricao
    }
}
