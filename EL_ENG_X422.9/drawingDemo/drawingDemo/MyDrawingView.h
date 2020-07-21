//
//  MyDrawingView.h
//  navAndViews
//
//  Created by David Rowland on 7/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
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
