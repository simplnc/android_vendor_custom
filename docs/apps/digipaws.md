# DigiPaws - Digital Wellbeing

## 📱 **Application Details**

### **Basic Information**
- **Package Name**: `nethical.digipaws`
- **APK Path**: `SystemPrebuilts/digipaws/nethical.digipaws_23.apk`
- **File Size**: ~8MB
- **Version**: 23
- **Category**: Digital Wellbeing & Screen Time

### **Replacement Targets**
- **DigiPaws**: DigiPaws applications
- **DigitalWellbeing**: Digital wellbeing applications
- **ScreenTime**: Screen time applications
- **com.android.digipaws**: AOSP DigiPaws package

### **Features**
- **Screen Time Tracking**: Monitor and track screen time usage
- **App Usage Analytics**: Detailed app usage statistics
- **Digital Wellbeing**: Promote healthy digital habits
- **Usage Limits**: Set app usage limits and restrictions
- **Focus Mode**: Focus mode for productivity
- **Privacy-Focused**: Local data processing with no external tracking

### **Build Configuration**
```blueprint
android_app_import {
    name: "nethical.digipaws",
    apk: "SystemPrebuilts/digipaws/nethical.digipaws_23.apk",
    preprocessed: true,
    dex_preopt: {
        enabled: false,
    },
    product_specific: true,
    overrides: [
        "DigiPaws",
        "DigitalWellbeing",
        "ScreenTime",
        "com.android.digipaws",
    ],
}
```

### **Default Configuration**
- **Property Override**: `ro.config.digipaws_default=nethical.digipaws`
- **Package**: Added to `PRODUCT_PACKAGES` in config.mk
- **System Integration**: Full integration with Android usage stats

### **Privacy & Security**
- **Local Analytics**: All usage data processed locally
- **No External Tracking**: No data sent to external servers
- **Data Encryption**: Sensitive usage data encrypted locally
- **User Control**: Complete user control over data

### **Compatibility**
- **Android Version**: Android 12+ (API level 31+)
- **Architecture**: ARM64 (arm64-v8a)
- **LineageOS**: Compatible with LineageOS 18.1+
- **Permissions**: Usage stats and system settings permissions

### **User Experience**
- **Intuitive Dashboard**: Clear usage statistics and insights
- **Customizable Limits**: Flexible app usage limits
- **Visual Reports**: Comprehensive usage reports
- **Accessibility**: Full accessibility support
