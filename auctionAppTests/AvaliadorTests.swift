//
//  AvaliadorTests.swift
//  auctionAppTests
//
//  Created by Gabriela Sillis on 07/05/21.
//

import XCTest

@testable import auctionApp

class AvaliadorTests: XCTestCase {
    
    private var joao: Usuario!
    private var maria: Usuario!
    private var jose: Usuario!
    private var leiloeiro: Avaliador!
    
    override func setUpWithError() throws {
        joao = Usuario(nome: "Joao")
        maria = Usuario(nome: "Maria")
        jose = Usuario(nome: "Jose")
        leiloeiro = Avaliador( )
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDeveEntenderLancesEmOrdemCrescente() throws {
        let leilao = CriadorDeLeilao().para(descricao:  "Playstation 4")
            .lance(joao, 500.0)
            .lance(maria, 1000.0)
            .lance(jose, 300.0).constroi()
    
        try? leiloeiro.avalia(leilao: leilao)
    
        XCTAssertEqual(300.0, leiloeiro.menorLance())
        XCTAssertEqual(1000.0, leiloeiro.maiorLance())
    }
    
    func testDeveEntenderLeilaoComApenasUmLance() {
        let leilao = CriadorDeLeilao().para(descricao: "Playstation 4")
            .lance(joao, 1000.0).constroi()
        
        try? leiloeiro.avalia(leilao: leilao)
        
        XCTAssertEqual(1000.0, leiloeiro.menorLance())
        XCTAssertEqual(1000.0, leiloeiro.maiorLance())
    }
    
    func testDeveEncontrarOsTreisMaiores( ) {
        let leilao = CriadorDeLeilao().para(descricao:  "Playstation 4")
            .lance(joao, 400.0)
            .lance(maria, 600.0)
            .lance(joao, 100.0).constroi()
    
        try? leiloeiro.avalia(leilao: leilao)
        
        let listaDeValores = leiloeiro.tresMaiores( )
        
        XCTAssertEqual(3, listaDeValores.count)
    }
    
    func testDeveIgnorarLeilaoSemLance() {
        let leilao = CriadorDeLeilao().para(descricao: "Playstation 4").constroi()
    
        XCTAssertThrowsError(try leiloeiro.avalia(leilao: leilao), "Não é possível avaliar um leilão sem lance") { (error) in
            print(error.localizedDescription)
        }
    }
}
