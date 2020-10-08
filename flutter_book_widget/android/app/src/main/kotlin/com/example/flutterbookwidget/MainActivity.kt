package com.example.flutterbookwidget

import io.flutter.embedding.android.FlutterActivity
import android.os.Bundle
import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {

    private val channel = "samples.flutter.io/battery"

    override fun onCreate(savedInstanceState:Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(this)
        MethodChannel(flutterView, channel).setMethodCallHandler {
            call, result ->

        }
    }


}
