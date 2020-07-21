//
//  ViewController.m
//  seq
//
//  Created by John Boyd on 4/25/14.
//  Copyright (c) 2014 John Boyd. All rights reserved.
//

#import "ViewController.h"
#import "DrumScene.h"
#import "DrumModel.h"

@implementation ViewController{
}


- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];

    // Configure the view.
   
    self.skview.showsFPS = NO;
    self.skview.showsNodeCount = NO;
    
    // Create and configure the scene.
    SKScene *scene = [DrumScene sceneWithSize:self.skview.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    // Present the scene.
    [self.skview presentScene:scene];
    
    }

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}






@end
