//
//  FSUserDefaults.h
//  FinancialService
//
//  Created by Bill liu on 15/9/11.
//  Copyright (c) 2015年 heshidai. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 *  手势密码校验
 */
extern NSString * const GESTURE_PASSWORD_KEY;
/**
 *  新手，回款推送设置
 */
extern NSString * const PUSH_NOTIFICATION;
/**
 *  用户信息
 */
extern NSString * const USER_KEY;
/**
 *  注册推荐人
 */
extern NSString * const APP_RECOMMENDER_KEY;

/**
 *  点入统计
 */

extern NSString * const DIANRU_LIMIT_TIME_KEY;
/**
 *  设备唯一编码
 */

extern NSString * const DEVICE_UUID;

/**
 *  版本号记录
 */
extern NSString * const APP_VERSION;

/**
 *  账户菜单缓存
 */

extern NSString * const UPDATE_ACCOUNT_MENU_DATA_KEY;

/**
 *  账户菜单缓存时间戳
 */

//extern NSString * const UPDATE_ACCOUNT_MENU_TIME_KEY;
extern NSString * const UPDATE_ACCOUNT_MENU_TIME_VERSION_KEY;


/**
 *  产品类型
 */

extern NSString * const PROJECT_TYPE_USERDEFAULTS_KEY;

/**
 *  是否启动用户体验计划KEY
 */
extern NSString * const SETTING_OPT_PLAN;

/**
 *  搜索历史缓存关键字
 */
extern NSString * const SEARCH_HISTORY_KEYWORD_KEY;

/**
 *  倒计时时间
 */
extern NSString * const PWD_SEND_CODE_DATE_KEY;

/**
 *  有效时间
 */
//extern NSString * const PWD_SEND_CODE_FAILURE_KEY;

/**
 *  注册验证码时间戳
 */
extern NSString * const CORRECT_VER_COUNT_KEY;

/**
 *  记录验证码开始有效时间
 */
//extern NSString * const CORRECT_FAILURE_CODE_KEY;

/**
 *  Touch ID 开关
 */
extern NSString * const TOUCH_ID_CACHE_KEY;



@interface FSUserDefaults : NSObject
/**
 *  通过指定名称获取缓存值
 *
 *  @param key 指定名称
 *
 *  @return 缓存值
 */
+(id)userDefaultsObjectForKey:(NSString *)key;
/**
 *  通过指定名称获取需要解压的缓存值
 *
 *  @param key          指定名称
 *  @param isUnarchiver 是否需要解压
 *
 *  @return 缓存值
 */
+(id)userDefaultsObjectForKey:(NSString *)key unarchiver:(BOOL)isUnarchiver;






/**
 *  把object缓存为指定key
 *
 *  @param object 要缓存的对象
 *  @param key    指定的名称
 */
+(void)userDefaultsSetObject:(id)object key:(NSString*)key;
/**
 *  把压缩的object缓存为指定key
 *
 *  @param object     要缓存的对象
 *  @param key        指定的名称
 *  @param isArchived 是否需要压缩
 */
+(void)userDefaultsSetObject:(id)object key:(NSString*)key archived:(BOOL)isArchived;






/**
 *  删除指定key的缓存
 *
 *  @param key 指定名称
 */
+(void)userDefaultsRemoveObjectForKey:(NSString *)key;




@end
