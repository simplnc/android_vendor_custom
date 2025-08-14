# Custom LineageOS Configuration
# This configuration replaces default system apps with custom alternatives

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    vendor/custom

# SystemPrebuilts Apps (APK files)
PRODUCT_PACKAGES += \
    threads.thor \
    CalculatorYou \
    calendar.foss \
    com.drnoob.datamonitor \
    io.github.yamin8000.owl \
    com.bitmavrick.lumolight \
    com.mardous.booming \
    recordyou \
    org.breezyweather \
    com.truemlgpro.wifiinfo \
    com.celzero.bravedns_478 \
    TapTap \
    dualwall \
    QuickTiles \
    org.fossify.filemanager \
    com.bnyro.contacts \
    org.fossify.phone \
    org.fossify.gallery \
    notes 

# SystemBuild Apps (Built from source)
PRODUCT_PACKAGES += \
    athena \
    chrono \
    bcr

# Default app configurations
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.browser_default=threads.thor \
    ro.config.calculator_default=CalculatorYou \
    ro.config.calendar_default=calendar.foss \
    ro.config.datamonitor_default=com.drnoob.datamonitor \
    ro.config.dictionary_default=io.github.yamin8000.owl \
    ro.config.flashlight_default=com.bitmavrick.lumolight \
    ro.config.music_default=com.mardous.booming \
    ro.config.recorder_default=recordyou \
    ro.config.weather_default=org.breezyweather \
    ro.config.wifiinfo_default=com.truemlgpro.wifiinfo \
    ro.config.gallery_default=org.fossify.gallery \
    ro.config.filemanager_default=org.fossify.filemanager \
    ro.config.contacts_default=com.bnyro.contacts \
    ro.config.dns_default=com.celzero.bravedns_478

# Remove conflicting system apps
PRODUCT_PACKAGES_REMOVE += \
    Gallery \
    Gallery2 \
    GalleryGo \
    Photos \
    LineageGallery \
    LineageGallery2 \
    OmniGallery \
    com.android.gallery \
    com.android.gallery3d \
    com.google.android.apps.photos \
    org.lineageos.gallery \
    org.lineageos.gallery2 \
    Glimpse \
    com.lineageos.glimpse \
    Browser \
    Browser2 \
    com.android.browser \
    com.android.browser2 \
    WebView \
    WebViewGoogle \
    SystemWebView \
    com.android.webview \
    com.google.android.webview \
    org.chromium.webview_shell

# Build system optimizations
RELAX_USES_LIBRARY_CHECK=true

# Dex preopt settings
DEX_PREOPT_DEFAULT := false
DEX_PREOPT_APP := false
DEX_PREOPT_BOOT_IMG := false
PRODUCT_DEX_PREOPT_APP := false
PRODUCT_DEX_PREOPT_BOOT_IMG := false
PRODUCT_DEX_PREOPT_DEFAULT := false
PRODUCT_DEX_PREOPT_WIFI := false

# WiFi system server configuration
PRODUCT_SYSTEM_SERVER_JARS += service-wifi
PRODUCT_PACKAGES += \
    com.android.wifi \
    service-wifi

# WiFi artifact path requirements
PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/framework/oat/arm64/apex@com.android.wifi@javalib@service-wifi.jar@classes.odex \
    system/framework/oat/arm64/apex@com.android.wifi@javalib@service-wifi.jar@classes.vdex

# Critical telephony services
PRODUCT_PACKAGES += \
    com.android.phone \
    com.android.dialer \
    TeleService \
    TelephonyProvider \
    CallLogProvider


