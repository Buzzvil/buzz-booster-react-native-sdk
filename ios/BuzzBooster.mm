#import "BuzzBooster.h"

#ifdef RCT_NEW_ARCH_ENABLED
#import "RNBuzzBoosterSpec.h"
#endif

@implementation BuzzBooster
RCT_EXPORT_MODULE()

// Example method
// See // https://reactnative.dev/docs/native-modules-ios
RCT_REMAP_METHOD(multiply,
                 multiplyWithA:(nonnull NSNumber*)a withB:(nonnull NSNumber*)b
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)
{
  NSNumber *result = @([a floatValue] * [b floatValue]);

  resolve(result);
}

RCT_EXPORT_BLOCKING_SYNCHRONOUS_METHOD(initWithAppKey:(NSString *)appKey) {
  BSTConfig *config = [BSTConfig configWithBlock:^(BSTConfigBuilder * _Nonnull builder) {
    builder.appKey = appKey;
  }];
  [BuzzBooster initializeWithConfig:config];
}

RCT_EXPORT_BLOCKING_SYNCHRONOUS_METHOD(setUserId:(nullable NSString *)userId) {
  [BuzzBooster setUserId:userId];
}

RCT_EXPORT_BLOCKING_SYNCHRONOUS_METHOD(showInAppMessage) {
  UIViewController *vc = [UIApplication sharedApplication].delegate.window.rootViewController
  [BuzzBooster showInAppMessageWithRootViewController:vc];
}

RCT_EXPORT_METHOD(sendEventWithEventName:(NSString *)eventName eventValues:(nullable NSDictionary<String *, String*> *)eventValues) {
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
