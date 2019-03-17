package com.example.openspot

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.view.View
import com.google.firebase.firestore.FirebaseFirestore
import android.content.Intent
import android.widget.*
import android.widget.EditText
import kotlinx.android.synthetic.main.activity_vehicle_info.*


class VehicleInfoActivity : AppCompatActivity(){

    companion object {
        const val TAG = "VehicleInfoActivity"
    }
    private val db = FirebaseFirestore.getInstance()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setTheme(R.style.AppTheme)
        setContentView(R.layout.activity_vehicle_info)

        //*****************Car Make Spinner********************//
        val carMake = arrayListOf("Ford","Honda","Nissan","Toyota","Volkswagen","Car Make")
        val carMakeSize = carMake.size -1
        val spinner: Spinner = findViewById(R.id.spinner)
        val dataAdapter = object : ArrayAdapter<String>(this, android.R.layout.simple_spinner_dropdown_item, carMake) {
            override fun getCount(): Int {
                return carMakeSize // Truncate the list
            }
        }
        dataAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item)
        spinner.adapter = dataAdapter
        spinner.setSelection(carMakeSize)


        //*****************Car Model Spinner********************//
        val carModel = arrayListOf("Mercury","Jupiter","Venus","Earth","Saturn","Car Model")
        val carModelSize = carModel.size -1
        val spinner2: Spinner = findViewById(R.id.spinner2)
        val dataAdapter2 = object : ArrayAdapter<String>(this, android.R.layout.simple_spinner_dropdown_item, carModel) {
            override fun getCount(): Int {
                return carModelSize // Truncate the list
            }
        }
        dataAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item)
        spinner2.adapter = dataAdapter2
        spinner2.setSelection(carModelSize)


        //*****************Car Color Spinner********************//
        val carColor = arrayListOf("Aluminum", "Beige", "Black", "Blue",
            "Brown", "Bronze", "Claret", "Copper", "Cream", "Gold", "Gray", "Green",
            "Maroon", "Metallic", "Navy", "Orange", "Pink", "Purple", "Red", "Rose",
            "Rust", "Silver", "Tan", "Turquoise", "White", "Yellow","Color")
        val carColorSize = carColor.size -1
        val spinner3: Spinner = findViewById(R.id.spinner3)
        val dataAdapter3 = object : ArrayAdapter<String>(this, android.R.layout.simple_spinner_dropdown_item, carColor) {
            override fun getCount(): Int {
                return carColorSize // Truncate the list
            }
        }
        dataAdapter3.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item)
        spinner3.adapter = dataAdapter3
        spinner3.setSelection(carColorSize)
    }

     private fun saveVehicleInfo(view :View){
        val editText = findViewById<EditText>(R.id.edit_license)
        val value = editText.text.toString()

        val user = HashMap<String, Any>()
        user["CarMake"] = spinner.selectedItem.toString()
        user["CarModel"] = spinner2.selectedItem.toString()
        user["CarColor"] = spinner3.selectedItem.toString()
        user["LicensePlate"] = value

    // Add a new document with a generated ID
        db.collection("Users")
            .add(user)
            .addOnSuccessListener { documentReference ->
                Log.d(TAG, "DocumentSnapshot added with ID: ${documentReference.id}")
            }
            .addOnFailureListener { e ->
                Log.w(TAG, "Error adding document", e)
            }
    }

    fun clickButton(v : View){
        saveVehicleInfo(v)
        val i = Intent(this@VehicleInfoActivity, NavigationActivity::class.java)
        startActivity(i)
    }
}
