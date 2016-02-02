//
//  AnimationPushCircular.h
//  NavigationAnimaion
//
//  Created by OSX on 02/02/16.
//  Copyright (c) 2016 Vijayvir. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>



typedef enum : int
{
    AnimationCircularType_Push = 0 ,
    AnimationCircularType_Pop = 1 ,
    
}
AnimationCircularType;





@interface AnimatorCircular : NSObject<UIViewControllerAnimatedTransitioning>

/* Start Location of Animator
 
 
 
 */
- (id) initWithStartLoction: (CGRect)frame withAnimationCircularType:(AnimationCircularType)animationCircularType ;


@end
