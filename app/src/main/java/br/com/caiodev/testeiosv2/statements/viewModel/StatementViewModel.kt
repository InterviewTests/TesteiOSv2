package br.com.caiodev.testeiosv2.statements.viewModel

import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import br.com.caiodev.testeiosv2.factory.RetrofitService
import br.com.caiodev.testeiosv2.service.BankService
import br.com.caiodev.testeiosv2.statements.model.Statement
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.launch
import timber.log.Timber

class StatementViewModel : ViewModel() {

    private var statementList = mutableListOf<Statement>()
    private val service: BankService = RetrofitService().createService()
    val state = MutableLiveData<Int>()

    fun getStatement() {

        GlobalScope.launch(Dispatchers.Default) {

            val request = service.getUserDetails()
            val response = request.await()

            when {

                request.isCompleted -> {
                    statementList = response.statementList
                    state.postValue(onStatementRetrievalSuccess)
                    Timber.i("Transaction date: %s", statementList.first().date)
                }

                request.isCompletedExceptionally -> {

                    state.postValue(onStatementRetrievalError)

                    Timber.i(
                        "APIError: %s",
                        request.getCompletionExceptionOrNull().toString()
                    )
                }
            }
        }
    }

    fun getStatementList(): MutableList<Statement> {
        return statementList
    }

    companion object {
        const val onStatementRetrievalSuccess = 0
        const val onStatementRetrievalError = 1
    }
}