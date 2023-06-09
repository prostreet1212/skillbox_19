package com.example.homework1

import android.content.Context
import android.graphics.Color
import android.view.View
import android.widget.TextView
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.platform.PlatformView


class AndroidTextView internal constructor(context: Context?, messenger: BinaryMessenger, id: Int) :
    PlatformView, MethodChannel.MethodCallHandler {

    private val textView: TextView
    private val methodChannel: MethodChannel

    init {
        textView = TextView(context)
        textView.text = "Android TextView"
        textView.setBackgroundColor(Color.LTGRAY)
        methodChannel = MethodChannel(messenger, "CALL_METHOD")
        methodChannel.setMethodCallHandler(this)
    }

    @Override
    override fun getView(): View {
        return textView
    }

    @Override
    override fun onMethodCall(methodCall: MethodCall, result: MethodChannel.Result) {
        when (methodCall.method) {
            "setText" -> setText(methodCall, result)
            else -> result.notImplemented()
        }
    }

    private fun setText(methodCall: MethodCall, result: MethodChannel.Result) {
        val text = methodCall.arguments as String
        textView.setText(text)
        result.success(null)
    }

    @Override
    override fun dispose() {
    }
}
