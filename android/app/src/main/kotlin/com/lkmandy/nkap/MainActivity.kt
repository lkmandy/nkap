package com.lkmandy.nkap

import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {
    override fun attachBaseContext(base: Context) {
        super.attachBaseContext(base)
        MultiDex.install(this)
    }
}
