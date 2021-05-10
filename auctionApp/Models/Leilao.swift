//
//  Leilao.swift
//  auctionApp
//
//  Created by Gabriela Sillis on 07/05/21.
//

import Foundation

class Leilao {
    let descricao: String
    let imagem: String?
    var lance: [Lances]?
    
    init(descricao: String, imagem: String? = nil, lance: [Lances] = [ ]) {
        self .descricao = descricao
        self.imagem = imagem
        self.lance = lance
    }
    
    func proposta(oferta: Lances) {
        lance?.append(oferta)
    }
    
}


