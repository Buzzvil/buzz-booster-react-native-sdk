#import "RNBuzzBooster.h"

#ifdef RCT_NEW_ARCH_ENABLED
#import "RNBuzzBoosterSpec.h"
#endif

@implementation RNBuzzBooster
RCT_EXPORT_MODULE(BuzzBooster) //Specify Module name for using in JS

RCT_EXPORT_METHOD(init:(NSString *)appKey) {
  BSTConfig *config = [BSTConfig configWithBlock:^(BSTConfigBuilder * _Nonnull builder) {
    builder.appKey = appKey;
  }];
  [BuzzBooster initializeWithConfig:config];
}

RCT_EXPORT_METHOD(setUserId:(nullable NSString *)userId) {
  [BuzzBooster setUserId:userId];
}

RCT_EXPORT_METHOD(showInAppMessage) {
  UIViewController *vc = [UIApplication sharedApplication].delegate.window.rootViewController;
  [BuzzBooster showInAppMessageWithRootViewController:vc];
}

RCT_EXPORT_METHOD(sendEvent:(NSString *)eventName eventValues:(nullable NSDictionary<NSString *, NSString*> *)eventValues) {
  if (eventValues) {
    [BuzzBooster sendEventWithEventName:eventName eventValues:eventValues];
  } else {
    [BuzzBooster sendEventWithEventName:eventName];
  }
}

// Don't compile this code when we build for the old architecture.
#ifdef RCT_NEW_ARCH_ENABLED
- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:
    (const facebook::react::ObjCTurboModule::InitParams &)params
{
    return std::make_shared<facebook::react::NativeBuzzBoosterSpecJSI>(params);
}
#endif

@end
