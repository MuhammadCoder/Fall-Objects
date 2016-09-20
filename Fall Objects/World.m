//
//  World.m
//  Fall Objects
//
//  Created by Muhammad  on 2016-08-15.
//  Copyright © 2016 Muhammad . All rights reserved.
//

#import "World.h"

@implementation World

-(void)ground
{
    
    /*creating the first ground*/
    SKSpriteNode  *ground = [SKSpriteNode spriteNodeWithColor:[UIColor whiteColor] size:CGSizeMake(500, 10)]; //created the ground node
    ground.position = CGPointMake(0, -390);
    ground.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:ground.size];
    ground.physicsBody.dynamic = NO;
    [self addChild:ground]; //sending the node to the scene 
   
    /*left wall */
    SKSpriteNode *leftSide = [SKSpriteNode spriteNodeWithColor:[UIColor whiteColor] size:CGSizeMake(10, 750)];
    leftSide.position = CGPointMake(-225, 0);
    leftSide.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:leftSide.size];
    leftSide.physicsBody.dynamic = NO;
    [self addChild:leftSide];
    
    /*right wall*/
    SKSpriteNode *rightSide = [SKSpriteNode spriteNodeWithColor:[UIColor whiteColor] size:CGSizeMake(10, 750)];
    rightSide.position = CGPointMake(225, 0);
    rightSide.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:rightSide.size];
    rightSide.physicsBody.dynamic = NO;
    [self addChild:rightSide];
    
    /* top wall */
    
    SKSpriteNode *top = [SKSpriteNode spriteNodeWithColor:[UIColor whiteColor] size:CGSizeMake(500, 10)];
    top.position = CGPointMake(0, 390);
    top.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:top.size];
    top.physicsBody.dynamic = NO;
    
    [self addChild:top];
    
    
    
    
    
}




@end
