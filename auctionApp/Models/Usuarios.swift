//
//  Usuario.swift
//  auctionApp
//
//  Created by Gabriela Sillis on 07/05/21.
//

import Foundation

class Usuario  {
    let id: Int?
    let nome: String
    
    init(id: Int? = nil, nome: String) {
        self.id = id
        self.nome = nome
        }
    }

extension Usuario: Equatable {
    static func == (lhs: Usuario, rhs: Usuario) -> Bool {
        if lhs.id != rhs.id || rhs.nome != lhs.nome {
            return false
        }
        return true
    }
}
