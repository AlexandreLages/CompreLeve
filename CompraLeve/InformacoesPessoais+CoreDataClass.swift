//
//  InformacoesPessoais+CoreDataClass.swift
//  CompraLeve
//
//  Created by Student on 5/8/17.
//  Copyright © 2017 Wolves. All rights reserved.
//

import Foundation
import CoreData

public class InformacoesPessoais: NSManagedObject {

    convenience init() {
        let context = CoreDataManager.compraLeveContext
        let entity = NSEntityDescription.entity(forEntityName: "InformacoesPessoais", in: context)
        
        self.init(entity: entity!, insertInto: context)
    }
}
