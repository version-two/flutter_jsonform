#import "FlutterJsonformPlugin.h"
#if __has_include(<flutter_jsonform/flutter_jsonform-Swift.h>)
#import <flutter_jsonform/flutter_jsonform-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_jsonform-Swift.h"
#endif

@implementation FlutterJsonformPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterJsonformPlugin registerWithRegistrar:registrar];
}
@end
