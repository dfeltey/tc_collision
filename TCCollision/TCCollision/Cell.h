//
//  Cell.h
//  TCCollision
//
//  Created by Daniel Feltey on 5/12/11.
//  Copyright 2011 University of Chicago. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import <math.h>

#define RADIUS 20 // just a placeholder value can be changed later


@interface Cell : NSObject {
    
    
    BOOL infected;
    BOOL emitted;
    int infection_prob; // random number between 0-2
    CGPoint bind_pos;
    CGPoint cur_pos;
    int replication_time; // 5 - 15 seconds 
    CCSprite *cell_sprite;
    
}
-(float) distance_from_cell: (Cell *) cell;
// calculate the distance between two cells

- (void) emit_virions: (NSMutableArray *) cells;
// iterate through an array of all cells in the game
// and 

- (void) cell_motion;


@property (nonatomic) BOOL infected;
@property (nonatomic) BOOL emitted;
@property (nonatomic) int infection_prob;
@property (nonatomic) CGPoint bind_pos;
@property (nonatomic) CGPoint cur_pos;
@property (nonatomic) int replication_time;
@property (nonatomic, retain) CCSprite *cell_sprite;

@end
