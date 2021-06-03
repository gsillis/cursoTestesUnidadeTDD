//
//  CriadorDeLeilao.swift
//  auctionApp
//
//  Created by Gabriela Sillis on 03/06/21.
//

import UIKit

class CriadorDeLeilao: NSObject {
    private var leilao: Leilao!
    
    func para(descricao: String) -> Self{
        leilao = Leilao(descricao: descricao)
        return self
    }
    
    func lance(_ usuario: Usuario, _ valor: Double) -> Self{
        leilao.proposta(oferta: Lances(usuario: usuario, valor: valor))
        return self
    }
    
    func constroi() -> Leilao {
        return leilao
    }
    
     override init() {
    }
}
