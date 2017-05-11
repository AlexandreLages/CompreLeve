//
//  Recibo+CoreDataProperties.swift
//  CompraLeve
//
//  Created by Student on 5/11/17.
//  Copyright © 2017 Wolves. All rights reserved.
//

import Foundation
import CoreData


extension Recibo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Recibo> {
        return NSFetchRequest<Recibo>(entityName: "Recibo");
    }

    @NSManaged public var recibo: String?
    @NSManaged public var titulo: String?
    
    func toAnyObject() -> Any {
        return [
            "recibo": recibo,
            "titulo":titulo
        ]
    }

}
