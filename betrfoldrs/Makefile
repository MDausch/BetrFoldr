include theos/makefiles/common.mk

BUNDLE_NAME = BetrFoldrs
BetrFoldrs_FILES = BetrFoldrs.mm
BetrFoldrs_INSTALL_PATH = /Library/PreferenceBundles
BetrFoldrs_FRAMEWORKS = UIKit
BetrFoldrs_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/BetrFoldrs.plist$(ECHO_END)
