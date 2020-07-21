//
//  DrumModel.m
//  seq
//
//  Created by John Boyd on 5/3/14.
//  Copyright (c) 2014 John Boyd. All rights reserved.
//

#import "DrumModel.h"

@implementation DrumModel {
    NSInteger _togglestate[16][12];
}

static DrumModel *singletonInstance;

+ (DrumModel*)getInstance{
    if (singletonInstance == nil) {
        singletonInstance = [[super alloc] init];
    }
    return singletonInstance;
}


- (BOOL) isOnAtIndex: (NSInteger) col :(NSInteger) row {
    if (_togglestate[col][row] == 1) {
        return TRUE;
    } else {
        return FALSE;
    }
}
    
- (void) SetOnOFF: (NSInteger) col :(NSInteger) row {
    if (_togglestate[col][row] == 0) {
            _togglestate[col][row] = 1;
    } else {
            _togglestate[col][row] = 0;
    }
}
    

@end

