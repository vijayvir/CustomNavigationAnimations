

#import "AnimatorCenter.h"

@interface AnimatorCenter()

{
  
    AnimatorCenterType  animatorCentertype;
    FromType from;
}


@end
@implementation AnimatorCenter


- (id) initWithStartFrome: (FromType)fromType withAnimatorCenterType:(AnimatorCenterType)animationType{
    self = [super init];
    if( !self ) return nil;
    
    
   
    animatorCentertype = animationType;
    from = fromType;
    
    
    return self;
}





-(CGPoint)getCenterWithType:(FromType)fromValue center:(CGPoint)baseCenter
{
    CGPoint  center = baseCenter;
    
    
    switch (fromValue)
    {
        case LeftTop :
        {
            
           center=  CGPointMake(-baseCenter.x, -3*baseCenter.y);
            break;
        }
        case LeftCenter :
        {
            
          center=  CGPointMake(-baseCenter.x, baseCenter.y);
            break;
        }
        case LeftBottom :
        {
          center=  CGPointMake(-baseCenter.x, 3*baseCenter.y);
        break;
        }
            
        case CenterTop :
        {
            center=  CGPointMake(baseCenter.x, -3*baseCenter.y);
            break;
        }
        case CenterCenter :
        {
             center = baseCenter;
            break;
        }
        case CenterBottom :
        {
               center=  CGPointMake(baseCenter.x, 3*baseCenter.y);
            break;
        }
            
        case RightTop :
        {
           center=  CGPointMake(3*baseCenter.x, -3*baseCenter.y);
            break;
        }
        case RightCenter :
        {
                center=  CGPointMake(3*baseCenter.x, baseCenter.y);
            break;
        }
        case RightBottom :
        {
             center=  CGPointMake(3*baseCenter.x, 3*baseCenter.y);
            break;
        }
            
            
        default:
            break;
    }
    
    
    return center;
    
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
    
  
    if (animatorCentertype == AnimatorCenterType_Push){
        {
            
           CGPoint  center = CGPointMake(fromViewController.view.center.x, fromViewController.view.center.y);
            
            UIView * colorEffectViewTo = [[UIView alloc]initWithFrame:CGRectMake(-0, 0, toViewController.view.frame.size.width, toViewController.view.frame.size.height)];
            [[transitionContext containerView ]addSubview:colorEffectViewTo];
            colorEffectViewTo.backgroundColor =[UIColor colorWithPatternImage:[AnimatorCenter imageWithView:toViewController.view]];
            
            colorEffectViewTo.center= [self getCenterWithType:from center:center];
            
            
            
            CGPointMake(-center.x, toViewController.view.frame.size.height+center.y);
            
            toViewController.view.hidden =YES;
            
            fromViewController.view.alpha = 1;
            
            
            
            
            [[transitionContext containerView] addSubview:toViewController.view];
            [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^
             {
                 
                 
                colorEffectViewTo.center= [self getCenterWithType:from center:center];
                 CATransition *animation = [CATransition animation];
                 animation.type = kCATransitionPush;
                 
                 if (from==CenterCenter) {
                            animation.type = kCATransitionFade;
                 }
                 
                 
                 animation.subtype = kCATransitionFromTop;
                 animation.duration = 0.5;
                 fromViewController.view.alpha = .8;
                 [colorEffectViewTo.layer addAnimation:animation forKey:nil];
                 
                 
                 
                 
                 
                 
             } completion:^(BOOL finished) {
                 
                 
                 
                 
                 [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^
                  {
                      
                          colorEffectViewTo.center= [self getCenterWithType:CenterCenter center:center];
                      
                  } completion:^(BOOL finished) {
                      fromViewController.view.transform = CGAffineTransformIdentity;
                      fromViewController.view.alpha = 1;
                      toViewController.view.transform = CGAffineTransformIdentity;
                      toViewController.view.hidden =NO;
                      
                      
                      
                      
                      
                      colorEffectViewTo.hidden=YES;
                      [colorEffectViewTo removeFromSuperview];
                      [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                  }];
                 
                 
                 
                 
                 
                 
                 
                 
                 
             }];
        }
    }
    
    if (animatorCentertype == AnimatorCenterType_Pop)
    {
        
        UIView * colorEffectViewTo = [[UIView alloc]initWithFrame:CGRectMake(0, 0, toViewController.view.frame.size.width, toViewController.view.frame.size.height)];
        
        [[transitionContext containerView ]addSubview:colorEffectViewTo];
        
        colorEffectViewTo.backgroundColor =[UIColor colorWithPatternImage:[AnimatorCenter imageWithView:toViewController.view]];
        
      CGPoint  center = CGPointMake(fromViewController.view.center.x, fromViewController.view.center.y);
      
        
        
        UIView * colorEffectViewFrom = [[UIView alloc]initWithFrame:CGRectMake(0, 0, toViewController.view.frame.size.width, toViewController.view.frame.size.height)];
        
        [[transitionContext containerView ]addSubview:colorEffectViewFrom];
        
        colorEffectViewFrom.backgroundColor =[UIColor colorWithPatternImage:[AnimatorCenter imageWithView:fromViewController.view]];
        
        
        
        
        
        colorEffectViewFrom.center=  [self getCenterWithType:CenterCenter center:center];

        
        toViewController.view.hidden =NO;
        toViewController.view.alpha = 0;
        
        fromViewController.view.alpha = 0;
        
        [[transitionContext containerView] addSubview:toViewController.view];
        
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^
         {
             
             
             
             colorEffectViewFrom.center=  [self getCenterWithType:CenterCenter center:center];
             CATransition *animation = [CATransition animation];
             
             animation.type = kCATransitionPush;
             if (from==CenterCenter) {
                 animation.type = kCATransitionFade;
             }
             animation.subtype = kCATransitionFromBottom;
             animation.duration = 0.5;
             toViewController.view.alpha = 0;
             
             
             
             
             
             
         } completion:^(BOOL finished) {
             
             
             
             
             [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^
              {
                  colorEffectViewFrom.center=  [self getCenterWithType:from center:center];
            
                  
              } completion:^(BOOL finished) {
                  toViewController.view.transform = CGAffineTransformIdentity;
                  toViewController.view.alpha = 1;
                  
                  
                  fromViewController.view.transform = CGAffineTransformIdentity;
                  fromViewController.view.hidden =NO;
                  
                  
                  
                  
                  
                  colorEffectViewFrom.hidden=YES;
                  
                  [colorEffectViewFrom removeFromSuperview];
                  
                  colorEffectViewTo.hidden=YES;
                  [colorEffectViewTo removeFromSuperview];
                  [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
              }];
             
             
             
         }];
        
    }
}

@end
