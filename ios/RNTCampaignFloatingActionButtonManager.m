#import <React/RCTViewManager.h>
#import <BuzzBooster/BuzzBooster.h>

@interface RNTCampaignFloatingActionButtonManager : RCTViewManager
@end

@implementation RNTCampaignFloatingActionButtonManager

RCT_EXPORT_MODULE(CampaignFloatingActionButton)

- (UIView *)view
{
  return [[BSTCampaignFloatingActionButton alloc] init];
}

@end
