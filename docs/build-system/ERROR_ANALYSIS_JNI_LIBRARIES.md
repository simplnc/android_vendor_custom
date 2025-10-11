# JNI Library Compression Errors - Analysis & Resolution

## Error Description
**Error Type**: APK Validation Failure - Compressed JNI Libraries
**Build Stage**: Prebuilt APK validation
**Error Message**: `Contains compressed JNI libraries`

## Affected Applications
1. **io.github.yamin8000.owl** (Dictionary app)
2. **com.truemlgpro.wifiinfo** (WiFi Info app)  
3. **org.breezyweather** (Weather app)

## Root Cause Analysis

### What Are JNI Libraries?
- **JNI (Java Native Interface)**: Allows Java code to call native C/C++ code
- **Location**: Stored within APK files in `lib/` directories
- **Compression**: Can be stored compressed or uncompressed

### Why Compression Causes Build Failures
1. **Build System Expectation**: Soong build system expects uncompressed JNI libraries
2. **Validation Script**: `check_prebuilt_presigned_apk.py` validates APK structure
3. **Installation Issues**: Compressed libraries can cause runtime failures
4. **Performance Impact**: Uncompressed libraries load faster

### Technical Details
```bash
# Error occurs during this build step:
build/soong/scripts/check_prebuilt_presigned_apk.py \
  --aapt2 out/host/linux-x86/bin/aapt2 \
  --zipalign out/host/linux-x86/bin/zipalign \
  --preprocessed vendor/custom/SystemPrebuilts/dictionary/io.github.yamin8000.owl-v46-n1.7.3-release.apk
```

## Error Resolution

### Solution 1: Set preprocessed: false
```bp
android_app_import {
    name: "io.github.yamin8000.owl",
    apk: "SystemPrebuilts/dictionary/io.github.yamin8000.owl-v46-n1.7.3-release.apk",
    preprocessed: false,     // ← KEY FIX: Indicates APK contains compressed JNI
    certificate: "platform", // ← REQUIRED: Platform certificate for non-preprocessed APKs
    dex_preopt: { enabled: false, },
    product_specific: true,
    overrides: [ ... ],
}
```

### Solution 2: Use Platform Certificate
```bp
certificate: "platform"  // ← REQUIRED for non-preprocessed APKs
```

**Why Platform Certificate?**
- Non-preprocessed APKs need signing during build
- Platform certificate is always available
- PRESIGNED certificate requires additional files that may not exist

## Complete Fix Implementation

### Before (Causing Errors)
```bp
android_app_import {
    name: "io.github.yamin8000.owl",
    apk: "SystemPrebuilts/dictionary/io.github.yamin8000.owl-v46-n1.7.3-release.apk",
    preprocessed: true,      // ← WRONG: APK has compressed JNI
    certificate: "PRESIGNED", // ← WRONG: Not available for non-preprocessed
    // ... rest of config
}
```

### After (Fixed)
```bp
android_app_import {
    name: "io.github.yamin8000.owl",
    apk: "SystemPrebuilts/dictionary/io.github.yamin8000.owl-v46-n1.7.3-release.apk",
    preprocessed: false,     // ← CORRECT: APK has compressed JNI
    certificate: "platform", // ← CORRECT: Platform certificate for signing
    dex_preopt: { enabled: false, },
    product_specific: true,
    overrides: [ ... ],
}
```

## Verification Steps

### 1. Check APK Structure
```bash
# Extract APK to examine JNI libraries
unzip -l io.github.yamin8000.owl-v46-n1.7.3-release.apk | grep "lib/"

# Look for compressed vs uncompressed libraries
file io.github.yamin8000.owl-v46-n1.7.3-release.apk
```

### 2. Build Verification
```bash
# Build should complete without JNI errors
mka vendor/custom

# Check build logs for success
tail -f out/error.log | grep -i "jni\|compressed"
```

### 3. Runtime Verification
```bash
# Install APK and test functionality
adb install -r out/target/product/*/system/app/io.github.yamin8000.owl/io.github.yamin8000.owl.apk

# Check if app launches without native library errors
adb logcat | grep -i "jni\|native\|library"
```

## Prevention Strategies

### 1. APK Analysis Before Adding
```bash
# Check APK for compressed JNI before adding to build
unzip -l app.apk | grep "lib/"
file app.apk
```

### 2. Consistent Configuration
- **preprocessed: true** → Use for APKs with uncompressed JNI
- **preprocessed: false** → Use for APKs with compressed JNI
- **certificate: "platform"** → Always use for non-preprocessed APKs

### 3. Build Testing
- Test individual apps before full build
- Use incremental builds to catch errors early
- Monitor build logs for JNI-related warnings

## Related Errors

### Certificate Missing Error
```bash
error: module "com.truemlgpro.wifiinfo" variant "android_common": 
One and only one of certificate, presigned (implied by preprocessed), 
and default_dev_cert properties must be set
```

**Cause**: Non-preprocessed APK without proper certificate
**Fix**: Add `certificate: "platform"`

### PRESIGNED Certificate Missing
```bash
ninja: 'build/make/target/product/security/PRESIGNED.x509.pem', 
needed by '.../com.truemlgpro.wifiinfo.apk', missing and no known rule to make it
```

**Cause**: PRESIGNED certificate file doesn't exist
**Fix**: Use `certificate: "platform"` instead

## Best Practices

1. **Always check APK structure** before adding to build
2. **Use preprocessed: false** for APKs with compressed JNI
3. **Use certificate: "platform"** for non-preprocessed APKs
4. **Test builds incrementally** to catch JNI errors early
5. **Document JNI requirements** for each app
6. **Monitor build logs** for JNI-related warnings

## Conclusion

JNI library compression errors are common when working with prebuilt APKs. The key is understanding the difference between `preprocessed: true` and `preprocessed: false`, and ensuring proper certificate configuration. By following the resolution steps outlined above, these errors can be completely eliminated from the build process.

**Key Takeaways:**
- Compressed JNI = `preprocessed: false`
- Uncompressed JNI = `preprocessed: true`
- Non-preprocessed APKs need `certificate: "platform"`
- Always verify APK structure before adding to build
