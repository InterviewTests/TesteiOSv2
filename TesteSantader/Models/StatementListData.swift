//
//  StatementListData.swift
//  TesteSantader
//
//  Created by Bruno Chen on 08/05/20.
//  Copyright © 2020 Bruno Chen. All rights reserved.
//

import Foundation

// MARK: - User statement list

struct StatementListData: Codable, Equatable {
    let statementList: [StatementList]
    let error: ErrorAPI
    
}

// MARK: - Error
struct ErrorAPI: Codable, Equatable {
}

// MARK: - StatementList
struct StatementList: Codable, Equatable {
    let title: String
    let desc: String
    let date: String
    let value: Double
}

func ==(lhs: StatementListData, rhs: StatementListData) -> Bool
{
  return lhs.statementList == rhs.statementList
    && lhs.error == rhs.error
}

func ==(lhs: StatementList, rhs: StatementList) -> Bool
{
  return lhs.title == rhs.title
    && lhs.desc == rhs.desc
    && lhs.date == rhs.date
    && lhs.value == rhs.value
}
