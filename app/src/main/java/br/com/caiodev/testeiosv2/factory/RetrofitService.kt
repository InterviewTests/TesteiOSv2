package br.com.caiodev.testeiosv2.factory

import com.jakewharton.retrofit2.adapter.kotlin.coroutines.CoroutineCallAdapterFactory
import okhttp3.OkHttpClient
import okhttp3.logging.HttpLoggingInterceptor
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import timber.log.Timber
import java.util.concurrent.TimeUnit


class RetrofitService {

    val baseUrl = "https://bank-app-test.herokuapp.com/api/"

    inline fun <reified T> createService(): T {

        return Retrofit.Builder()
            .baseUrl(baseUrl)
            .client(createAndDeliverHttpClient())
            .addConverterFactory(GsonConverterFactory.create())
            .addCallAdapterFactory(CoroutineCallAdapterFactory())
            .build().create(T::class.java)
    }

    fun createAndDeliverHttpClient(): OkHttpClient {

        val okHttpClientCreator = OkHttpClient.Builder()

        val logging = HttpLoggingInterceptor(HttpLoggingInterceptor.Logger { message ->
            Timber.tag("OkHttpLogging").d(message)
        }).setLevel(HttpLoggingInterceptor.Level.BODY)

        okHttpClientCreator.addInterceptor(logging)
        okHttpClientCreator.connectTimeout(1L, TimeUnit.MINUTES)
        okHttpClientCreator.readTimeout(1L, TimeUnit.MINUTES)
        okHttpClientCreator.writeTimeout(1L, TimeUnit.MINUTES)

        okHttpClientCreator.hostnameVerifier { _, _ -> true }

        return okHttpClientCreator.build()
    }
}