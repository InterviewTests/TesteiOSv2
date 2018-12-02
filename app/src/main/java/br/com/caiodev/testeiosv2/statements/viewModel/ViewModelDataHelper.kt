package br.com.caiodev.testeiosv2.statements.viewModel

import br.com.caiodev.testeiosv2.statements.model.Statement
import br.com.caiodev.testeiosv2.statements.view.RecyclerViewDataSource

class ViewModelDataHelper : RecyclerViewDataSource<Statement> {

    private var statementList = mutableListOf<Statement>()

    fun listReceiver(list: MutableList<Statement>) {
        statementList.clear()
        statementList = list
    }

    override fun getTotalCount(): Int {
        return statementList.size
    }

    override fun getViewType(position: Int): Int {
        return 0
    }

    override fun getItem(position: Int): Statement {
        return statementList[position]
    }
}