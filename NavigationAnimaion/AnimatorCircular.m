
#import "AnimatorCircular.h"
@interface AnimatorCircular()

{
    CGRect framePushPop;
    AnimationCircularType  animationCircularType;

}




@end
@implementation AnimatorCircular

/* Start Location of Animator  */
- (id) initWithStartLoction: (CGRect)frame withAnimationCircularType:(AnimationCircularType)animationType {
    
    self = [super init];
    if( !self ) return nil;
    
    
    framePushPop = frame;
    animationCircularType = animationType;
    
    
    
    return self;
}

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
    
    
    
    CGRect rect = CGRectMake(0,0,view.frame.size.width,view.frame.size.height);
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
    
    
    
    
    if (animationCircularType==AnimationCircularType_Push)
    {
        

            
        {
            
            toViewController.view.hidden =NO;
            fromViewController.view.alpha = 1;
            
            [[transitionContext containerView] addSubview:toViewController.view];
            
            
            [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^
             {
                 
                 fromViewController.view.alpha = 0;
                 
                 CGPoint  extremePoint = CGPointMake(600,600);
                 double radius = sqrt((extremePoint.x*extremePoint.x) + (extremePoint.y*extremePoint.y));
                 
                 UIBezierPath *circleMaskPathFinal =  [UIBezierPath bezierPathWithOvalInRect:CGRectInset(framePushPop, -radius, -radius)];
                 
                 CAShapeLayer *maskLayer = [CAShapeLayer layer];
                 maskLayer.path =circleMaskPathFinal.CGPath;
                 toViewController.view.layer.mask = maskLayer;
                 
                 
                 UIBezierPath * circleMaskPathInitial = [UIBezierPath bezierPathWithOvalInRect:framePushPop];
                 
                 CABasicAnimation *animastion =
                 [CABasicAnimation animationWithKeyPath:@"path"];
                 animastion.fromValue = (id)circleMaskPathInitial.CGPath;
                 animastion.toValue = (id)circleMaskPathFinal.CGPath;
                 [animastion setDuration:1];
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
                 
                 
                 
                 
                 
       
                 
             }];
        }
    }
    if (animationCircularType == AnimationCircularType_Pop)
    {
     
        {
            
            
                       fromViewController.view.hidden =NO;
            
            toViewController.view.alpha = 1;
            
            [[transitionContext containerView] addSubview:toViewController.view];
            
            
            [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^
             {
                 
         
                 fromViewController.view.alpha = 0;
                 CGPoint  extremePoint = CGPointMake(600,600);
                 
                 double radius = sqrt((extremePoint.x*extremePoint.x) + (extremePoint.y*extremePoint.y));
                 
                 UIBezierPath *circleMaskPathFinal =  [UIBezierPath bezierPathWithOvalInRect:CGRectInset(framePushPop, -radius,-radius)];
                 
                 CAShapeLayer *maskLayer = [CAShapeLayer layer];
                 maskLayer.path =circleMaskPathFinal.CGPath;
                 toViewController.view.layer.mask = maskLayer;
                 
                 
                 UIBezierPath * circleMaskPathInitial = [UIBezierPath bezierPathWithOvalInRect:framePushPop];
                 
                 CABasicAnimation *animastion =
                 [CABasicAnimation animationWithKeyPath:@"path"];
                 animastion.fromValue = (id)circleMaskPathInitial.CGPath;
                 animastion.toValue = (id)circleMaskPathFinal.CGPath;
                 [animastion setDuration:1];
                 animastion.delegate =self;
                 
                 [maskLayer addAnimation:animastion forKey:@"path"];
                 
                 
                 
                 
                 
                 
                 
                 
                 
             } completion:^(BOOL finished) {
                 
                 
                 toViewController.view.transform = CGAffineTransformIdentity;
                 toViewController.view.alpha = 1;
                 
                 fromViewController.view.transform = CGAffineTransformIdentity;
                 fromViewController.view.hidden =NO;
                 [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                 [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view.layer.mask =nil;
                 
                 
                 
                 
                 
             }];
            
            
            
            
            
            
            
            
            
            
        }
    }
    
    

    
    
    
    
    
    
    
    
}

@end
