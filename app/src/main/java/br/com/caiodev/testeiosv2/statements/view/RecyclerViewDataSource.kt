package br.com.caiodev.testeiosv2.statements.view

interface RecyclerViewDataSource<out T> {

    fun getTotalCount(): Int
    fun getViewType(position: Int): Int
    fun getItem(position: Int): T
}