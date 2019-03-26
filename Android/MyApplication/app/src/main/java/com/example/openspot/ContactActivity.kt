package com.example.openspot

import android.content.Intent
import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.text.TextUtils
import android.view.View
import android.widget.Button
import android.widget.EditText
import com.google.firebase.auth.FirebaseAuth
import kotlinx.android.synthetic.main.activity_contact.*

class ContactActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        val user = FirebaseAuth.getInstance().currentUser
        super.onCreate(savedInstanceState)
        setTheme(R.style.AppTheme)
        setContentView(R.layout.activity_contact)

        val yourName = user!!.displayName
        val yourEmail = user!!.email
        your_name.text = yourName
        your_email.text = yourEmail
        val yourSubject = findViewById<EditText>(R.id.your_subject)
        val yourMessage = findViewById<EditText>(R.id.your_message)

        val button = findViewById<Button>(R.id.post_message)
        button.setOnClickListener{
            val subject = yourSubject.text.toString()
            val message = yourMessage.text.toString()

            if(TextUtils.isEmpty(subject)){
                your_subject.error = "Enter Your Subject"
                your_subject.requestFocus()
            }

            if(TextUtils.isEmpty(message)){
                your_message.error = "Enter Your Message"
                your_message.requestFocus()
            }

            startActivity(Intent(this@ContactActivity, NavigationActivity::class.java))


        }
    }
}
