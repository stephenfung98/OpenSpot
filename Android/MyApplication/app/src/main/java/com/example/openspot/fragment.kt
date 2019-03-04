package com.example.openspot

import android.content.Intent
import android.location.Location
import android.os.Bundle
import android.support.v4.app.Fragment
import android.support.v7.preference.PreferenceFragmentCompat
import android.support.v7.widget.RecyclerView
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import com.google.android.gms.location.FusedLocationProviderClient
import com.google.android.gms.maps.CameraUpdateFactory
import com.google.android.gms.maps.GoogleMap
import com.google.android.gms.maps.MapView
import com.google.android.gms.maps.OnMapReadyCallback
import com.google.android.gms.maps.model.LatLng
import com.google.android.gms.maps.model.MarkerOptions
import android.preference.Preference.OnPreferenceClickListener
import android.support.v7.preference.Preference
import com.firebase.ui.auth.AuthUI
import kotlinx.android.synthetic.main.fragment_home.*

class ReservationFragment : Fragment() {

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        return   inflater.inflate(R.layout.reservation, container, false)
    }

    companion object {
        fun newInstance(): ReservationFragment = ReservationFragment()
    }
}

class HomeFragment : Fragment(), OnMapReadyCallback {
    companion object {
        fun newInstance(): HomeFragment = HomeFragment()
        private const val MY_LOCATION_REQUEST_CODE = 1
    }

    private lateinit var mMap: GoogleMap
    private var gMapView: MapView? = null
    private lateinit var fusedLocationClient: FusedLocationProviderClient
    private lateinit var lastLocation: Location

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        return inflater.inflate(R.layout.fragment_home, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        gMapView =  view.findViewById(R.id.mapView) as MapView
        mapView.onCreate(savedInstanceState)
        mapView.onResume()
        mapView.getMapAsync(this)
    }


    override fun onMapReady(googleMap: GoogleMap) {
        mMap = googleMap

        // Add a marker in Sydney and move the camera
        val sydney = LatLng(-34.0, 151.0)
        mMap.addMarker(MarkerOptions().position(sydney).title("Marker in Sydney"))
        mMap.moveCamera(CameraUpdateFactory.newLatLng(sydney))
    }

}

class SettingFragment : PreferenceFragmentCompat() {
//    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View{
//        return inflater.inflate(R.layout.settings, container, false)
//    }

    override fun onCreatePreferences(savedInstanceState: Bundle?, root_key: String?) {
        setPreferencesFromResource(R.xml.preferences, root_key)
//        val button = findPreference("logout")
//        button.onPreferenceClickListener = Preference.OnPreferenceClickListener {
//            AuthUI.getInstance()
//                .signOut(this)
//                .addOnCompleteListener {
//                    startActivity(Intent(this@NavigationActivity, MainActivity::class.java))
//                    finish()
//                }
//            true
//        }
    }

    companion object {
        fun newInstance(): SettingFragment = SettingFragment()
    }
}
