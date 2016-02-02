//
//  Animator.m
//  NavigationTransitionTest
//
//  Created by Chris Eidhof on 9/27/13.
//  Copyright (c) 2013 Chris Eidhof. All rights reserved.
//

#import "Animator.h"
#import  "SecondViewController.h"
#import "ViewController.h"

@implementation Animator

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 1;
}
+ (UIImage *) imageWithView:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    
    
    CGRect rect = CGRectMake(0,0,320,568);
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
    
    
    
    if ([toViewController isKindOfClass:[SecondViewController class]])
        
    {
        UIButton * btn = [(ViewController*)fromViewController btn_navigate];
        toViewController.view.hidden =NO;
        fromViewController.view.alpha = 1;
        
        [[transitionContext containerView] addSubview:toViewController.view];
        
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^
        {
            
            fromViewController.view.alpha = 0;
            
            CGPoint  extremePoint = CGPointMake(600,600);
            double radius = sqrt((extremePoint.x*extremePoint.x) + (extremePoint.y*extremePoint.y));
            
            UIBezierPath *circleMaskPathFinal =  [UIBezierPath bezierPathWithOvalInRect:CGRectInset(btn.frame, -radius, -radius)];
            
            CAShapeLayer *maskLayer = [CAShapeLayer layer];
            maskLayer.path =circleMaskPathFinal.CGPath;
            toViewController.view.layer.mask = maskLayer;
            
            
            UIBezierPath * circleMaskPathInitial = [UIBezierPath bezierPathWithOvalInRect:btn.frame];
            
            CABasicAnimation *animastion =
            [CABasicAnimation animationWithKeyPath:@"path"];
            animastion.fromValue = (id)circleMaskPathInitial.CGPath;
            animastion.toValue = (id)circleMaskPathFinal.CGPath;
            [animastion setDuration:.5];
            animastion.delegate =self;
            
            [maskLayer addAnimation:animastion forKey:@"path"];
            
            CATransition *animation = [CATransition animation];
            
            animation.type = kCATransitionPush;
            animation.duration = .5;
            
            
            
            
            
            
            
        } completion:^(BOOL finished) {
            
            
            fromViewController.view.transform = CGAffineTransformIdentity;
            fromViewController.view.alpha = 1;
            toViewController.view.transform = CGAffineTransformIdentity;
            toViewController.view.hidden =NO;
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view.layer.mask =nil;
            
            
            
            
            
            // colorEffectViw = nil;
            
        }];
    }
    
    else if ([toViewController isKindOfClass:[ViewController class]])
    {
        
        
        UIButton * btn = [(SecondViewController*)fromViewController btn_second];
        fromViewController.view.hidden =NO;
        
        toViewController.view.alpha = 1;
        
        [[transitionContext containerView] addSubview:toViewController.view];
        
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^
        {
            
            // toViewController.view.alpha = 1;
            fromViewController.view.alpha = 0;
            CGPoint  extremePoint = CGPointMake(600,600);
            
            double radius = sqrt((extremePoint.x*extremePoint.x) + (extremePoint.y*extremePoint.y));
            
            UIBezierPath *circleMaskPathFinal =  [UIBezierPath bezierPathWithOvalInRect:CGRectInset(btn.frame, -radius,-radius)];
            
            CAShapeLayer *maskLayer = [CAShapeLayer layer];
            maskLayer.path =circleMaskPathFinal.CGPath;
            toViewController.view.layer.mask = maskLayer;
            
            
            UIBezierPath * circleMaskPathInitial = [UIBezierPath bezierPathWithOvalInRect:btn.frame];
            
            CABasicAnimation *animastion =
            [CABasicAnimation animationWithKeyPath:@"path"];
            animastion.fromValue = (id)circleMaskPathInitial.CGPath;
            animastion.toValue = (id)circleMaskPathFinal.CGPath;
            [animastion setDuration:.5];
            animastion.delegate =self;
            
            [maskLayer addAnimation:animastion forKey:@"path"];
            
            
            
            
            
            
            
            
            
        } completion:^(BOOL finished) {
            
            
            toViewController.view.transform = CGAffineTransformIdentity;
            toViewController.view.alpha = 1;
            
            fromViewController.view.transform = CGAffineTransformIdentity;
            fromViewController.view.hidden =NO;
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view.layer.mask =nil;
            
            
            
            
            
            // colorEffectViw = nil;
            
        }];
        
        
        
        
        
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
}

@end
