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
    private var maiores: [Lances] = [ ]
    
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
        
        pegaOsMaioresLances(leilao)
    }
    
    func maiorLance( ) ->  Double {
        return maiorQueTodos
    }
    
    func menorLance( ) -> Double {
        return menorDeTodos
    }
    
    private func pegaOsMaioresLances(_ leilao: Leilao) {
        guard let lances = leilao.lance else { return }
        maiores = lances.sorted(by:{ (lista1, lista2) -> Bool in
            return lista1.valor > lista2.valor
        })
    
        let maioresLances = maiores.prefix(3)
        maiores = Array(maioresLances)
    }
    
    func tresMaiores( ) -> [Lances] {
        return maiores
    }
}
