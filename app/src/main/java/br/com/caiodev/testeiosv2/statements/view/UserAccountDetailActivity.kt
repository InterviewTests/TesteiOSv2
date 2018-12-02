package br.com.caiodev.testeiosv2.statements.view

import android.os.Bundle
import androidx.lifecycle.Observer
import androidx.lifecycle.ViewModelProviders
import br.com.caiodev.testeiosv2.R
import br.com.caiodev.testeiosv2.statements.viewModel.StatementViewModel
import br.com.caiodev.testeiosv2.statements.viewModel.ViewModelDataHelper
import br.com.caiodev.testeiosv2.utils.MasterActivity
import kotlinx.android.synthetic.main.activity_user_account_detail.*

class UserAccountDetailActivity : MasterActivity() {

    private lateinit var viewModel: StatementViewModel
    private val viewModelDataHelper = ViewModelDataHelper()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_user_account_detail)

        setupView()
        setupViewModel()
        bindViewToViewModel()
    }

    override fun setupView() {
        accountOwnerStatementsRecyclerView.setHasFixedSize(true)
    }

    override fun setupViewModel() {
        viewModel = ViewModelProviders.of(this).get(StatementViewModel::class.java)
        viewModel.getStatement()
    }

    override fun bindViewToViewModel() {

        viewModel.state.observe(this, Observer { state ->

            when (state) {

                0 -> {
                    viewModelDataHelper.listReceiver(viewModel.getStatementList())
                    accountOwnerStatementsRecyclerView.adapter =
                            StatementAdapter(viewModelDataHelper)
                    accountOwnerStatementsRecyclerView.adapter?.notifyDataSetChanged()
                }

                1 -> {

                }
            }

        })
    }
}