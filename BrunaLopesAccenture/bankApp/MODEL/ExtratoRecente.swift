//
//  ExtratoRecente.swift
//  bankApp
//
//  Created by bruna.lopes.d.santos on 12/07/19.
//  Copyright © 2019 bruna.lopes.d.santos. All rights reserved.
//

import Foundation

struct ExtratoRec: Codable {
    let informacoes: Extrato
    
    enum CodingKeys: String, CodingKey {
        case informacoes = "statementList"
    }
}

struct Extrato: Codable {
    let titulo: String!
    let descricao: String!
    let data: String!
    let valor: Double!
    
    enum CodingKeys: String, CodingKey {
        case titulo = "title"
        case descricao = "desc"
        case data = "date"
        case valor = "value"
    }
}
