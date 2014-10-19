//
//  DrumModel.h
//  seq
//
//  Created by John Boyd on 5/3/14.
//  Copyright (c) 2014 John Boyd. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "DrumScene.h"

@interface DrumModel : NSObject{
}

+(DrumModel*) getInstance;

- (BOOL) isOnAtIndex: (NSInteger) col :(NSInteger) row;
- (void) SetOnOFF: (NSInteger) col :(NSInteger) row;

@end
