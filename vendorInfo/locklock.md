# LockLock - Lock Screen Customization

## 📱 **Application Details**

### **Basic Information**
- **Package Name**: `nethical.locklock`
- **APK Path**: `SystemPrebuilts/locklock/nethical.locklock_2.apk`
- **File Size**: ~5MB
- **Version**: 2
- **Category**: Lock Screen & Security

### **Replacement Targets**
- **LockLock**: LockLock applications
- **LockScreen**: Lock screen applications
- **CustomLockscreen**: Custom lock screen applications
- **com.android.locklock**: AOSP LockLock package

### **Features**
- **Lock Screen Customization**: Customize lock screen appearance
- **Security Options**: Enhanced lock screen security features
- **Widgets**: Lock screen widgets and shortcuts
- **Themes**: Custom lock screen themes
- **Privacy Protection**: Enhanced privacy on lock screen
- **Local Processing**: All customization stored locally

### **Build Configuration**
```blueprint
android_app_import {
    name: "nethical.locklock",
    apk: "SystemPrebuilts/locklock/nethical.locklock_2.apk",
    preprocessed: true,
    dex_preopt: {
        enabled: false,
    },
    product_specific: true,
    overrides: [
        "LockLock",
        "LockScreen",
        "CustomLockscreen",
        "com.android.locklock",
    ],
}
```

### **Default Configuration**
- **Property Override**: `ro.config.locklock_default=nethical.locklock`
- **Package**: Added to `PRODUCT_PACKAGES` in config.mk
- **System Integration**: Full integration with Android lock screen system

### **Privacy & Security**
- **Local Storage**: All customization data stored locally
- **No Data Collection**: No user behavior tracking
- **Secure Processing**: Secure lock screen processing
- **Privacy Protection**: Enhanced privacy features

### **Compatibility**
- **Android Version**: Android 12+ (API level 31+)
- **Architecture**: ARM64 (arm64-v8a)
- **LineageOS**: Compatible with LineageOS 18.1+
- **Permissions**: System UI and lock screen permissions

### **User Experience**
- **Easy Customization**: Simple lock screen customization
- **Modern Interface**: Contemporary lock screen design
- **Accessibility**: Full accessibility support
- **Performance**: Optimized for smooth performance
