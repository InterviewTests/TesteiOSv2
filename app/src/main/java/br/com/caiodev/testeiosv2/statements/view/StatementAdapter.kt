package br.com.caiodev.testeiosv2.statements.view

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import br.com.caiodev.testeiosv2.R
import br.com.caiodev.testeiosv2.statements.model.Statement

class StatementAdapter(private val data: RecyclerViewDataSource<Statement>) :
    RecyclerView.Adapter<RecyclerView.ViewHolder>() {

    override fun getItemViewType(position: Int): Int {
        return data.getViewType(position)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): RecyclerView.ViewHolder {
        return StatementViewHolder(
            LayoutInflater.from(parent.context).inflate(
                R.layout.recycler_view_item_layout,
                parent,
                false
            )
        )
    }

    override fun getItemCount(): Int {
        return data.getTotalCount()
    }

    override fun onBindViewHolder(viewHolder: RecyclerView.ViewHolder, position: Int) {

        when (viewHolder) {
            is StatementViewHolder -> viewHolder.bind(data.getItem(position))
        }
    }
}