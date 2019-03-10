package com.example.openspot

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.widget.ArrayAdapter
import android.widget.Spinner

class VehicleInfoActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_vehicle_info)


        val list = arrayListOf("Mercury","Jupiter","Venus","Earth","Saturn","Car Make")
        val listSize = list.size -1

        val spinner: Spinner = findViewById(R.id.spinner)

        val dataAdapter = object : ArrayAdapter<String>(this, android.R.layout.simple_spinner_dropdown_item, list) {
            override fun getCount(): Int {
                return listSize // Truncate the list
            }
        }
        dataAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item)
        spinner.adapter = dataAdapter
        spinner.setSelection(listSize)
    }
}
