#import "FlutterbookpluginbatterylevPlugin.h"
#if __has_include(<flutterbookpluginbatterylev/flutterbookpluginbatterylev-Swift.h>)
#import <flutterbookpluginbatterylev/flutterbookpluginbatterylev-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutterbookpluginbatterylev-Swift.h"
#endif

@implementation FlutterbookpluginbatterylevPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterbookpluginbatterylevPlugin registerWithRegistrar:registrar];
}
@end
