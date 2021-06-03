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
        guard let listaDeLance = lance else {return}
        if listaDeLance.count == 0 || podeDarLance(oferta.usuario, listaDeLance) {
            lance?.append(oferta)
        }
    }
    
    private func ultimoLance(_ lance: [Lances])  -> Lances {
        return lance[lance.count - 1]
    }
    
    private func quantidadeDeLancesDoUsuario( _ usuario: Usuario) -> Int {
        guard let listaDeLance = lance else {return 0}
        var total: Int = 0
        for lanceAtual in listaDeLance {
            
            if lanceAtual.usuario == usuario {
                total += 1
            }
        }
        return total
    }
    
    private func podeDarLance(_ usuario: Usuario, _ listaDeLance: [Lances]) -> Bool {
        return ultimoLance(listaDeLance).usuario != usuario &&
            quantidadeDeLancesDoUsuario(usuario) < 5
    }
}

