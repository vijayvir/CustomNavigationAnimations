//
//  AnimationPop.h
//  EducationApp
//
//  Created by Avneet on 02/02/16.
//  Copyright (c) 2016 Avneet Singh. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>





@interface AnimatorCenter : NSObject<UIViewControllerAnimatedTransitioning>



typedef enum : int
{
    AnimatorCenterType_Push = 0 ,
    AnimatorCenterType_Pop = 1 ,
    
}
AnimatorCenterType;



- (id) initWithStartLoction: (CGRect)frame withAnimationCircularType:(AnimatorCenterType)animationCircularType;

@end
