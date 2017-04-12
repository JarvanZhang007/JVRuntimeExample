//
//  TestViewController.m
//  RuntimeExample
//
//  Created by JarvanZhang on 2017/4/6.
//  Copyright © 2017年 JarvanZhang. All rights reserved.
//

#import "TestViewController.h"
#import "TestObject+addTest.h"
@interface TestViewController ()
@property(strong,nonatomic)TestObject *test;
@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.test=[[TestObject alloc]init];
    self.test.firstStr=@"1111";
    self.test.secondStr=@"2222";
    
}


-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    NSLog(@"TestObject property firstStr=%@ ,secondStr=%@",self.test.firstStr,self.test.secondStr);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
