package br.com.caiodev.testeiosv2.utils

import android.app.Application
import br.com.caiodev.testeiosv2.BuildConfig
import timber.log.Timber

class App : Application() {

    override fun onCreate() {
        super.onCreate()

        if (BuildConfig.DEBUG) {
            Timber.plant(Timber.DebugTree())
        }
    }
}