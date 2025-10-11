# Android Vendor Custom - LineageOS Enhancement Package

[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![LineageOS](https://img.shields.io/badge/LineageOS-Compatible-green.svg)](https://lineageos.org/)
[![Android](https://img.shields.io/badge/Android-14+-orange.svg)](https://developer.android.com/)

A comprehensive vendor package for LineageOS that replaces default system applications with privacy-focused, open-source alternatives. This package enhances LineageOS with carefully curated applications that prioritize user privacy, security, and functionality.

## 🚀 Quick Start

```bash
# Clone the repository
git clone https://github.com/yourusername/android_vendor_custom.git

# Copy to your LineageOS vendor directory
cp -r android_vendor_custom vendor/custom

# Build LineageOS with custom vendor
source build/envsetup.sh
lunch lineage_[device]-userdebug
mka bacon
```

## 📱 Featured Applications

### Core System Apps
- **Browser**: DuckDuckGo Privacy Browser
- **Calculator**: Calculator You
- **Calendar**: Simple Calendar Pro
- **Clock**: Chrono
- **Contacts**: Simple Contacts
- **Email**: Thunderbird
- **File Manager**: Simple File Manager
- **Gallery**: Simple Gallery
- **Music**: Booming Music Player
- **Notes**: Easy Notes
- **Weather**: Breezy Weather

### Privacy & Security
- **Firewall**: Network Firewall
- **Privacium**: Privacy Manager
- **Session**: Secure Messaging
- **WiFi Info**: Network Analyzer

### Productivity & Utilities
- **Daily You**: Habit Tracker
- **Draw Anywhere**: Screen Annotation
- **Image Toolbox**: Photo Editor
- **Launchpad**: App Launcher
- **Native Alpha**: WebView Alternative
- **Photo Widget**: Home Screen Widgets
- **Quick Tiles**: System Tiles
- **SnapTick**: Task Tracker
- **TapTap**: Gesture Controls

### Digital Wellbeing
- **DigiPaws**: Screen Time Management
- **LockLock**: Custom Lock Screen

## 📁 Project Structure

```
android_vendor_custom/
├── Android.bp                 # Build configuration
├── SystemPrebuilts/          # Application APKs
│   ├── browser/
│   ├── calculator/
│   ├── calendar/
│   └── ...
├── docs/                     # Documentation
│   ├── apps/                # App-specific documentation
│   ├── build-system/        # Build system documentation
│   ├── charity/             # Charity information
│   └── developer/           # Developer resources
├── config/                   # Build configuration
└── patches/                  # System patches
```

## 🔧 Configuration

### Build Configuration
- **Android.bp**: Soong build system configuration
- **config.mk**: Makefile configuration
- **config/**: Optimization settings

### App Configuration
Each application is configured with:
- Proper certificate signing
- System integration
- Override configurations
- Privacy permissions

## 📚 Documentation

- [**App Overview**](docs/APP_OVERVIEW.md) - Complete application list
- [**Build Guide**](docs/BUILD_GUIDE.md) - Building instructions
- [**User Guide**](docs/USER_GUIDE.md) - End-user documentation
- [**Developer Tutorial**](docs/developer/DEVELOPER_TUTORIAL.md) - Development guide
- [**Troubleshooting**](docs/TROUBLESHOOTING.md) - Common issues

## 🛡️ Privacy & Security

This vendor package prioritizes:
- **Privacy**: No tracking, no data collection
- **Security**: Regular updates, secure defaults
- **Transparency**: Open-source applications only
- **User Control**: Uninstallable system apps

## 🤝 Contributing

We welcome contributions! Please see our [Contributing Guidelines](docs/developer/CONTRIBUTING.md) for details.

### Development Setup
1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- **LineageOS Team** - For the excellent base ROM
- **Open Source Developers** - For the amazing applications
- **Community Contributors** - For feedback and improvements

## 💝 Charity Support

We donate 2% of development profits to [British Cancer Research](https://www.cancerresearchuk.org/) to support cancer research and treatment.

## 📞 Support

- **Issues**: [GitHub Issues](https://github.com/yourusername/android_vendor_custom/issues)
- **Discussions**: [GitHub Discussions](https://github.com/yourusername/android_vendor_custom/discussions)
- **Documentation**: [Wiki](https://github.com/yourusername/android_vendor_custom/wiki)

## 🔄 Updates

- **Latest Release**: v1.0.0
- **Android Version**: 14+
- **LineageOS Version**: 21+

---

**Made with ❤️ for the LineageOS community**