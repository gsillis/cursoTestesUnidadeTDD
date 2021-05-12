//
//  AvaliadorTests.swift
//  auctionAppTests
//
//  Created by Gabriela Sillis on 07/05/21.
//

import XCTest
@testable import auctionApp

class AvaliadorTests: XCTestCase {

    override func setUpWithError() throws {

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testeDeveEntenderLancesEmOrdemCrescente() throws {
        let joao = Usuario(nome: "Joao")
        let maria = Usuario(nome: "Maria")
        let jose = Usuario(nome: "Jose")
        
        let leilao = Leilao(descricao: "Playstation 4")
        
        leilao.proposta(oferta: Lances(usuario: joao, valor: 500.0))
        leilao.proposta(oferta: Lances(usuario: maria, valor: 1000.0))
        leilao.proposta(oferta: Lances(usuario: jose, valor: 300.0))
        
        let leiloeiro = Avaliador( )
        leiloeiro.avalia(leilao: leilao)
        
        print(leiloeiro.maiorLance( ))
        print(leiloeiro.menorLance( ))
        
        XCTAssertEqual(300.0, leiloeiro.menorLance())
        XCTAssertEqual(1000.0, leiloeiro.maiorLance())
    }
    
    func testDeveEntenderLeilaoComApenasUmLance() {
        let joao =  Usuario(nome: "Joao")
        let leilao = Leilao(descricao: "Playstation 4")
        leilao.proposta(oferta: Lances(usuario: joao, valor: 1000.0))
        
        let leiloeiro = Avaliador( )
        leiloeiro.avalia(leilao: leilao)
        
        XCTAssertEqual(1000.0, leiloeiro.menorLance())
        XCTAssertEqual(1000.0, leiloeiro.maiorLance())
    }
    
    func testeDeveEncontrarOsTreisMaiores( ) {
        let joao = Usuario(nome: "Joao")
        let maria = Usuario(nome: "Maria")
        let joaquim = Usuario(nome: "Joaquim")
        
        let leilao = Leilao(descricao: "Playstantion 4")
        
        leilao.proposta(oferta: Lances(usuario: joao, valor: 400.0))
        leilao.proposta(oferta: Lances(usuario: maria, valor: 600.0))
        leilao.proposta(oferta: Lances(usuario: joaquim, valor: 100.0))
        
        let leiloeiro = Avaliador( )
        leiloeiro.avalia(leilao: leilao)
        
        let listaDeValores = leiloeiro.tresMaiores( )
        
        XCTAssertEqual(3, listaDeValores.count)
    }
}
