//
//  Cell.h
//  TCCollision
//
//  Created by Daniel Feltey on 5/12/11.
//  Copyright 2011 University of Chicago. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"


@interface Cell : NSObject {
    
    
    BOOL infected;
    BOOL emitted;
    int infection_prob;
    CGPoint bind_pos;
    CGPoint cur_pos;
    int replication_time;
    CCSprite *cell_sprite;
    
}

@end
