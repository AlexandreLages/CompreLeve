//
//  InformacoesPessoais+CoreDataProperties.swift
//  CompraLeve
//
//  Created by Student on 5/9/17.
//  Copyright © 2017 Wolves. All rights reserved.
//

import Foundation
import CoreData


extension InformacoesPessoais {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<InformacoesPessoais> {
        return NSFetchRequest<InformacoesPessoais>(entityName: "InformacoesPessoais");
    }

    @NSManaged public var bairro: Int16
    @NSManaged public var celular: String?
    @NSManaged public var complemento: String?
    @NSManaged public var cpf: String?
    @NSManaged public var nome: String?
    @NSManaged public var numero: Int16
    @NSManaged public var rg: String?
    @NSManaged public var rua: String?

}
