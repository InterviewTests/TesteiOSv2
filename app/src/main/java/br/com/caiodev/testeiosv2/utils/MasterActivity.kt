package br.com.caiodev.testeiosv2.utils

import androidx.appcompat.app.AppCompatActivity

abstract class MasterActivity : AppCompatActivity() {

    protected abstract fun setupView()
    protected abstract fun setupViewModel()
    protected abstract fun bindViewToViewModel()
}