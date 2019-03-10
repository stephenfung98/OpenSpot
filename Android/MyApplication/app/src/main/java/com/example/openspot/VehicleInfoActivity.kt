package com.example.openspot

import android.content.Intent
import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.widget.ArrayAdapter
import android.widget.Spinner

class VehicleInfoActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setTheme(R.style.AppTheme)
        setContentView(R.layout.activity_vehicle_info)

        val list = arrayListOf("Ford","Honda","Nissan","Toyota","Volkswagen","Car Make")
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

        val list3 = arrayListOf("Black","Blue","Green","Red","White","Color")
        val listSize3 = list.size -1

        val spinner3: Spinner = findViewById(R.id.spinner3)

        val dataAdapter3 = object : ArrayAdapter<String>(this, android.R.layout.simple_spinner_dropdown_item, list3) {
            override fun getCount(): Int {
                return listSize3 // Truncate the list
            }
        }
        dataAdapter3.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item)
        spinner3.adapter = dataAdapter3
        spinner3.setSelection(listSize)


        val list4 = arrayListOf("2019","2018","2017","2016","2015","Year")
        val listSize4 = list.size -1


        val spinner4: Spinner = findViewById(R.id.spinner4)

        val dataAdapter4 = object : ArrayAdapter<String>(this, android.R.layout.simple_spinner_dropdown_item, list4) {
            override fun getCount(): Int {
                return listSize4 // Truncate the list
            }
        }
        dataAdapter4.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item)
        spinner4.adapter = dataAdapter4
        spinner4.setSelection(listSize)
    }
}
