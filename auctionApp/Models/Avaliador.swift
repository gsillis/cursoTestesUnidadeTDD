//
//  Avaliador.swift
//  auctionApp
//
//  Created by Gabriela Sillis on 07/05/21.
//

import Foundation

class Avaliador {
    private var maiorQueTodos = Double.leastNonzeroMagnitude
    private var menorDeTodos = Double.greatestFiniteMagnitude
    
    func avalia(leilao: Leilao) {
        guard let lances = leilao.lance else { return }
        
        for lance in lances {
            if lance.valor > maiorQueTodos  {
                maiorQueTodos = lance.valor
            }
            if lance.valor < menorDeTodos {
                menorDeTodos = lance.valor
            }
        }
    }
    
    func maiorLance( ) ->  Double {
        return maiorQueTodos
    }
    
    func menorLance( ) -> Double {
        return menorDeTodos
    }
}
