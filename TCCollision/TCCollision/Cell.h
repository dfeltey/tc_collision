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

#define RADIUS 22// just a placeholder value can be changed later


@interface Cell : NSObject {
    
    
    BOOL infected;
    BOOL emitted;
    int infection_prob; // random number between 0-2
    CGPoint bind_pos;
    CGPoint dest_pos; // rename to dest 
    float replication_time; // 5 - 15 seconds 
   // CCSprite *cell_sprite;
    // possibly need to add a var to tell whether a cell is dead and should not be displayed
    
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
@property (nonatomic) CGPoint dest_pos;
@property (nonatomic) float replication_time;
//@property (nonatomic, retain) CCSprite *cell_sprite;

@end
