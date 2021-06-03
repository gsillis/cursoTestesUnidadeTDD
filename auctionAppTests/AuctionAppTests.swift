//
//  auctionAppTests.swift
//  auctionAppTests
//
//  Created by Gabriela Sillis on 07/05/21.
//

import XCTest

@testable import auctionApp

class auctionAppTests: XCTestCase {
    
    private var gabriela: Usuario!
    private var denner: Usuario!
    
    override func setUpWithError() throws {
        gabriela = Usuario(nome: "Gabriela")
        denner = Usuario(nome: "Denner")
    }
    
    override func tearDownWithError() throws {
        
    }
    
    func testDeveReceberUmLance() {
        let leilao = CriadorDeLeilao().para(descricao: "Macbook Pro M1")
            .lance(gabriela, 10.000).constroi()
        
        XCTAssertEqual(1, leilao.lance?.count)
        XCTAssertEqual(10.000, leilao.lance?.first?.valor)
    }
    
    func testDeveReceberVariosLances() {
        let leilao = CriadorDeLeilao().para(descricao: "Macbook Pro M1")
            .lance(gabriela, 10.000)
            .lance(denner, 12.000).constroi()

        XCTAssertEqual(2, leilao.lance?.count)
        XCTAssertEqual(10.000, leilao.lance?.first?.valor)
        XCTAssertEqual(12.000, leilao.lance?[1].valor)
    }
    
    func testDeveIgnorarDoisLancesSeguidosDoMesmoUsuario() {
        let leilao = CriadorDeLeilao().para(descricao: "Macbook Pro M1")
            .lance(denner, 10.000)
            .lance(denner, 12.000).constroi()
        
        XCTAssertEqual(1, leilao.lance?.count)
        XCTAssertEqual(10.000, leilao.lance?.first?.valor)
    }
    
    func testDeveIgnorarMaisDeCincoLancesDoMesmoUsuario() {
        let leilao = CriadorDeLeilao().para(descricao: "Macbook Air M1")
            .lance(gabriela, 3.000)
            .lance(denner, 4.000)
            .lance(gabriela, 5.000)
            .lance(denner, 6.000)
            .lance(gabriela, 7.000)
            .lance(denner, 8.000)
            .lance(gabriela, 9.000)
            .lance(denner, 10.000)
            .lance(gabriela, 11.000)
            .lance(denner, 12.000)
            .lance(gabriela, 13.000).constroi()
        
        XCTAssertEqual(10, leilao.lance?.count)
        XCTAssertEqual(12.000, leilao.lance?.last?.valor)
    }
}
