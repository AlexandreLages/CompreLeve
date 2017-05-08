//
//  Produto+CoreDataProperties.swift
//  CompraLeve
//
//  Created by Student on 5/8/17.
//  Copyright © 2017 Wolves. All rights reserved.
//

import Foundation
import CoreData


extension Produto {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Produto> {
        return NSFetchRequest<Produto>(entityName: "Produto");
    }

    @NSManaged public var nome: String?
    @NSManaged public var descricao: String?
    @NSManaged public var preco: Double
    @NSManaged public var unidadeDeMedida: Int16
    @NSManaged public var categoria: Int16
}
