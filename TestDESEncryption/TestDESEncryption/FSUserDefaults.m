//
//  FSUserDefaults.m
//  FinancialService
//
//  Created by Bill liu on 15/9/11.
//  Copyright (c) 2015年 heshidai. All rights reserved.
//

#import "FSUserDefaults.h"


NSString * const GESTURE_PASSWORD_KEY = @"gesture_password_key";

NSString * const PUSH_NOTIFICATION = @"push_notification";

NSString * const USER_KEY = @"user_key";

NSString * const APP_RECOMMENDER_KEY = @"app_recommender_key";

NSString * const DIANRU_LIMIT_TIME_KEY = @"dianru_limit_time";

NSString * const DEVICE_UUID = @"UUID";

NSString * const APP_VERSION = @"app_version";

NSString * const UPDATE_ACCOUNT_MENU_DATA_KEY = @"update_account_menu_data_key";

//NSString * const UPDATE_ACCOUNT_MENU_TIME_KEY = @"update_account_menu_time_key";
NSString * const UPDATE_ACCOUNT_MENU_TIME_VERSION_KEY = @"update_account_menu_time_version_key";

NSString * const PROJECT_TYPE_USERDEFAULTS_KEY = @"project_type_userdefaults_key";

NSString * const SETTING_OPT_PLAN = @"SettingOptPlan";

NSString * const SEARCH_HISTORY_KEYWORD_KEY = @"search_history_keyword_key";

NSString * const PWD_SEND_CODE_DATE_KEY = @"pwdSendCodeTime";

//NSString * const PWD_SEND_CODE_FAILURE_KEY = @"pwdSendCodeFailure";

NSString * const CORRECT_VER_COUNT_KEY = @"correctVerCodeKey";

//NSString * const CORRECT_FAILURE_CODE_KEY = @"correctFailureCodeKey";

NSString * const TOUCH_ID_CACHE_KEY = @"touch_id_cache_key";



@implementation FSUserDefaults


+(id)userDefaultsObjectForKey:(NSString *)key{
    return [self userDefaultsObjectForKey:key unarchiver:NO];
}


+(id)userDefaultsObjectForKey:(NSString *)key unarchiver:(BOOL)isUnarchiver{
    if (key) {
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        id data = [userDefaults objectForKey:key];
        
        if (data) {
            if (isUnarchiver) {
                id unarchiverData = [NSKeyedUnarchiver unarchiveObjectWithData:data];
                return unarchiverData;
            }else{
                return data;
            }
        }
    }
    return nil;
}

+(void)userDefaultsSetObject:(id)object key:(NSString*)key{
    [self userDefaultsSetObject:object key:key archived:NO];
}


+(void)userDefaultsSetObject:(id)object key:(NSString*)key archived:(BOOL)isArchived{
    if (!object || !key) {
        return;
    }
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if (isArchived) {
        [userDefaults setObject:[NSKeyedArchiver archivedDataWithRootObject:object] forKey:key];
    }else{
        [userDefaults setObject:object forKey:key];
    }
    [userDefaults synchronize];
}




+(void)userDefaultsRemoveObjectForKey:(NSString *)key{
    if (!key) {
        return;
    }
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:key];
    [userDefaults synchronize];
}

@end
