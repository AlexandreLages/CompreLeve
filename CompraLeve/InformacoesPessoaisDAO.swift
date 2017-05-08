//
//  InformacoesPessoaisDAO.swift
//  CompraLeve
//
//  Created by Student on 5/8/17.
//  Copyright © 2017 Wolves. All rights reserved.
//

import Foundation
import CoreData

class InformacoesPessoaisDAO {
    static func insert(filme: InformacoesPessoais) -> Bool {
        return CoreDataManager.insert(filme)
    }
    
    static func delete(filme: InformacoesPessoais) -> Bool {
        return CoreDataManager.delete(filme)
    }
    
    static func getInformacoesPessoais() -> [InformacoesPessoais] {
        var informacoesPessoais = [InformacoesPessoais]()
        
        let request: NSFetchRequest<InformacoesPessoais> = InformacoesPessoais.fetchRequest()
        
        do {
            try informacoesPessoais = CoreDataManager.compraLeveContext.fetch(request)
        }catch let error {
            print("Erro ao buscar: \(error.localizedDescription)")
        }
        return informacoesPessoais
    }
}
