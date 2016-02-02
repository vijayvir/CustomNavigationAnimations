//
//  ViewController.m
//  NavigationAnimaion
//
//  Created by OSX on 29/01/16.
//  Copyright (c) 2016 Vijayvir. All rights reserved.
//

#import "ViewController.h"
#import  "SecondViewController.h"
#import "Animator.h"
#import "AnimationPop.h"
@interface ViewController ()<UINavigationControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.delegate = self;
    
    
    
    
    
    
    
    
    
    
   
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UINavigationControllerDelegate

- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC
{
    
    if (([toVC isKindOfClass:[SecondViewController class]] &&  [fromVC isKindOfClass:[ViewController class]]) || ([toVC isKindOfClass:[ViewController class]] &&  [fromVC isKindOfClass:[SecondViewController class]] ) )
    {
        switch(operation)
        {
            case UINavigationControllerOperationPush:
                return [[Animator alloc] init];
            case UINavigationControllerOperationPop:
                return [[AnimationPop alloc] init];
            default:
                return nil;
        }
    }
    
 
    
    return nil;
}
@end
