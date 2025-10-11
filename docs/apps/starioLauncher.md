# Stario Launcher - Alternative Home Screen

## 📱 **Application Details**

### **Basic Information**
- **Package Name**: `com.stario.launcher`
- **APK Path**: `SystemPrebuilts/starioLauncher/com.stario.launcher_91.apk`
- **File Size**: ~15MB
- **Version**: 91
- **Category**: Launcher & Home Screen

### **Replacement Targets**
- **StarioLauncher**: Stario launcher
- **CustomLauncher**: Custom launcher applications
- **AlternativeLauncher**: Alternative launcher applications
- **com.android.stario.launcher**: Stario launcher package

### **Features**
- **Custom Home Screen**: Alternative home screen experience
- **App Organization**: Advanced app organization and categorization
- **Customization**: Extensive home screen customization options
- **Widgets**: Support for home screen widgets
- **Themes**: Custom themes and appearance options
- **Performance**: Optimized for smooth performance

### **Build Configuration**
```blueprint
android_app_import {
    name: "com.stario.launcher",
    apk: "SystemPrebuilts/starioLauncher/com.stario.launcher_91.apk",
    preprocessed: true,
    dex_preopt: {
        enabled: false,
    },
    product_specific: true,
    overrides: [
        "StarioLauncher",
        "CustomLauncher",
        "AlternativeLauncher",
        "com.android.stario.launcher",
    ],
}
```

### **Default Configuration**
- **Property Override**: `ro.config.launcher_default=com.stario.launcher`
- **Package**: Added to `PRODUCT_PACKAGES` in config.mk
- **System Integration**: Full integration with Android launcher system

### **Privacy & Security**
- **Local Storage**: All preferences and data stored locally
- **No Data Collection**: No user behavior tracking
- **Privacy-Focused**: Privacy-first launcher design
- **Secure Processing**: Secure launcher operations

### **Compatibility**
- **Android Version**: Android 12+ (API level 31+)
- **Architecture**: ARM64 (arm64-v8a)
- **LineageOS**: Compatible with LineageOS 18.1+
- **Permissions**: Launcher and home screen permissions

### **User Experience**
- **Modern Interface**: Contemporary launcher design
- **Smooth Performance**: Optimized for smooth operation
- **Accessibility**: Full accessibility support
- **Customization**: Extensive customization options
