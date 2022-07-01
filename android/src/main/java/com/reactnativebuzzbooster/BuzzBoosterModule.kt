package com.reactnativebuzzbooster
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.bridge.Promise
import com.buzzvil.booster.external.BuzzBooster
import com.buzzvil.booster.external.BuzzBoosterConfig
import android.app.Activity
import android.content.Context

class BuzzBoosterModule(
    private val reactContext: ReactApplicationContext
) : ReactContextBaseJavaModule(reactContext) {
    
    override fun getName(): String {
        return "BuzzBooster"
    }

    @ReactMethod
    fun initAndroidApp(appKey: String) {
        val config = BuzzBoosterConfig(appKey)
        BuzzBooster.init(reactContext, config)
    }

    @ReactMethod
    fun setUserId(userId: String?) {
        BuzzBooster.setUserId(userId)
    }

    @ReactMethod
    fun sendEvent(eventName: String) {
        BuzzBooster.getInstance().sendEvent(eventName)
    }

    @ReactMethod
    fun sendEvent(eventName: String, eventValues: Map<String, String>) {
        BuzzBooster.getInstance().sendEvent(eventName, eventValues)
    }

    @ReactMethod
    fun showInAppMessage() {
        val activity = currentActivity 
        if (activity != null) {
            BuzzBooster.getInstance().showInAppMessage(currentActivity!!)
        }
    }
}
