# Custom Gallery, File Manager, and AOD Toggle App Override Configuration
# This configuration ensures Fossify Gallery, File Manager, and AOD Toggle replace all default apps

# Apps
PRODUCT_PACKAGES += \
	org.fossify.gallery \
	privapp_whitelist_org.fossify.gallery \
	org.fossify.filemanager \
	privapp_whitelist_org.fossify.filemanager \
	org.alberto97.aodtoggle \
	privapp_whitelist_org.alberto97.aodtoggle

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

# Ensure privileged app permissions are applied
PRODUCT_COPY_FILES += \
	vendor/custom/SystemPrebuilts/gallery/privapp-permissions-org.fossify.gallery.xml:system/etc/permissions/privapp-permissions-org.fossify.gallery.xml \
	vendor/custom/SystemPrebuilts/filemanager/privapp-permissions-org.fossify.filemanager.xml:system/etc/permissions/privapp-permissions-org.fossify.filemanager.xml \
	vendor/custom/SystemPrebuilts/aodtoggle/privapp-permissions-org.alberto97.aodtoggle.xml:system/etc/permissions/privapp-permissions-org.alberto97.aodtoggle.xml 
