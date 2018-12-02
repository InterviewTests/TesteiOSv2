package br.com.caiodev.testeiosv2.login.view

import android.content.Intent
import android.os.Bundle
import android.widget.EditText
import android.widget.Toast
import androidx.lifecycle.Observer
import androidx.lifecycle.ViewModelProviders
import br.com.caiodev.testeiosv2.R
import br.com.caiodev.testeiosv2.login.model.LoginRequest
import br.com.caiodev.testeiosv2.login.viewModel.LoginViewModel
import br.com.caiodev.testeiosv2.statements.view.UserAccountDetailActivity
import br.com.caiodev.testeiosv2.utils.MasterActivity
import br.com.caiodev.testeiosv2.utils.TextValidation.validateCPF
import br.com.caiodev.testeiosv2.utils.TextValidation.validateEmail
import br.com.caiodev.testeiosv2.utils.TextValidation.validatePassword
import kotlinx.android.synthetic.main.activity_main.*

class LoginActivity : MasterActivity() {

    private lateinit var viewModel: LoginViewModel

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        setupView()
        setupViewModel()
        bindViewToViewModel()
    }

    override fun setupView() {

        loginButton.setOnClickListener {
            loginValidation()
        }
    }

    override fun setupViewModel() {
        viewModel = ViewModelProviders.of(this).get(LoginViewModel::class.java)
    }

    override fun bindViewToViewModel() {

        viewModel.state.observe(this, Observer { state ->

            when (state) {

                0 -> {
                    toastMaker(
                        "BOOOOOOORAAAAAAA ${viewModel.getUserLoginResponse().userAccount?.name}",
                        Toast.LENGTH_LONG
                    )

                    startActivity(Intent(applicationContext, UserAccountDetailActivity::class.java))
                }

                1 -> {
                    toastMaker("DEU RUIM", Toast.LENGTH_LONG)
                }
            }
        })
    }

    private fun loginValidation() {

        if (userLoginEditText.text.toString().isNotEmpty()) {

            if (validateEmail(userLoginEditText.text.toString()) ||
                validateCPF(userLoginEditText.text.toString())
            ) {

                if (userPasswordEditText.text.toString().isNotEmpty()) {

                    when {

                        validatePassword(userPasswordEditText.text.toString()) -> {
                            //Make call
                            viewModel.login(
                                LoginRequest(
                                    userLoginEditText.text.toString(),
                                    userPasswordEditText.text.toString()
                                )
                            )
                        }

                        userPasswordEditText.text.toString().length < 6 -> {
                            setEditTextError(
                                userPasswordEditText,
                                getString(R.string.password_length_error)
                            )
                        }

                        else -> {
                            setEditTextError(
                                userPasswordEditText,
                                getString(R.string.password_regex_error)
                            )
                        }
                    }

                } else setEditTextError(userPasswordEditText, getString(R.string.empty_field_error))

            } else setEditTextError(
                userLoginEditText,
                getString(R.string.invalid_email_or_cpf_error)
            )

        } else setEditTextError(userLoginEditText, getString(R.string.empty_field_error))
    }

    private fun setEditTextError(editText: EditText, errorMessage: String) {
        editText.error = errorMessage
    }

    private fun toastMaker(message: String, length: Int) {
        Toast.makeText(applicationContext, message, length).show()
    }
}