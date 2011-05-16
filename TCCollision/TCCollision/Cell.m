//
//  Cell.m
//  TCCollision
//
//  Created by Daniel Feltey on 5/12/11.
//  Copyright 2011 University of Chicago. All rights reserved.
//

#import "Cell.h"


@implementation Cell
@synthesize infected,emitted,infection_prob,bind_pos,cur_pos,replication_time,cell_sprite;


-(id) init 
{
    
    self.infected = NO;
    self.emitted = NO;
    self.infection_prob = arc4random()%3;
    self.bind_pos = ccp(0,0);
    self.cur_pos = ccp(0,0);
    self.replication_time = 0;
    
    // self.cell_sprite = 
    
    return self;
    
}

- (float) distance_from_cell: (Cell *) cell
{
    float distance;
    float x = self.bind_pos.x - cell.bind_pos.x;
    float y = self.bind_pos.y - cell.bind_pos.y;
    distance = sqrtf(powf(x, 2)+powf(y, 2));
    return distance;
}

- (void) emit_virions:(NSMutableArray *)cells
{
    
}

- (void) cell_motion
{
    float x = self.bind_pos.x + (arc4random()%(2*RADIUS) - RADIUS);
    float y = self.bind_pos.y + (arc4random()%(2*RADIUS) - RADIUS);
    
    self.cur_pos = ccp(x,y); 
}


// dealloc

@end












