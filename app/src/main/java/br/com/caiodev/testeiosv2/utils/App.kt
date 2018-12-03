package br.com.caiodev.testeiosv2.utils

import android.app.Application
import br.com.caiodev.testeiosv2.BuildConfig
import com.orhanobut.hawk.Hawk
import timber.log.Timber

class App : Application() {

    override fun onCreate() {
        super.onCreate()

        Hawk.init(this).build()

        if (BuildConfig.DEBUG) {
            Timber.plant(Timber.DebugTree())
        }
    }
}