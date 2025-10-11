# Draw Anywhere - Screen Drawing Tool

## 📱 **Application Details**

### **Basic Information**
- **Package Name**: `com.shezik.drawanywhere`
- **APK Path**: `SystemPrebuilts/drawanywhere/com.shezik.drawanywhere_2.apk`
- **File Size**: ~4MB
- **Version**: 2
- **Category**: Drawing & Annotation

### **Replacement Targets**
- **DrawAnywhere**: Draw anywhere applications
- **ScreenDraw**: Screen drawing applications
- **Annotation**: Annotation applications
- **com.android.drawanywhere**: AOSP draw anywhere package

### **Features**
- **Screen Drawing**: Draw and annotate directly on screen
- **Annotation Tools**: Various drawing and annotation tools
- **Screenshot Annotation**: Annotate screenshots and images
- **Custom Brushes**: Customizable brush sizes and colors
- **Privacy-Focused**: Local processing with no data collection

### **Build Configuration**
```blueprint
android_app_import {
    name: "com.shezik.drawanywhere",
    apk: "SystemPrebuilts/drawanywhere/com.shezik.drawanywhere_2.apk",
    preprocessed: true,
    dex_preopt: {
        enabled: false,
    },
    product_specific: true,
    overrides: [
        "DrawAnywhere",
        "ScreenDraw",
        "Annotation",
        "com.android.drawanywhere",
    ],
}
```

### **Default Configuration**
- **Property Override**: `ro.config.drawanywhere_default=com.shezik.drawanywhere`
- **Package**: Added to `PRODUCT_PACKAGES` in config.mk
- **System Integration**: Full integration with Android drawing framework

### **Privacy & Security**
- **Local Processing**: All drawing operations performed locally
- **No Data Collection**: No user data collection or tracking
- **Offline Functionality**: Works completely offline
- **Secure Storage**: Local file storage with proper permissions

### **Compatibility**
- **Android Version**: Android 12+ (API level 31+)
- **Architecture**: ARM64 (arm64-v8a)
- **LineageOS**: Compatible with LineageOS 18.1+
- **Permissions**: Screen capture and storage permissions

### **User Experience**
- **Intuitive Interface**: Easy-to-use drawing interface
- **Touch Optimized**: Optimized for touch input
- **Accessibility**: Full accessibility support
- **Dark Mode**: System-wide dark mode integration
