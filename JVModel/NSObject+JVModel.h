//
//  NSObject+JVModel.h
//  JVModel
//
//  Created by JarvanZhang on 2017/4/12.
//  Copyright © 2017年 JarvanZhang. All rights reserved.
//

#import <Foundation/Foundation.h>

//指定Array 里面Item的类型 Model
@protocol JVModel <NSObject>
@optional
+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass;
@end


@interface NSObject (JVModel)

+(instancetype _Nullable )JV_modelWithJSON:(NSDictionary *_Nullable)dict;

@end
