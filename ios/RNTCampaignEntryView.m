#import <React/RCTViewManager.h>
#import <BuzzBooster/BuzzBooster.h>

@interface RNTCampaignEntryViewManager : RCTViewManager
@end

@implementation RNTCampaignEntryViewManager

RCT_EXPORT_MODULE(CampaignEntryView)

- (UIView *)view
{
  return [[BSTCampaignEntryView alloc] init];
}

@end
