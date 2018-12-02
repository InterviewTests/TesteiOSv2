package br.com.caiodev.testeiosv2.statements.model

import br.com.caiodev.testeiosv2.login.model.Error

class UserStatement {

    val error: Error? = null
    val statementList = mutableListOf<Statement>()
}