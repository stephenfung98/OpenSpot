package com.example.openspot

import android.content.Intent
import android.os.Bundle
import android.support.design.widget.BottomNavigationView
import android.support.design.widget.FloatingActionButton
import android.support.v4.app.Fragment
import android.support.v7.app.AppCompatActivity
import android.support.v7.preference.Preference
import com.firebase.ui.auth.AuthUI
import com.google.firebase.auth.FirebaseAuth
import kotlinx.android.synthetic.main.activity_navigation.*

class NavigationActivity : AppCompatActivity() {

    private val mOnNavigationItemSelectedListener = BottomNavigationView.OnNavigationItemSelectedListener { item ->
        when (item.itemId) {
            R.id.navigation_home -> {
//                message.setText(R.string.title_home)
                val homeFragment = HomeFragment.newInstance()
                openFragment(homeFragment)
                return@OnNavigationItemSelectedListener true
            }
            R.id.navigation_reservations -> {
//                message.setText(R.string.title_reservations)
                val reservationFragment = ReservationFragment.newInstance()
                openFragment(reservationFragment)
                return@OnNavigationItemSelectedListener true
            }
            R.id.navigation_settings -> {
//                message.setText(R.string.title_settings)
                val notificationFragment = SettingFragment.newInstance()
                openFragment(notificationFragment)
                return@OnNavigationItemSelectedListener true
            }
        }
        false
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        val user = FirebaseAuth.getInstance().currentUser
        super.onCreate(savedInstanceState)
        setTheme(R.style.AppTheme)
        if (user == null) {
            val intent = Intent(this@NavigationActivity, MainActivity::class.java)
            startActivity(intent)
            finish()
        }
        setContentView(R.layout.activity_navigation)
        navigation.setOnNavigationItemSelectedListener(mOnNavigationItemSelectedListener)
        val homeFragment = HomeFragment.newInstance()
        openFragment(homeFragment)
    }
    private fun openFragment(fragment: Fragment) {
        val transaction = supportFragmentManager.beginTransaction()
        transaction.replace(R.id.container, fragment)
        transaction.addToBackStack(null)
        transaction.commit()
    }
}
