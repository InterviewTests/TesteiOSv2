package br.com.caiodev.testeiosv2.statements.view

import android.view.View
import androidx.core.content.ContextCompat
import androidx.recyclerview.widget.RecyclerView
import br.com.caiodev.testeiosv2.R
import br.com.caiodev.testeiosv2.statements.model.Statement
import kotlinx.android.synthetic.main.recycler_view_item_layout.view.*

class StatementViewHolder(itemView: View) :
    RecyclerView.ViewHolder(itemView) {

    fun bind(model: Statement) {
        itemView.transactionTypeHeaderTextView.text = model.title
        itemView.paymentTypeTextView.text = model.desc
        itemView.transactionDateTextView.text = model.date

        when {

            model.value < 0 -> {
                itemView.ownerAccountBalanceTextView.setTextColor(ContextCompat.getColor(itemView.context, R.color.red))
            }

            model.value > 0 -> {
                itemView.ownerAccountBalanceTextView.setTextColor(ContextCompat.getColor(itemView.context, R.color.green))
            }
        }

        itemView.ownerAccountBalanceTextView.text = model.value.toString()
    }
}