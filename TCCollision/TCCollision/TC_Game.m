//
//  TC_Game.m
//  TCCollision
//
//  Created by Daniel Feltey on 5/15/11.
//  Copyright 2011 University of Chicago. All rights reserved.
//

#import "TC_Game.h"


@implementation TC_Game

@synthesize cells, num_infected, num_remaining;


- (id) init
{
    
    self.num_remaining = NUM_INIT;
    self.num_infected = INFECTED_INIT;
    
    // initialize array of cells
    self.cells = [[NSMutableArray alloc] init]; 
    
    // populate the array with cells
    for (int i = 0; i<NUM_INIT; i++) {
        Cell *cell = [[Cell alloc] init];
        [self.cells addObject:cell];
    }
    
    // position the cells randomly based on RADIUS value
    // iterate through the array 
    // give the current indexed cell an initial position
    // then check to see whether this is too close to a previously 
    // placed cell
    // if so attempt to place it somewhere else and repeat the process
    // to make sure it doesn't overlap ...
    
    for (int i = 0; i<NUM_INIT; i++) {
        Cell *current = [self.cells objectAtIndex:i];
        int xpos = arc4random()%X_DIM;
        int ypos = arc4random()%Y_DIM;
        current.bind_pos = ccp(xpos, ypos);
        
        int k = 0;
        
        while (k<i) {
            if ([current distance_from_cell:[self.cells objectAtIndex:k]] < (2*RADIUS)) {
                xpos = arc4random()%X_DIM;
                ypos = arc4random()%Y_DIM;
                current.bind_pos = ccp(xpos, ypos);
                k = 0;
            }
            else    {
                k++;
            }
        }
        
    }
    
    // randomly assign INFECTED_INIT cells to be initially infected
    // by picking cells at random and infeting them until enough are infected
    
    int j = 0;
    
    while (j < self.num_infected) {
        
        Cell * current = [self.cells objectAtIndex:arc4random()%self.num_remaining];
        
        if ( !(current.infected)) {
            current.infected = YES;
            j++;
        }
    }
    
    return self;
}


- (BOOL) cell_in_threshold:(CGPoint)p
{
    BOOL val = NO;
    
    for (int i =0; i<self.num_remaining; i++) {
        Cell *cur = [self.cells objectAtIndex:i];
        float distance = sqrtf(powf(cur.bind_pos.x-p.x,2)+powf(cur.bind_pos.y-p.y,2));
        
        if (distance <= THRESHOLD) {
            val = YES;
            break;
        }
    }
    
    return val;
}
/*
- (id) nearest_cell:(CGPoint)p
{
    for (int i = 0; i< self.num_remaining; i++) {
        Cell *cur = [self.cells objectAtIndex:i];
        float distance = sqrtf(powf(cur.bind_pos.x-p.x,2)+powf(cur.bind_pos.y-p.y,2));
        
        if (distance <= THRESHOLD) {
            <#statements#>
        }
        
    }
}*/
// Above is basic idea to return the nearest cell to a touch
// iterate through all cells in game
// return the last(/first?) nearest one














// dealloc


@end
