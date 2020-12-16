//
//  CWCommonTools+Permission.m
//  CWCommonTools
//
//  Created by CW on 2020/12/16.
//

#import "CWCommonTools+Permission.h"
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <Photos/Photos.h>

#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#endif

NSString * const CWPermissionStatusDidChangeNotification = @"CWPermissionStatusDidChangeNotification";
NSString * const CWPermissionNameItem = @"CWPermissionNameItem";
NSString * const CWPermissionStatusItem = @"CWPermissionStatusItem";

CLLocationManager *locationManager;

@implementation CWCommonTools (Permission)

#pragma mark -
#pragma mark - 权限类

///是否有麦克风权限
//Whether have the microphone permissions
- (CWPrivatePermissionStatus)getAVMediaTypeAudioPermissionStatus {
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio];
    if (status == AVAuthorizationStatusAuthorized) {
        return kCWAuthorized;
    } else if (status == AVAuthorizationStatusNotDetermined) {
        return kCWNotDetermined;
    } else if (status == AVAuthorizationStatusRestricted) {
        return kCWAuthorRestricted;
    } else {
        return kCWDenied;
    }
}

///是否有拍照权限
//Whether have the Camera permissions
- (CWPrivatePermissionStatus)getAVMediaTypeVideoPermissionStatus {
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (status == AVAuthorizationStatusAuthorized) {
        return kCWAuthorized;
    } else if (status == AVAuthorizationStatusNotDetermined) {
        return kCWNotDetermined;
    } else if (status == AVAuthorizationStatusRestricted) {
        return kCWAuthorRestricted;
    } else {
        return kCWDenied;
    }
}

///是否有相册权限
////Whether have the Photo album permissions
- (CWPrivatePermissionStatus)getPhotoLibraryPermissionStatus {
    PHAuthorizationStatus status=[PHPhotoLibrary authorizationStatus];
    if (status == PHAuthorizationStatusAuthorized) {
        return kCWAuthorized;
    } else if (status == PHAuthorizationStatusNotDetermined) {
        return kCWNotDetermined;
    } else if (status == PHAuthorizationStatusRestricted) {
        return kCWAuthorRestricted;
    } else {
        return kCWDenied;
    }
}

///是否有定位权限
//Whether have the GPS permissions
- (CWPrivatePermissionStatus)getGPSLibraryPermissionStatus {
    if ([CLLocationManager locationServicesEnabled] && ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse || [CLLocationManager authorizationStatus]  == kCLAuthorizationStatusAuthorizedAlways)) {
        //定位功能可用
        return kCWAuthorized;
    } else if ( [CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined) {
        return kCWNotDetermined;
    } else if ([CLLocationManager authorizationStatus] ==kCLAuthorizationStatusRestricted) {
        return kCWAuthorRestricted;
    } else if ([CLLocationManager authorizationStatus] ==kCLAuthorizationStatusDenied) {
        //定位不能用
        return kCWDenied;
    }
    return kCWDenied;
}

///是否有通知权限
///Whether there is notification authority
- (CWPrivatePermissionStatus)getNotificationPermissionStatus {
    if ([[UIApplication sharedApplication] currentUserNotificationSettings].types  == UIUserNotificationTypeNone) {
        return kCWDenied;
    } else {
        return kCWAuthorized;
    }
}

///申请定位权限
//Apply the GPS permissions
- (void)requestGPSLibraryPermissionWithType:(CWGPSPermissionType)GPSPermissionType {
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    if (GPSPermissionType == kCWGPSPermissionWhenInUse) {
        [locationManager requestWhenInUseAuthorization];
    } else if (GPSPermissionType == kCWGPSPermissionAlways) {
        [locationManager requestAlwaysAuthorization];
    } else if (GPSPermissionType == kCWGPSPermissionBoth) {
        [locationManager requestWhenInUseAuthorization];
        [locationManager requestAlwaysAuthorization];
    }
}

///申请麦克风权限
//Apply the Microphone permissions
- (void)requestAVMediaTypeAudioPermission {
    [AVCaptureDevice requestAccessForMediaType:AVMediaTypeAudio completionHandler:^(BOOL granted) {
        CWPrivatePermissionStatus permissionStatus;
        if (granted) {
            permissionStatus = kCWAuthorized;
        } else{
            permissionStatus = kCWDenied;
        }
        NSDictionary * userInfo = [NSDictionary dictionaryWithObjectsAndKeys:@(kCWPermissionNameAudio),CWPermissionNameItem,@(permissionStatus),CWPermissionStatusItem, nil];
        [[NSNotificationCenter defaultCenter] postNotificationName:CWPermissionStatusDidChangeNotification object:nil userInfo:userInfo];
    }];
}

///申请拍照权限
//Apply the Camera permissions
- (void)requestAVMediaTypeVideoPermission {
    [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
        CWPrivatePermissionStatus permissionStatus;
        if (granted) {
            permissionStatus = kCWAuthorized;
        } else {
            permissionStatus = kCWDenied;
        }
        NSDictionary * userInfo = [NSDictionary dictionaryWithObjectsAndKeys:@(kCWPermissionNameVideo),CWPermissionNameItem,@(permissionStatus),CWPermissionStatusItem, nil];
        [[NSNotificationCenter defaultCenter] postNotificationName:CWPermissionStatusDidChangeNotification object:nil userInfo:userInfo];
    }];
}

///申请相册权限
//Apply the Photo album permissions
- (void)requestPhotoLibraryPermission {
    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
        CWPrivatePermissionStatus permissionStatus;
        if (status == PHAuthorizationStatusAuthorized) {
            permissionStatus = kCWAuthorized;
        } else if (status == PHAuthorizationStatusNotDetermined) {
            permissionStatus = kCWNotDetermined;
        } else if (status == PHAuthorizationStatusRestricted) {
            permissionStatus = kCWAuthorRestricted;
        } else {
            permissionStatus = kCWDenied;
        }
        NSDictionary * userInfo = [NSDictionary dictionaryWithObjectsAndKeys:@(kCWPermissionNamePhotoLib),CWPermissionNameItem,@(permissionStatus),CWPermissionStatusItem, nil];
        [[NSNotificationCenter defaultCenter] postNotificationName:CWPermissionStatusDidChangeNotification object:nil userInfo:userInfo];
    }];
}

///申请通知权限
///Application of notification authority
-(void)requestNotificationPermission {
    if (@available(iOS 10.0, *)) {
        [[UNUserNotificationCenter currentNotificationCenter] requestAuthorizationWithOptions:UIUserNotificationTypeAlert|UIUserNotificationTypeSound|UIUserNotificationTypeBadge completionHandler:^(BOOL granted, NSError * _Nullable error) {
            CWPrivatePermissionStatus permissionStatus;
            if (granted) {
                permissionStatus = kCWAuthorized;
            } else {
                permissionStatus = kCWDenied;
            }
            NSDictionary * userInfo = [NSDictionary dictionaryWithObjectsAndKeys:@(kCWPermissionNameNotification),CWPermissionNameItem,@(permissionStatus),CWPermissionStatusItem, nil];
            [[NSNotificationCenter defaultCenter] postNotificationName:CWPermissionStatusDidChangeNotification object:nil userInfo:userInfo];
        }];
    } else {
        [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeSound|UIUserNotificationTypeBadge categories:nil]];  //注册通知
    }
}

///打开系统设置
//Open the system settings
- (void)openSystemSetting {
    NSURL *settingUrl = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    if ([[UIApplication sharedApplication] canOpenURL:settingUrl]) {
        if (@available(iOS 10.0, *)) {
            [[UIApplication sharedApplication] openURL:settingUrl options:[NSDictionary dictionary] completionHandler:nil];
        } else {
            [[UIApplication sharedApplication] openURL:settingUrl];
        }
    }
}

#pragma mark -
#pragma mark - CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    CWPrivatePermissionStatus permissionStatus;
    if (status == kCLAuthorizationStatusNotDetermined) {
        permissionStatus = kCWNotDetermined;
    } else if (status == kCLAuthorizationStatusRestricted) {
        permissionStatus = kCWAuthorRestricted;
    } else if (status == kCLAuthorizationStatusDenied) {
        permissionStatus = kCWDenied;
    } else {
        permissionStatus = kCWAuthorized;
    }
    NSDictionary * userInfo = [NSDictionary dictionaryWithObjectsAndKeys:@(kCWPermissionNameGPS),CWPermissionNameItem,@(permissionStatus),CWPermissionStatusItem, nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:CWPermissionStatusDidChangeNotification object:nil userInfo:userInfo];
}

@end
