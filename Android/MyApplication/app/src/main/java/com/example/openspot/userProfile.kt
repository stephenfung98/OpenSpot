package com.example.openspot

import android.content.Intent
import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.text.TextUtils
import android.view.View
import android.widget.Button
import android.widget.EditText
import android.widget.ImageButton
import android.widget.Toast
import com.google.firebase.auth.FirebaseAuth
import com.google.firebase.database.DatabaseReference
import com.google.firebase.database.FirebaseDatabase
import java.util.*
import java.util.regex.Pattern
import android.app.DatePickerDialog
import android.app.Dialog
import kotlinx.android.synthetic.main.activity_user_profile.*


class userProfile : AppCompatActivity() {

    //UI elements
    private var editFullName: EditText? = null
    private var editEmail: EditText? = null
    private var editDOB: EditText? = null
    private var nextButton: ImageButton? = null

    //Firebase references
    private var mDatabaseReference: DatabaseReference? = null
    private var mDatabase: FirebaseDatabase? = null
    private var mAuth: FirebaseAuth? = null

//    //global variables
//    private var fullName: String? = null
//    private var Email: String? = null
//    private var DOB: String? = null

    private var mYear: Int = 0
    private var mMonth: Int = 0
    private var mDay: Int = 0

    private var mPickDate: Button? = null

    //findViewById(R.id.showMyDate) as TextView
    //findViewById(R.id.myDatePickerButton) as Button
    var DATE_DIALOG_ID = 0


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setTheme(R.style.AppTheme)
        setContentView(R.layout.activity_user_profile)

        initialize()
    }

    private fun initialize() {
        editFullName = findViewById<View>(R.id.full_name) as EditText
        editEmail = findViewById<View>(R.id.email) as EditText
//        editDOB = findViewById<View>(R.id.dob) as EditText
        nextButton = findViewById<View>(R.id.user_profile_button) as ImageButton

        mDatabase = FirebaseDatabase.getInstance()
        mDatabaseReference = mDatabase!!.reference!!.child("Users")
        mAuth = FirebaseAuth.getInstance()


        mPickDate = findViewById(R.id.myDatePickerButton)

//      mPickDate.setOnClickListener(View.OnClickListener { showDialog(DATE_DIALOG_ID) })

        // get the current date
        val c = Calendar.getInstance()
        mYear = c.get(Calendar.YEAR)
        mMonth = c.get(Calendar.MONTH)
        mDay = c.get(Calendar.DAY_OF_MONTH)

    }

    private fun updateDisplay() {
        this.mPickDate?.setText(
            StringBuilder()
                // Month is 0 based so add 1
                .append(mMonth + 1).append("-")
                .append(mDay).append("-")
                .append(mYear).append(" ")
        )
    }

    private val mDateSetListener = DatePickerDialog.OnDateSetListener { view, year, monthOfYear, dayOfMonth ->
        mYear = year
        mMonth = monthOfYear
        mDay = dayOfMonth
        updateDisplay()
    }

    override fun onCreateDialog(id: Int): Dialog? {
        super.onCreateDialog(id)
        when (id) {
            DATE_DIALOG_ID -> return DatePickerDialog(
                this,
                mDateSetListener,
                mYear, mMonth, mDay
            )
        }
        return null
    }

    private fun isValidName(name: String): Boolean {
        //checks to see if name doesnt have any special chars or numbers, if so, returns true

//method1
//        val inputStr = name
//        val pattern = Pattern.compile("/^[a-z ,.'-]+\$/i")
//        val matcher = pattern.matcher(inputStr)
//        return (matcher.matches())
//method2
//        val fullNameRegex = "/^[a-z ,.'-]+\$/i"
//        return fullNameRegex.toRegex().matches(name)
//brute method3
        val blockedChars = listOf('0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '?', '.', ',', '/', '~', '`', '+', '-', '=', '*', '&', '^', '%', '$', '#', '@', '!', '(', ')', '|', '{', '}', '[', ']', ':', ';', '<', '>')
        for (char in blockedChars){
            if (name.contains(char)){
                return false
            }
        }
        return true
    }

    private fun isValidEmail(email: String): Boolean {
        return !TextUtils.isEmpty(email) && android.util.Patterns.EMAIL_ADDRESS.matcher(email).matches()
    }


    private fun validForm(): Boolean {
        val fullName = editFullName!!.text.toString()
        val email = editEmail!!.text.toString()
        val dob = editDOB?.text.toString()

        //if they are empty
        if (TextUtils.isEmpty(fullName) || TextUtils.isEmpty(email) || TextUtils.isEmpty(dob)) {
            Toast.makeText(applicationContext, "Please fill out all information", Toast.LENGTH_LONG)
                .show()
            return false
        } else {
            //if fields are not empty
            if (!isValidName(fullName)) {
                Toast.makeText(applicationContext, "Please enter valid name", Toast.LENGTH_LONG)
                    .show()
                return false
            } else if(!isValidEmail(email)) {
                Toast.makeText(applicationContext, "Please enter valid Email", Toast.LENGTH_LONG)
                    .show()
                return false
            } else {
                return true
            }
        }
    }


     fun datePicker(v: View){
        showDialog(DATE_DIALOG_ID)
    }

    fun nextButton(v:View) {
        if (validForm()) {
            val i = Intent(this@userProfile, VehicleInfoActivity::class.java)
            i.putExtra("full_name", editFullName!!.text.toString())
            i.putExtra("email", editEmail!!.text.toString())
//            i.putExtra("DOB", editDOB!!.text.toString())

            //this code is for the next vehicle info activity to use these inputs
//            val extras = intent.extras
//            if (extras != null) {
//                val value = extras.getString("full_name")
//                val value = extras.getString("email")
//                val value = extras.getString("DOB")
//                //The key argument here must match that used in the other activity
//            }

            startActivity(i)
            finish()
        }
    }


}

