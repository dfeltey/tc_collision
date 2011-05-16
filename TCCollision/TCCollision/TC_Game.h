//
//  TC_Game.h
//  TCCollision
//
//  Created by Daniel Feltey on 5/15/11.
//  Copyright 2011 University of Chicago. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import <math.h>
#import "Cell.h"

#define NUM_INIT 70 // temp value, can change later
#define INFECTED_INIT 3 // temp, can add for different levels etc...
#define X_DIM   480
#define Y_DIM   320


@interface TC_Game : NSObject {
    
    
    NSMutableArray *cells;
    int num_infected;
    int num_remaining;
    
}

@property (nonatomic, retain) NSMutableArray *cells;
@property (nonatomic) int num_infected;
@property (nonatomic) int num_remaining;

@end
