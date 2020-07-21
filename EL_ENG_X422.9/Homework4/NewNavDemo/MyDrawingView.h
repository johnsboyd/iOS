//
//  MyDrawingView.h
//  navAndViews
//
//  Created by John Boyd
//  Copyright 2015 All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>


@interface MyDrawingView : UIView
{
    UIButton* button;
    CAShapeLayer *shapeLayer;  //used for certain animations
}

@property (nonatomic, strong)UIButton* button;

-(void)buttonHit:(id)sender;


@end
