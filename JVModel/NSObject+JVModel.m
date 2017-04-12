//
//  NSObject+JVModel.m
//  JVModel
//
//  Created by JarvanZhang on 2017/4/12.
//  Copyright © 2017年 JarvanZhang. All rights reserved.
//

#import "NSObject+JVModel.h"
#import <objc/objc-runtime.h>

@implementation NSObject (JVModel)

+(instancetype)JV_modelWithJSON:(NSDictionary *)dict{

    id objc = [[self alloc] init];
    unsigned int count;
    //获取属性列表
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    for (int i = 0; i < count; i++) {
        /*获取属性名称
         */
        objc_property_t property = properties[i];
        const char *propertyCString = property_getName(property);
        NSString *propertyName = [NSString stringWithCString:propertyCString encoding:NSUTF8StringEncoding];
        // 根据成员属性名去字典中查找对应的value
        id value = dict[propertyName];
        // 如果模型中还有字典，也需要把对应的字典转换成模型
        // 判断下value是否是字典
        if ([value isKindOfClass:[NSDictionary class]]) {
         //如果是字典的话把propertyName首字母大写作为Model的名称去检查  --YYModel 是这样默认去做的
            NSString *newKey=[propertyName capitalizedString];
            // 根据字符串类名生成类对象
            Class modelClass = NSClassFromString(newKey);
            if (modelClass) { // 有对应的模型才需要转
                // 把字典转模型 递归调用
                value  =  [modelClass JV_modelWithJSON:value];
            }
        }
        
        //NSArray中也是字典，把数组中的字典转换成模型.
        // 判断值是否是数组
        if ([value isKindOfClass:[NSArray class]]) {
            // 判断对应类有没有实现字典数组转模型数组的协议
            if ([self respondsToSelector:@selector(modelContainerPropertyGenericClass)]) {
                // 获取数组中字典对应的模型
                Class classModel =[(id<JVModel>)[self class] modelContainerPropertyGenericClass][propertyName];
                // 遍历字典数组，生成模型数组
                NSMutableArray *arrM = [NSMutableArray array];
                for (NSDictionary *dict in value) {
                    // 字典转模型递归调用
                    id model =  [classModel JV_modelWithJSON:dict];
                    [arrM addObject:model];
                }
                // 把模型数组赋值给value
                value = arrM;
            }
        }
        // 利用KVC给模型中的属性赋值
        if (value) {
            [objc setValue:value forKey:propertyName];
        }
    }
    return objc;
}
@end
