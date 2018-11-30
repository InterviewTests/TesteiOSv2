package br.com.caiodev.testeiosv2.view

import android.os.Bundle
import android.widget.EditText
import android.widget.Toast
import androidx.lifecycle.ViewModelProviders
import br.com.caiodev.testeiosv2.R
import br.com.caiodev.testeiosv2.utils.MasterActivity
import br.com.caiodev.testeiosv2.utils.TextValidation.validateCPF
import br.com.caiodev.testeiosv2.utils.TextValidation.validateEmail
import br.com.caiodev.testeiosv2.utils.TextValidation.validatePassword
import br.com.caiodev.testeiosv2.viewModel.BankViewModel
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : MasterActivity() {

    private lateinit var viewModel: BankViewModel

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        setupView()
        setupViewModel()
        bindViewToViewModel()

        loginButton.setOnClickListener {
            loginValidation()
        }
    }

    override fun setupView() {

    }

    override fun setupViewModel() {

        viewModel = ViewModelProviders.of(this).get(BankViewModel::class.java)
    }

    override fun bindViewToViewModel() {

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
                            Toast.makeText(applicationContext, "TCHERTO", Toast.LENGTH_LONG).show()
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

            } else userLoginEditText.error = "Email ou CPF inválidos"

        } else setEditTextError(userLoginEditText, getString(R.string.empty_field_error))
    }

    private fun setEditTextError(editText: EditText, errorMessage: String) {
        editText.error = errorMessage
    }
}