//
//  Recibo+CoreDataClass.swift
//  CompraLeve
//
//  Created by Student on 5/8/17.
//  Copyright © 2017 Wolves. All rights reserved.
//

import Foundation
import CoreData

public class Recibo: NSManagedObject {

    convenience init() {
        let context = CoreDataManager.compraLeveContext
        let entity = NSEntityDescription.entity(forEntityName: "Recibo", in: context)
        
        self.init(entity: entity!, insertInto: context)
    }
}
