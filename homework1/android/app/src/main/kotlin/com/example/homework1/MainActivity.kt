package com.example.homework1

import android.os.Bundle
import android.os.PersistableBundle
import android.view.ContextMenu
import android.view.View
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.PluginRegistry
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {






    private val intentMessageId = "CALL"
    private val methodChannel = "CALL_METHOD"
    private var text1:String = "123"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        /*flutterEngine
            .platformViewsController
            .registry
            .registerViewFactory("ANDROID_TEXTVIEW", AndroidTextViewFactory())*/

       /* GeneratedPluginRegistrant.registerWith(flutterEngine)
        flutterEngine.plugins.add(AndroidTextViewPlugin())*/
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        flutterEngine.plugins.add(AndroidTextViewPlugin())



        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            methodChannel
        ).setMethodCallHandler { call, result ->
            if (call.method == intentMessageId) {
                val newText = call.argument<String>("text")
                text1 = "$newText for android"
                result.success(text1)
            } else {
                result.notImplemented()
            }
        }
    }
}
