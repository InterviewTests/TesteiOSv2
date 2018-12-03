package br.com.caiodev.testeiosv2.login.viewModel

import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import br.com.caiodev.testeiosv2.factory.RetrofitService
import br.com.caiodev.testeiosv2.login.model.LoginRequest
import br.com.caiodev.testeiosv2.login.model.LoginResponse
import br.com.caiodev.testeiosv2.service.BankService
import br.com.caiodev.testeiosv2.utils.HawkIds
import com.orhanobut.hawk.Hawk
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.launch
import timber.log.Timber

class LoginViewModel : ViewModel() {

    private val service: BankService = RetrofitService().createService()
    private var userResponse = LoginResponse()
    val state = MutableLiveData<Int>()

    fun login(loginRequest: LoginRequest) {

        GlobalScope.launch(Dispatchers.Default) {

            val request = service.login(loginRequest)
            val response = request.await()

            when {

                request.isCompletedExceptionally -> {

                    state.postValue(onLoginError)

                    Timber.i(
                        "APIError: %s",
                        request.getCompletionExceptionOrNull().toString()
                    )
                }

                request.isCompleted -> {
                    userResponse = response
                    Hawk.put(HawkIds.userLoginResponseData, userResponse)
                    state.postValue(onLoginSuccess)
                    Timber.i("Account owner: %s", userResponse.userAccount?.name)
                }
            }
        }
    }

    companion object {
        const val onLoginSuccess = 0
        const val onLoginError = 1
    }
}