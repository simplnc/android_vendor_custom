# Launchpad - App Launcher

## 📱 **Application Details**

### **Basic Information**
- **Package Name**: `com.devrinth.launchpad`
- **APK Path**: `SystemPrebuilts/launchpad/com.devrinth.launchpad_764.apk`
- **File Size**: ~8MB
- **Version**: 764
- **Category**: Launcher & App Management

### **Replacement Targets**
- **Launchpad**: Launchpad applications
- **AppLauncher**: App launcher applications
- **QuickLaunch**: Quick launch applications
- **com.android.launchpad**: AOSP launchpad package

### **Features**
- **Custom App Launcher**: Advanced app launching interface
- **Quick Access**: Fast access to frequently used apps
- **Customization**: Extensive customization options
- **Shortcuts**: Support for app shortcuts and actions
- **Search**: Built-in app search functionality
- **Privacy-Focused**: No data collection or tracking

### **Build Configuration**
```blueprint
android_app_import {
    name: "com.devrinth.launchpad",
    apk: "SystemPrebuilts/launchpad/com.devrinth.launchpad_764.apk",
    preprocessed: true,
    dex_preopt: {
        enabled: false,
    },
    product_specific: true,
    overrides: [
        "Launchpad",
        "AppLauncher",
        "QuickLaunch",
        "com.android.launchpad",
    ],
}
```

### **Default Configuration**
- **Property Override**: `ro.config.launchpad_default=com.devrinth.launchpad`
- **Package**: Added to `PRODUCT_PACKAGES` in config.mk
- **System Integration**: Full integration with Android launcher system

### **Privacy & Security**
- **Local Storage**: All preferences stored locally
- **No Tracking**: No analytics or user behavior tracking
- **Data Privacy**: No external data transmission
- **Offline Functionality**: Works completely offline

### **Compatibility**
- **Android Version**: Android 12+ (API level 31+)
- **Architecture**: ARM64 (arm64-v8a)
- **LineageOS**: Compatible with LineageOS 18.1+
- **Permissions**: Minimal permissions required

### **User Experience**
- **Modern UI**: Contemporary launcher interface
- **Performance**: Optimized for smooth performance
- **Accessibility**: Full accessibility support
- **Theming**: Extensive theming and customization options
