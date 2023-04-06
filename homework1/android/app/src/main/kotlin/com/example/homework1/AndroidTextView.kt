package com.example.homework1

import android.content.Context
import android.graphics.Color
import android.view.View
import android.widget.TextView
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.platform.PlatformView



class AndroidTextView internal constructor(context: Context?, messenger: BinaryMessenger, id: Int)
    : PlatformView, MethodChannel.MethodCallHandler {

    private val textView: TextView
    private val methodChannel: MethodChannel

    init {
        textView = TextView(context)
        textView.text="aaa"
        methodChannel = MethodChannel(messenger, "plugins.kurun.views/textview_1")
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


//internal  class AndroidTextView(
//    context: Context,
//    id: Int,
//    messenger: BinaryMessenger,
//    //creationParams: Map<String?, Any?>?,
//
//) : PlatformView, MethodChannel.MethodCallHandler {
//    private val textView: TextView
//    private val methodChannel: MethodChannel
//
//    override fun getView(): View {
//        return textView
//    }
//
//    override fun dispose() {}
//
//    init {
//        methodChannel = MethodChannel(messenger, "plugins.kurun.views/textview_$id")
//        methodChannel.setMethodCallHandler(this)
//        textView = TextView(context)
//        textView.textSize = 22f
//        textView.setBackgroundColor(Color.rgb(255, 255, 255))
//        textView.text = "Rendered on a native Android view (id: )"
//    }
//
//    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
//        val text = call.arguments as String
//        textView.setText(text)
//        result.success(null)
//    }
//}