# Custom Gallery, File Manager, and AOD Toggle App Override Configuration
# This configuration ensures Fossify Gallery, File Manager, and AOD Toggle replace all default apps

# Apps and their associated configuration modules
PRODUCT_PACKAGES += \
	org.fossify.gallery \
	privapp_whitelist_org.fossify.gallery \
	default_gallery_intent_config \
	org.fossify.filemanager \
	privapp_whitelist_org.fossify.filemanager \
	default_filemanager_intent_config \
	org.alberto97.aodtoggle \
	privapp_whitelist_org.alberto97.aodtoggle \
	default_aodtoggle_intent_config

# Make Fossify Gallery the default gallery app
PRODUCT_PROPERTY_OVERRIDES += \
	ro.config.gallery_default=org.fossify.gallery \
	ro.config.filemanager_default=org.fossify.filemanager

# Remove conflicting gallery apps from build
PRODUCT_PACKAGES_REMOVE += \
	Gallery \
	Gallery2 \
	Photos \
	Eleven

# Remove conflicting file manager apps from build
# Note: DocumentsUI is overridden but not removed to preserve dependencies
PRODUCT_PACKAGES_REMOVE += \
	Files \
	FileManager \
	FilesLineage \
	LineageFileManager

# Privileged app permissions are handled by Android.bp prebuilt_etc modules
# No manual PRODUCT_COPY_FILES needed - handled automatically by build system 
