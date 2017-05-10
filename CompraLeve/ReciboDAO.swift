//
//  ReciboDAO.swift
//  CompraLeve
//
//  Created by Student on 5/10/17.
//  Copyright © 2017 Wolves. All rights reserved.
//

import Foundation
import CoreData

class ReciboDAO {
    static func insert(recibo: Recibo) -> Bool {
        return CoreDataManager.insert(recibo)
    }
    
    static func delete(recibo: Recibo) -> Bool {
        return CoreDataManager.delete(recibo)
    }
    
    static func getRecibos() -> [Recibo] {
        var recibos = [Recibo]()
        
        let request: NSFetchRequest<Recibo> = Recibo.fetchRequest()
        
        do {
            try recibos = CoreDataManager.compraLeveContext.fetch(request)
        }catch let error {
            print("Erro ao buscar: \(error.localizedDescription)")
        }
        return recibos
    }
}
