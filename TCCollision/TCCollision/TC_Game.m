//
//  TC_Game.m
//  TCCollision
//
//  Created by Daniel Feltey on 5/15/11.
//  Copyright 2011 University of Chicago. All rights reserved.
//

#import "TC_Game.h"


@implementation TC_Game

@synthesize cells, num_infected, num_remaining, cur_infected;


- (id) init
{
    self = [super init];
    if (self) {
    
    
    self.num_remaining = NUM_INIT;
    self.num_infected = INFECTED_INIT;
    self.cur_infected = [[NSMutableArray alloc] init];
    
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
            current.emitted = NO;
            current.replication_time = (arc4random()%11+5);
            [cur_infected addObject:current];
            j++;
        }
    }
    }
    
    return self;
}


- (NSMutableArray *) cells_near_point:(CGPoint)p
{
    
    NSMutableArray *near_cells = [[NSMutableArray alloc] init ];
    
    
    for (Cell *cell in self.cells)
    {
        float distance;
        float x = p.x - cell.bind_pos.x;
        float y = p.y - cell.bind_pos.y;
        distance = sqrtf(powf(x, 2)+powf(y, 2));
        
        if (distance <= CK_RAD ) {
            [near_cells addObject:cell];
        }
        
    }
    [near_cells autorelease];
    return near_cells;
}

- (void) kill_cell:(Cell *)cell
{
    self.num_remaining--;
    if (cell.infected) {
        self.num_infected--;
        if (!cell.emitted) {
            [self.cur_infected removeObject:cell];
        }
    }
    
    [self.cells removeObject:cell];
    [cell release];
}


-(void) spread_infection: (Cell *) cell
{
    NSMutableArray *near_cells = [self cells_near_point:cell.bind_pos];
    
    cell.emitted = YES;
    
    for (Cell *cell_in in near_cells) {
        if (!cell_in.infected) {
            if ( (arc4random()%3) <= cell_in.infection_prob  ) {
                cell_in.infected = YES;
                cell_in.emitted = NO;
                cell_in.replication_time = (arc4random()%11+5);
                self.num_infected++;
                [self.cur_infected addObject:cell_in];

            }
        }
    }
    
    [self.cur_infected removeObject:cell];
    [near_cells release];
    
}





// dealloc





- (void) dealloc
{
    [self.cells release];
    [self.cur_infected release];
    [super dealloc];
    
}


@end
