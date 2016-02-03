

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>





@interface AnimatorCenter : NSObject<UIViewControllerAnimatedTransitioning>



typedef enum : int
{
    AnimatorCenterType_Push = 0 ,
    AnimatorCenterType_Pop = 1 ,
    
}
AnimatorCenterType;
typedef enum : int
{
    LeftTop = 0 ,
    LeftCenter  = 1 ,
    LeftBottom = 2 ,
    
    CenterTop = 3 ,
    CenterCenter = 4 ,
    CenterBottom = 5 ,
    
    RightTop = 6 ,
    RightCenter  = 7 ,
    RightBottom = 8 ,
    
}
FromType;

- (id) initWithStartFrome: (FromType)from withAnimatorCenterType:(AnimatorCenterType)animationType;



@end
