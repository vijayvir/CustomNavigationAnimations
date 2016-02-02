//
//  Animator.m
//  NavigationTransitionTest
//
//  Created by Chris Eidhof on 9/27/13.
//  Copyright (c) 2013 Chris Eidhof. All rights reserved.
//

#import "Animator.h"


@implementation Animator

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return .5;
}
+ (UIImage *) imageWithView:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    
    
    CGRect rect = CGRectMake(0,0, view.frame.size.width, view.frame.size.height);
    UIGraphicsBeginImageContext( rect.size );
    [img drawInRect:rect];
    UIImage *picture1 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    NSData *imageData = UIImagePNGRepresentation(picture1);
    UIImage *imgq=[UIImage imageWithData:imageData];
    
    return imgq;
}
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    
    
 
        
    {
        
        
        CGPoint  center = CGPointMake(toViewController.view.center.x, toViewController.view.center.y);
        
        UIView * colorEffectViw = [[UIView alloc]initWithFrame:CGRectMake(-0, 0, toViewController.view.frame.size.width, toViewController.view.frame.size.height)];
        [[transitionContext containerView ]addSubview:colorEffectViw];
        colorEffectViw.backgroundColor =[UIColor colorWithPatternImage:[Animator imageWithView:toViewController.view]];
        
        colorEffectViw.center= CGPointMake(-center.x, toViewController.view.frame.size.height+center.y);
        
        toViewController.view.hidden =YES;
        
        fromViewController.view.alpha = 1;
        
        
    
        
        [[transitionContext containerView] addSubview:toViewController.view];
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^
        {

            
            colorEffectViw.center= CGPointMake(-center.x, toViewController.view.frame.size.height+center.y-20);
            CATransition *animation = [CATransition animation];
            
            animation.type = kCATransitionPush;
            
            animation.subtype = kCATransitionFromTop;
            animation.duration = 0.5;
            fromViewController.view.alpha = .8;
            [colorEffectViw.layer addAnimation:animation forKey:nil];
            
            
            
            
            
            
        } completion:^(BOOL finished) {
            
            
            
            
            [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^
            {
                
                colorEffectViw.center= CGPointMake(center.x, center.y);
               
            } completion:^(BOOL finished) {
                fromViewController.view.transform = CGAffineTransformIdentity;
                fromViewController.view.alpha = 1;
                toViewController.view.transform = CGAffineTransformIdentity;
                toViewController.view.hidden =NO;
                
                
                
                
                
                colorEffectViw.hidden=YES;
                [colorEffectViw removeFromSuperview];
                [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            }];
            
            
            
            
            
            
            
    
            
        }];
    }
    
   
    
    
    
    
    
    
    
}

@end
