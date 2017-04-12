//
//  ViewController.m
//  JVModel
//
//  Created by JarvanZhang on 2017/4/12.
//  Copyright © 2017年 JarvanZhang. All rights reserved.
//

#import "ViewController.h"
#import "Book.h"
#import "NSObject+JVModel.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"testJson" ofType:@"plist"];
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    
    Book *bk=[Book JV_modelWithJSON:data];
    
    NSLog(@"我们访问深度最深的属性Book->CatalogueModel->Test.attribute : %@",bk.catalogue[0].testArray[0].attribute);
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
