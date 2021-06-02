//
//  auctionAppTests.swift
//  auctionAppTests
//
//  Created by Gabriela Sillis on 07/05/21.
//

import XCTest

@testable import auctionApp

class auctionAppTests: XCTestCase {
    
    override func setUpWithError() throws {
        
    }
    
    override func tearDownWithError() throws {
        
    }
    
    func testDeveReceberUmLance() {
        let leilao = Leilao(descricao: "Macbook Pro M1")
        XCTAssertEqual(0, leilao.lance?.count)
        
        let nome = Usuario(nome: "Gabriela")
        leilao.proposta(oferta: Lances(usuario: nome, valor: 10.000))
        
        XCTAssertEqual(1, leilao.lance?.count)
        XCTAssertEqual(10.000, leilao.lance?.first?.valor)
        
    }
    
    func testDeveReceberVariosLances() {
        let leilao = Leilao(descricao: "Macbook Pro 2020 M1")
        
        let nome1 = Usuario(nome: "Denner")
        let nome2 = Usuario(nome: "Gabriela")
        
        leilao.proposta(oferta: Lances(usuario: nome1, valor: 10.000))
        leilao.proposta(oferta: Lances(usuario: nome2, valor: 12.000))
        
        XCTAssertEqual(2, leilao.lance?.count)
        
        XCTAssertEqual(10.000, leilao.lance?.first?.valor)
        XCTAssertEqual(12.000, leilao.lance?[1].valor)
    }
    
    func testDeveIgnorarDoisLancesSeguidosDoMesmoUsuario() {
        let leilao = Leilao(descricao: "Macbook Pro 2020 M1")
        let denner = Usuario(nome: "Denner")
        let gabriela = Usuario(nome: "Gabriela")
        
        leilao.proposta(oferta: Lances(usuario: denner, valor: 10.000))
        leilao.proposta(oferta: Lances(usuario: denner, valor: 12.000))
        leilao.proposta(oferta: Lances(usuario: gabriela, valor: 9.000))
        leilao.proposta(oferta: Lances(usuario: gabriela, valor: 5.000))
        
        XCTAssertEqual(1, leilao.lance?.count)
        
    }
    
    func testDeveIgnorarMaisDeCincoLancesDoMesmoUsuario() {
        let leilao = Leilao.init(descricao: "Macbook Air m1")
        let gabriela = Usuario.init(nome: "Gabriela")
        let denner = Usuario.init(nome: "Denner")
        
        leilao.proposta(oferta: Lances(usuario: gabriela, valor: 3.000))
        leilao.proposta(oferta: Lances(usuario: denner, valor: 4.000))
        
        leilao.proposta(oferta: Lances(usuario: gabriela, valor: 5.000))
        leilao.proposta(oferta: Lances(usuario: denner, valor: 6.000))
        
        leilao.proposta(oferta: Lances(usuario: gabriela, valor: 7.000))
        leilao.proposta(oferta: Lances(usuario: denner, valor: 8.000))
        
        leilao.proposta(oferta: Lances(usuario: gabriela, valor: 9.000))
        leilao.proposta(oferta: Lances(usuario: denner, valor: 10.000))
        
        leilao.proposta(oferta: Lances(usuario: gabriela, valor: 11.000))
        leilao.proposta(oferta: Lances(usuario: denner, valor: 12.000))
        
        //deve ignorar esta oferta
        leilao.proposta(oferta: Lances(usuario: denner, valor: 15.000))
        
        XCTAssertEqual(10, leilao.lance?.count)
        XCTAssertEqual(12.000, leilao.lance?.last?.valor)
    }
}
