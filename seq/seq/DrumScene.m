//
//  DrumScene.m
//  seq
//
//  Created by John Boyd on 4/25/14.
//  Copyright (c) 2014 John Boyd. All rights reserved.
//

#import "DrumScene.h"
#import "DrumModel.h"


@interface DrumScene ()

@property BOOL initialized;


@end

@implementation DrumScene {
    NSMutableArray *_samples;
    SKAction *_preload[12];
}



-(void) didMoveToView:(SKView *)view {
    if(!self.initialized){
        
        _samples = [NSMutableArray arrayWithArray: @[@"drum0.caf", @"drum1.caf", @"drum2.caf", @"drum3.caf", @"drum4.caf", @"drum5.caf", @"drum6.caf", @"drum7.caf", @"drum8.caf", @"drum9.caf", @"drum10.caf", @"drum11.caf"]];
        
        for (int n=0; n<12; n++){
            _preload[n] = [SKAction playSoundFileNamed:_samples[n] waitForCompletion:NO];
        }
        
        for (int i=0; i<12; i++){
            for (int j=0; j<16; j++){
                [self createCirc: CGPointMake(j*26+13, i*26+13): @"OFF" ];
            }
        }
        
        [self createLine: CGPointMake(0,152)];
        self.lastUpdate = -1;
        self.xVelocity = 100;
        
        self.slider = [[UISlider alloc] init];
        [self.slider setBackgroundColor:[UIColor clearColor]];
        [self.slider setCenter:CGPointMake(self.size.width-30, self.size.height/2)];
        //self.slider.value = .5;
        self.slider.minimumValue = 0;
        self.slider.maximumValue = 800;
        self.slider.continuous = YES;
        self.slider.transform = CGAffineTransformRotate(CGAffineTransformIdentity, 270*M_PI/180);
        [self.view addSubview:self.slider];
        
        self.initialized = YES;
        
        
    }
}


-(void) createCirc: (CGPoint) coord :(NSString*) status {
    SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed: status];
    sprite.name = @"sprite";
    sprite.zPosition = 1;
    sprite.position = coord;
    sprite.size = CGSizeMake(26, 26);
    [self addChild:sprite];
}

-(void) createLine: (CGPoint) col {
    self.strobe = [[SKSpriteNode alloc] initWithColor: [UIColor orangeColor] size: CGSizeMake( 1, self.frame.size.height )];
    
    self.strobe.name = @"strobe";
    self.strobe.zPosition = 2;
    self.strobe.position = col;
    
    [self addChild:self.strobe];
}

- (IBAction)sliderValueChanged:(UISlider *)sender {
    [self.view setNeedsDisplay];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    DrumModel* singleton = [DrumModel getInstance];
    for (UITouch *touch in touches) {
        CGPoint touchLocation = [touch locationInNode:self];
        int i = touchLocation.y/26;
        int j = touchLocation.x/26;
        if (i < 12 && j < 16) {
            if ([singleton isOnAtIndex: j : i ]){
                [self createCirc: CGPointMake(j*26+13, i*26+13): @"OFF" ];
                [singleton SetOnOFF: j : i ];
            } else {
                [self createCirc: CGPointMake(j*26+13, i*26+13): @"ON" ];
                [singleton SetOnOFF: j : i ];
            }
        }

    }
}



- (void) update:(NSTimeInterval)currentTime {
    [super update: currentTime];
    NSInteger newX;
    CGFloat elapsedTime;
    
    CGPoint p = self.strobe.position;
    
    if(self.lastUpdate < 0 ) {
        self.lastUpdate = currentTime;
    }
    
    
    // Update the position...
    DrumModel* singleton = [DrumModel getInstance];
    
    
    self.xVelocity = self.slider.value;
    
    elapsedTime = currentTime - self.lastUpdate;
    self.lastUpdate = currentTime;
    NSInteger dx = elapsedTime * self.xVelocity;
    newX = (NSInteger) (p.x + dx) % 415 / 26;
    
    // play sounds in here
    if ((newX-(NSInteger)(p.x / 26)) != 0){
        for (int y=0; y<12 ;y++ ){
            if ([singleton isOnAtIndex: newX : y ]){
                // play sound
                [self runAction:_preload[y]];
            }
        }
    }
    self.strobe.position = CGPointMake((NSInteger) (p.x + dx) % 415, 152);
    
    
}
    


@end
