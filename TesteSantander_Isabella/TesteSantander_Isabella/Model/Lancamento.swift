//
//  Lancamento.swift
//  TesteSantander_Isabella
//
//  Created by isabella.bitencourt on 08/07/19.
//  Copyright © 2019 isabella.bitencourt. All rights reserved.
//

import Foundation


struct LancamentoResponse: Codable {
    let lancamento: [Lancamento]
    
    enum CodingKeys: String, CodingKey {
        case lancamento = "statementList"
    }
}

struct Lancamento: Codable {
    let titulo: String
    let descricao: String
    let date: String
    let valor: Double
    
    enum CodingKeys: String, CodingKey {
        case titulo = "title"
        case descricao = "desc"
        case date
        case valor = "value"
    }
}



