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
