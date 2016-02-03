//
//  ViewController.m
//  NavigationAnimaion
//
//  Created by OSX on 29/01/16.
//  Copyright (c) 2016 Vijayvir. All rights reserved.
//

#import "ViewController.h"
#import  "SecondViewController.h"
#import "FourthViewController.h"


#import "AnimatorCircular.h"
#import "AnimatorCenter.h"
@interface ViewController ()<UINavigationControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Add this Line
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
                return [[AnimatorCircular alloc] initWithStartLoction:_btn_navigate.frame withAnimationCircularType:AnimationCircularType_Push];
            case UINavigationControllerOperationPop:
                
            {
                 UIButton * btn = [(SecondViewController*)fromVC btn_second];
                
                return [[AnimatorCircular alloc] initWithStartLoction:btn.frame withAnimationCircularType:AnimationCircularType_Pop];
            }
            
            default:
                return nil;
        }
    }
    else  if (([toVC isKindOfClass:[FourthViewController class]] &&  [fromVC isKindOfClass:[ViewController class]]) || ([toVC isKindOfClass:[ViewController class]] &&  [fromVC isKindOfClass:[FourthViewController class]] ) )
    {
        switch(operation)
        {
            case UINavigationControllerOperationPush:
                return [[AnimatorCenter alloc] initWithStartFrome:LeftBottom withAnimatorCenterType:AnimatorCenterType_Push];
            case UINavigationControllerOperationPop:
                
            {
         
                return [[AnimatorCenter alloc] initWithStartFrome:LeftBottom withAnimatorCenterType:AnimatorCenterType_Pop];
            }
                
            default:
                return nil;
        }
    }
 
    
    return nil;
}
@end
