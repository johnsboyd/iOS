//
//  DrumScene.h
//  seq
//
//  Created by John Boyd on 4/25/14.
//  Copyright (c) 2014 John Boyd. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "ViewController.h"
#import "DrumModel.h"


@interface DrumScene : SKScene

@property (nonatomic,strong) SKSpriteNode *strobe;
@property (nonatomic,strong) SKSpriteNode *sprite;
@property (nonatomic,strong) IBOutlet UISlider *slider;
@property NSTimeInterval lastUpdate;
@property CGFloat xVelocity;
@property NSInteger lastX;
- (IBAction)sliderValueChanged:(UISlider *)sender;

@end
