//
//  CWCommonTools+AppStore.m
//  CWCommonTools
//
//  Created by CW on 2020/12/15.
//

#import "CWCommonTools+AppStore.h"

@implementation CWCommonTools (AppStore)

- (void)openAppStoreWithAppleID:(NSString *)appleID withType:(CWJumpStoreType)jumpStoreType {
    switch (jumpStoreType) {
        case kCWJumpStoreTypeInAppStore:{
            NSString* urlStr =[NSString stringWithFormat:@"https://itunes.apple.com/app/id%@",appleID];
            [[CWCommonTools sharedCWCommonTools] applicationOpenURL:[NSURL URLWithString:urlStr]];
        }
            break;
        case kCWJumpStoreTypeInApp:{
            if (@available(iOS 10.3, *)) {
                SKStoreProductViewController *storeProductVC = [[SKStoreProductViewController alloc] init];
                storeProductVC.delegate = self;
                [storeProductVC loadProductWithParameters:[NSDictionary dictionaryWithObjectsAndKeys:appleID,SKStoreProductParameterITunesItemIdentifier, nil] completionBlock:^(BOOL result, NSError * _Nullable error) {
                    if (result) {
                        [[[[UIApplication sharedApplication] keyWindow] rootViewController] presentViewController:storeProductVC animated:YES completion:nil];
                    } else {
                        NSLog(@"%@",error);
                    }
                }];
            } else {
                NSLog(@"Less than 10.3 version does not support opening the Appstore preview page within app");
            }
        }
            break;
        case kCWJumpStoreTypeAuto:{
            if (@available(iOS 10.3, *)) {
                SKStoreProductViewController *storeProductVC = [[SKStoreProductViewController alloc] init];
                storeProductVC.delegate = self;
                [storeProductVC loadProductWithParameters:[NSDictionary dictionaryWithObjectsAndKeys:appleID,SKStoreProductParameterITunesItemIdentifier, nil] completionBlock:^(BOOL result, NSError * _Nullable error) {
                    if (result) {
                        [[[[UIApplication sharedApplication] keyWindow] rootViewController] presentViewController:storeProductVC animated:YES completion:nil];
                    } else {
                        NSLog(@"%@",error);
                    }
                }];
            } else {
                NSString* urlStr =[NSString stringWithFormat:@"https://itunes.apple.com/app/id%@",appleID];
                [[CWCommonTools sharedCWCommonTools] applicationOpenURL:[NSURL URLWithString:urlStr]];
            }
        }
            break;
    }
}

- (void)giveScoreWithAppleID:(NSString *)appleID withType:(CWScoreType)scoreType {
    switch (scoreType) {
        case kCWScoreTypeInAppStore:{
            NSString* urlStr =[NSString stringWithFormat:@"itms-apps://itunes.apple.com/app/viewContentsUserReviews?id=%@",appleID];
            [[CWCommonTools sharedCWCommonTools] applicationOpenURL:[NSURL URLWithString:urlStr]];
        }
            break;
        case kCWScoreTypeInApp:{
            if (@available(iOS 10.3, *)) {
                [SKStoreReviewController requestReview];
            } else {
                NSLog(@"Less than 10.3 version does not support the app open score");
            }
        }
            break;
        case kCWScoreTypeAuto:{
            if (@available(iOS 10.3, *)) {
                [SKStoreReviewController requestReview];
            } else {
                NSString* urlStr =[NSString stringWithFormat:@"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@",appleID];
                [[CWCommonTools sharedCWCommonTools] applicationOpenURL:[NSURL URLWithString:urlStr]];
            }
        }
            break;
    }
}

- (void)giveScoreAutoTypeWithAppleID:(NSString *)appleID withHasRequestTime:(NSUInteger)hasRequestTime withTotalTimeLimit:(NSUInteger)totalTimeLimit {
    if (@available(iOS 10.3, *)) {
        if (hasRequestTime < totalTimeLimit && hasRequestTime < 3) {
            [SKStoreReviewController requestReview];
        } else {
            [self giveScoreWithAppleID:appleID withType:kCWScoreTypeInAppStore];
        }
    } else {
        [self giveScoreWithAppleID:appleID withType:kCWScoreTypeInAppStore];
    }
}

#pragma mark -
#pragma mark - SKStoreProductViewControllerDelegate
- (void)productViewControllerDidFinish:(SKStoreProductViewController *)viewController{
    [viewController dismissViewControllerAnimated:YES completion:nil];
}

@end
