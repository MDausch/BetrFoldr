static BOOL p2cisEnabled = NO; // Default value
static BOOL NestisEnabled = NO; // Default value
static BOOL ClearbgisEnabled = NO; // Default value

%hook SBFolderSettings
- (BOOL)pinchToClose
{
	if(p2cisEnabled)
		{
		return YES;
		}
		else 
		{
		return NO;
		}
}
%end

%hook SBFolderSettings
-  (BOOL)allowNestedFolders
{
	if(NestisEnabled)
	{
	return YES;
	}
	else
	{
	return NO;
	}
}
%end

%hook SBFolderSettings;
- (BOOL)blurFolderBackground
{
	if(ClearbgisEnabled)
	{
	return NO;
	}
	else
	{
	return YES;
	}
}
%end


static void loadPrefs()
{
    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.uknl.betrfoldrs.plist"];
    if(prefs)
    {
		p2cisEnabled = ( [prefs objectForKey:@"p2cisEnabled"] ? [[prefs objectForKey:@"p2cisEnabled"] boolValue] : p2cisEnabled );
        NestisEnabled = ( [prefs objectForKey:@"NestisEnabled"] ? [[prefs objectForKey:@"NestisEnabled"] boolValue] : NestisEnabled );
        ClearbgisEnabled = ( [prefs objectForKey:@"ClearbgisEnabled"] ? [[prefs objectForKey:@"ClearbgisEnabled"] boolValue] : ClearbgisEnabled );
    }
    [prefs release];
}

%ctor 
{
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.uknl.betrfoldrs/settingschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);
    loadPrefs();
}
