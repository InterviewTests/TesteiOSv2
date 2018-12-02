package br.com.caiodev.testeiosv2.service

import br.com.caiodev.testeiosv2.login.model.LoginRequest
import br.com.caiodev.testeiosv2.login.model.LoginResponse
import br.com.caiodev.testeiosv2.statements.model.UserStatement
import kotlinx.coroutines.Deferred
import retrofit2.http.Body
import retrofit2.http.GET
import retrofit2.http.POST

interface BankService {

    @POST("login")
    fun login(@Body request: LoginRequest): Deferred<LoginResponse>

    @GET("statements/1")
    fun getUserDetails(): Deferred<UserStatement>
}