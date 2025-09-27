# Native Alpha - Privacy Browser

## 📱 **Application Details**

### **Basic Information**
- **Package Name**: `native.alpha`
- **APK Path**: `SystemPrebuilts/nativeAlpha/NativeAlpha-extendedGithub-universal-release-v1.5.2.apk`
- **File Size**: ~22MB
- **Version**: v1.5.2
- **Category**: Browser & WebView

### **Replacement Targets**
- **NativeAlpha**: Native Alpha browser
- **WebView**: WebView replacement
- **Browser**: Browser replacement
- **com.android.nativealpha**: Native Alpha package

### **Features**
- **Privacy-Focused Browser**: Built-in privacy protection
- **WebView Integration**: Modern WebView implementation
- **Ad Blocking**: Advanced ad blocking capabilities
- **Tracking Protection**: Comprehensive tracking protection
- **Secure Browsing**: Enhanced security features
- **Customization**: Extensive browser customization options

### **Build Configuration**
```blueprint
android_app_import {
    name: "native.alpha",
    apk: "SystemPrebuilts/nativeAlpha/NativeAlpha-extendedGithub-universal-release-v1.5.2.apk",
    preprocessed: false,
    certificate: "platform",
    dex_preopt: {
        enabled: false,
    },
    product_specific: true,
    overrides: [
        "NativeAlpha",
        "WebView",
        "Browser",
        "com.android.nativealpha",
    ],
}
```

### **Default Configuration**
- **Property Override**: `ro.config.nativealpha_default=native.alpha`
- **Package**: Added to `PRODUCT_PACKAGES` in config.mk
- **System Integration**: Full WebView and browser integration

### **Privacy & Security**
- **Privacy-First**: No data collection or tracking
- **Local Processing**: All browsing data processed locally
- **Encrypted Connections**: Secure HTTPS connections
- **No Telemetry**: Zero telemetry or analytics

### **Compatibility**
- **Android Version**: Android 12+ (API level 31+)
- **Architecture**: Universal (supports multiple architectures)
- **LineageOS**: Compatible with LineageOS 18.1+
- **Permissions**: Network and storage permissions only

### **User Experience**
- **Modern Interface**: Contemporary browser design
- **Fast Performance**: Optimized for speed and efficiency
- **Accessibility**: Full accessibility support
- **Dark Mode**: System-wide dark mode integration
