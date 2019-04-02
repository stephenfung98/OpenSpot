package com.example.openspot

import android.content.Intent
import android.content.pm.ActivityInfo
import android.net.Uri
import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.text.TextUtils
import android.util.Log
import android.view.View
import android.widget.Button
import android.widget.EditText
import com.google.firebase.auth.FirebaseAuth
import kotlinx.android.synthetic.main.activity_contact.*

class ContactActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        val user = FirebaseAuth.getInstance().currentUser
        requestedOrientation = ActivityInfo.SCREEN_ORIENTATION_PORTRAIT
        super.onCreate(savedInstanceState)
        setTheme(R.style.FragmentTheme)
        setContentView(R.layout.activity_contact)

        supportActionBar?.title = "Contact"
        supportActionBar?.setDisplayHomeAsUpEnabled(true)

//        val mStartActBtn = findViewById<Button>(R.id.startActBtn)
//        //handle button click
//        mStartActBtn.setOnClickListener {
//            //start activity intent
//            startActivity(Intent(this@ContactActivity, NavigationActivity::class.java))
//        }

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

            val sendEmail = Intent(android.content.Intent.ACTION_SENDTO)

            sendEmail.type = "plain/text"
            sendEmail.putExtra(android.content.Intent.EXTRA_EMAIL, yourEmail)
            sendEmail.putExtra(android.content.Intent.EXTRA_SUBJECT, subject)
            sendEmail.putExtra(android.content.Intent.EXTRA_TEXT, message)
            sendEmail.data = Uri.parse("mailto:csecse442@gmail.com");

            startActivity(Intent.createChooser(sendEmail, "Send mail..."))
        }

    }
}
