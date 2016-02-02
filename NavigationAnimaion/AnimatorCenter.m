//
//  AnimationPop.m
//  EducationApp
//
//  Created by Avneet on 02/02/16.
//  Copyright (c) 2016 Avneet Singh. All rights reserved.
//

#import "AnimatorCenter.h"

@interface AnimatorCenter()

{
    CGRect framePushPop;
    AnimatorCenterType  animatorCentertype;
    
}


@end
@implementation AnimatorCenter






- (id) initWithStartLoction: (CGRect)frame withAnimationCircularType:(AnimatorCenterType)animationType{
    
    self = [super init];
    if( !self ) return nil;
    
    
    framePushPop = frame;
    animatorCentertype = animationType;
    
    
    
    return self;
    
}
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
    
    if (animatorCentertype == AnimatorCenterType_Pop)
    {
        
        UIView * colorEffectwViw = [[UIView alloc]initWithFrame:CGRectMake(0, 0, toViewController.view.frame.size.width, toViewController.view.frame.size.height)];
        
        [[transitionContext containerView ]addSubview:colorEffectwViw];
        
        colorEffectwViw.backgroundColor =[UIColor colorWithPatternImage:[AnimatorCenter imageWithView:toViewController.view]];
        
        CGPoint  center = CGPointMake(fromViewController.view.center.x, fromViewController.view.center.y);
        
        UIView * colorEffectViw = [[UIView alloc]initWithFrame:CGRectMake(0, 0, toViewController.view.frame.size.width, toViewController.view.frame.size.height)];
        
        [[transitionContext containerView ]addSubview:colorEffectViw];
        
        colorEffectViw.backgroundColor =[UIColor colorWithPatternImage:[AnimatorCenter imageWithView:fromViewController.view]];
        
        
        
        
        
        colorEffectViw.center= CGPointMake(center.x, center.y);
        
        toViewController.view.hidden =NO;
        toViewController.view.alpha = 0;
        
        fromViewController.view.alpha = 0;
        
        [[transitionContext containerView] addSubview:toViewController.view];
        
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^
         {
             
             
             
             colorEffectViw.center= CGPointMake(center.x, center.y);
             CATransition *animation = [CATransition animation];
             
             animation.type = kCATransitionPush;
             
             animation.subtype = kCATransitionFromBottom;
             animation.duration = 0.5;
             toViewController.view.alpha = 0;
             
             
             
             
             
             
         } completion:^(BOOL finished) {
             
             
             
             
             [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^
              {
                  
                  colorEffectViw.center= CGPointMake(-center.x, fromViewController.view.frame.size.height+center.y);
                  
              } completion:^(BOOL finished) {
                  toViewController.view.transform = CGAffineTransformIdentity;
                  toViewController.view.alpha = 1;
                  
                  
                  fromViewController.view.transform = CGAffineTransformIdentity;
                  fromViewController.view.hidden =NO;
                  
                  
                  
                  
                  
                  colorEffectViw.hidden=YES;
                  
                  [colorEffectViw removeFromSuperview];
                  
                  colorEffectwViw.hidden=YES;
                  [colorEffectwViw removeFromSuperview];
                  [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
              }];
             
             
             
         }];
        
    }
    if (animatorCentertype == AnimatorCenterType_Push){
        {
            
            
            CGPoint  center = CGPointMake(toViewController.view.center.x, toViewController.view.center.y);
            
            UIView * colorEffectViw = [[UIView alloc]initWithFrame:CGRectMake(-0, 0, toViewController.view.frame.size.width, toViewController.view.frame.size.height)];
            [[transitionContext containerView ]addSubview:colorEffectViw];
            colorEffectViw.backgroundColor =[UIColor colorWithPatternImage:[AnimatorCenter imageWithView:toViewController.view]];
            
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
}

@end