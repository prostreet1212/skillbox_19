package com.example.homework1

import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin



class AndroidTextViewPlugin : FlutterPlugin {

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        flutterPluginBinding.platformViewRegistry
            .registerViewFactory(
                "ANDROID_TEXTVIEW",
                AndroidTextViewFactory(flutterPluginBinding.binaryMessenger)
            )
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    }
}



