#import <Preferences/Preferences.h>

@interface BetrFoldrsListController: PSListController {
}
@end

@implementation BetrFoldrsListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"BetrFoldrs" target:self] retain];
	}
	return _specifiers;
}
@end

// vim:ft=objc
