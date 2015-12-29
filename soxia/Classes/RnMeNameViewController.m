//
//  RnMeNameViewController.m
//  soxia
//
//  Created by ningning on 15/12/29.
//  Copyright © 2015年 ningning. All rights reserved.
//

#import "RnMeNameViewController.h"

@interface RnMeNameViewController ()

@end

@implementation RnMeNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        NSUserDefaults *defult = [NSUserDefaults standardUserDefaults];
    self.nameFeild.text = [defult objectForKey:@"name"];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(closeContent)];
    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(saveContent)];
    self.navigationItem.rightBarButtonItem.enabled = NO;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.nameFeild];
}

- (void)closeContent{

    [self.navigationController popViewControllerAnimated:YES];

}
- (void)saveContent{
    NSUserDefaults *defult = [NSUserDefaults standardUserDefaults];
    [defult setObject:self.nameFeild.text forKey:@"name"];
    [defult synchronize];
[self.navigationController popViewControllerAnimated:YES];

}

- (void)textChange{

    self.navigationItem.rightBarButtonItem.enabled = YES;

}



@end
