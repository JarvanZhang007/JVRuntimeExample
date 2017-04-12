//
//  TestObject+addTest.m
//  RuntimeExample
//
//  Created by JarvanZhang on 2017/4/6.
//  Copyright © 2017年 JarvanZhang. All rights reserved.
//

#import "TestObject+addTest.h"
//引入头文件
#import <objc/objc-runtime.h>
@implementation TestObject (addTest)

//自定义Key
static const char secondStrKey = '\0';

//set方法
-(void)setSecondStr:(NSString *)secondStr{
    /*
     第一个参数 对谁添加 属性
     第二个参数 指定的key
     第三个参数 传入的value
     第四个参数 property 内存管理的关键字 
     */
    objc_setAssociatedObject(self, &secondStrKey,
                             secondStr, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
//get方法
-(NSString *)secondStr{
    /*通过runtime获取 属性*/
    return objc_getAssociatedObject(self, &secondStrKey);
    
}

@end
