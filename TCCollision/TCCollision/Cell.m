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
    
}

- (float) distance_from_cell: (Cell *) cell
{
    float distance;
    float x = self.bind_pos.x - cell.bind_pos.x;
    float y = self.bind_pos.y - cell.bind_pos.y;
    distance = sqrtf(powf(x, 2)+powf(y, 2));
    return distance;
}

@end