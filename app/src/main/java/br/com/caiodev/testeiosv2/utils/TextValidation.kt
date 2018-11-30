package br.com.caiodev.testeiosv2.utils

import java.util.regex.Pattern


object TextValidation {

    fun validateEmail(email: String): Boolean {
        return Pattern.compile(
            "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$",
            Pattern.CASE_INSENSITIVE
        )
            .matcher(email).find()
    }

    fun validateCPF(cpf: String): Boolean {
        val cpfClean = cpf.replace(".", "").replace("-", "")

        //## check if size is eleven
        if (cpfClean.length != 11) return false

        //continue
        val dvCurrent10 = cpfClean.substring(9, 10).toInt()
        val dvCurrent11 = cpfClean.substring(10, 11).toInt()

        //the sum of the nine first digits determines the tenth digit
        val cpfNineFirst = IntArray(9)
        var i = 9

        while (i > 0) {
            cpfNineFirst[i - 1] = cpfClean.substring(i - 1, i).toInt()
            i--
        }

        //multiple the nine digits for your weights: 10,9..2
        val sumProductNine = IntArray(9)
        var weight = 10
        var position = 0

        while (weight >= 2) {
            sumProductNine[position] = weight * cpfNineFirst[position]
            weight--
            position++
        }

        //Verify the nineth digit
        var dvForTenthDigit = sumProductNine.sum() % 11

        dvForTenthDigit = 11 - dvForTenthDigit //rule for tenth digit

        if (dvForTenthDigit > 9)
            dvForTenthDigit = 0

        if (dvForTenthDigit != dvCurrent10)
            return false

        //### verify tenth digit
        val cpfTenFirst = cpfNineFirst.copyOf(10)
        cpfTenFirst[9] = dvCurrent10

        //multiple the nine digits for your weights: 10,9..2
        val sumProductTen = IntArray(10)
        var w = 11
        var p = 0

        while (w >= 2) {
            sumProductTen[p] = w * cpfTenFirst[p]
            w--
            p++
        }

        //Verify the ninth digit
        var dvForeleventhDigit = sumProductTen.sum() % 11
        dvForeleventhDigit = 11 - dvForeleventhDigit //rule for tenth digit

        if (dvForeleventhDigit > 9) dvForeleventhDigit = 0

        if (dvForeleventhDigit != dvCurrent11)
            return false

        return true
    }

    fun validatePassword(password: String): Boolean {
        return Pattern.compile("((?=.*[a-z])(?=.*\\d)(?=.*[A-Z])(?=.*[@#$%!]).{6,24})")
            .matcher(password).matches()
    }
}