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

#define NUM_INIT 40 // temp value, can change later
#define INFECTED_INIT 3 // temp, can add for different levels etc...
#define X_DIM   480
#define Y_DIM   320
#define THRESHOLD 20// temp val
#define CK_RAD 45 // temp


@interface TC_Game : NSObject {
    
    
    NSMutableArray *cells;
    NSMutableArray *cur_infected;
    int num_infected;
    int num_remaining;
    
}

- (void) kill_cell: (Cell *) cell;
// update remaining
// release cell
// if infected subtract from num_infected

- (void) spread_infection: (Cell *) cell;



- (NSMutableArray *) cells_near_point: (CGPoint) p; // dist=45

@property (nonatomic, retain) NSMutableArray *cells;
@property (nonatomic, retain) NSMutableArray *cur_infected;
@property (nonatomic) int num_infected;
@property (nonatomic) int num_remaining;

@end
