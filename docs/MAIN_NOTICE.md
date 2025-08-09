# Main Notice & Documentation Hub

## What this is

This file is the **entry point** for all docs in `vendor/custom`. Builders and developers can start here and quickly jump to:
- High level app list
- Build / config references
- Deep-dive and troubleshooting docs

## Recommended reading order

1. **User-facing overview**
   - `wiki/user-guides/APP_OVERVIEW.md` – Clean list of all included apps and categories
   - `wiki/user-guides/PRIVACY_BENEFITS.md` – What problems this vendor solves for users
   - `wiki/user-guides/USER_GUIDE.md` – Simple guide for end users

2. **Builder / maintainer docs**
   - `wiki/build-guides/BUILD_GUIDE.md` – How to wire this vendor into a device tree
   - `build-system/VENDOR_BUILD_GUIDE.md` – Detailed build system layout
   - `wiki/technical-reference/CONFIGURATION_REFERENCE.md` – Exact structure of `Android.bp` and `config.mk`
   - `wiki/production/PRODUCTION_READY_SUMMARY.md` – Checklist before shipping a build
   - `wiki/maintenance/MAINTENANCE_GUIDE.md` – Adding/removing apps guide

3. **App‑level docs**
   - `apps/` directory – One file per important app (gallery, filemanager, firewall, etc.)
   - `wiki/analysis/COMPREHENSIVE_APP_ANALYSIS.md` – High‑level app analysis summary

4. **Diagnostics & errors**
   - `wiki/troubleshooting/ERROR_ANALYSIS.md` – Top-level error taxonomy
   - `build-system/ERROR_ANALYSIS_BUILD_SYSTEM_CONFLICTS.md`
   - `build-system/ERROR_ANALYSIS_JNI_LIBRARIES.md`
   - `build-system/ERROR_ANALYSIS_MAKE_PARSING.md`
   - `build-system/ERROR_ANALYSIS_MAKEFILE_SYNTAX.md`
   - `wiki/troubleshooting/TROUBLESHOOTING.md` – Quick answers to common breakage

5. **Advanced / wiki docs**
   - `wiki/WIKI_INDEX.md` – **Start here** - Complete wiki index with all guides organized by category
   - **User Guides**: User Guide, App Overview, Privacy Benefits
   - **Build Guides**: Build Guide, Configuration Reference
   - **Privacy & Security**: Privacy Awesome List, Google Replacements, FDroid Guide, Client Reassurance
   - **Deep Dives**: Browser analysis, GitHub Sources & IzzyOnDroid, Comprehensive App Analysis
   - **Enterprise**: Deployment, Compliance, Security Audit, Testing, Device Compatibility, CI/CD
   - **Technical**: Performance Optimization, SELinux Policies
   - **Troubleshooting**: Troubleshooting Guide, Error Analysis
   - **Maintenance**: Maintenance Guide
   - **Production**: Production Ready Summary
   - **Community**: Thanks & Acknowledgments

## Notes about removed apps

The following apps were **intentionally removed from the build and from most docs**:
- `com.drnoob.datamonitor`
- `com.kaleedtc.privacium`

If you re‑add them later:
- Add new `android_app_import` blocks in `Android.bp`
- Add them back to the relevant `PRODUCT_PACKAGES` section in `config.mk`
- Recreate dedicated app docs under `docs/apps/`

## Where to update when apps change

When you add/remove apps in `SystemPrebuilts` and wire them into the build, keep **at least** these files in sync:
- `Android.bp`
- `config.mk`
- `wiki/user-guides/APP_OVERVIEW.md`
- `wiki/technical-reference/CONFIGURATION_REFERENCE.md`
- `wiki/build-system/VENDOR_BUILD_GUIDE.md`
- `wiki/apps/` (add/remove individual app docs)

This keeps the docs trustworthy for anyone reading them later.
