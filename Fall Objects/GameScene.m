//
//  GameScene.m
//  Fall Objects
//
//  Created by Muhammad  on 2016-08-15.
//  Copyright (c) 2016 Muhammad . All rights reserved.
//

#import "GameScene.h"
#import "World.h"


@implementation GameScene



-(void)didMoveToView:(SKView *)view {
    /* Setup your scene here */
    
    self.anchorPoint = CGPointMake(0.5, 0.5);
    self.backgroundColor = [UIColor blackColor];//[SKColor colorWithRed:74 green:67 blue:67 alpha:1.0];
     
    
    /* Creating the world */
    World *war = [[World alloc] init]; // alloc memory to hold the object
    [war ground]; //calling the method ground so the addChild node can be sent here
    [self addChild:war]; //displaying the final display on to the screen, everything

    /* Calling the label */
    [self label];
   
}

- (void)label
{
    /* Tap To Begin Label */
    SKLabelNode *tapToBegin = [SKLabelNode labelNodeWithText:@"Tap Me!!"];
    tapToBegin.fontColor = [UIColor whiteColor];
    tapToBegin.fontName = @"TimesNewRoman-Bold";
    tapToBegin.name =@"tapToBegin";
    [self labelAnimation:tapToBegin];
    [self addChild:tapToBegin];
    
    self.tapPressed = YES;
    
}

- (void)label2
{
    SKLabelNode *tapAgain = [SKLabelNode labelNodeWithText:@"Keep Tapping!!"];
    tapAgain.fontColor = [UIColor whiteColor];
    tapAgain.fontName = @"TimesNewRoman-Bold";
    [self labelAnimation:tapAgain];
    [self addChild:tapAgain];
    self.tapPressed = NO;
}

-(void)labelAnimation:(SKLabelNode *)label
{
    SKAction *disappear = [SKAction fadeInWithDuration:0.5];
    SKAction *appear = [SKAction fadeOutWithDuration:0.5];
    SKAction *sequence = [SKAction sequence:@[disappear,appear]];
    [label runAction:[SKAction repeatActionForever:sequence]];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    if(self.tapPressed == YES) {
        [[self childNodeWithName:@"tapToBegin"] removeFromParent]; //removing tap to begin label on first tap
        [self label2];
        
    }
 
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        [self generateShape:&location];
    }
    
}


-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

/*
-(void)moveBlock:(SKNode *)block
{
    
    int rand = arc4random() % 2;
    SKAction *move;
    
    switch (rand) {
        case 0:
          
            move = [SKAction moveToX:1000 duration:100];
            break;
            
        case 1:
            move = [SKAction moveToX:-1000 duration:100];
            break;
            
        default:
            break;
    }
    
    [block runAction:move];
}

*/

/*random generating shape */

-(SKNode *)generateShape: (CGPoint *)touch
{
    int rand = arc4random() % 2;
    
    /*variable declaration for circle shape */
    SKSpriteNode *object;
    SKSpriteNode *leftEye;
    SKSpriteNode *rightEye;
    
    /*variable declaration for circle shape */
    SKShapeNode *object2;
    SKShapeNode *rightEye1;
    SKShapeNode *leftEye2;
    
    switch (rand) {
        case 0:
            /*creating the rect block shape*/
            object = [SKSpriteNode spriteNodeWithColor:[self rectRanColor] size:CGSizeMake(40, 40)];
            object.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:object.size];
            object.name = @"rect2";
            object.position = *(touch); //CGPointMake(40, 40);
            [self addChild:object];
            
            /* adding left eye to block */
            leftEye = [SKSpriteNode spriteNodeWithColor:[self rectRanColor] size:CGSizeMake(5, 5)];
            leftEye.position = CGPointMake(-3, 8);
            [object addChild:leftEye]; //adding the left eye to the block
            
            /* adding right eye to block */
            rightEye = [SKSpriteNode spriteNodeWithColor:[self rectRanColor] size:CGSizeMake(5, 5)];
            rightEye.position = CGPointMake(12, 8);
            [object addChild:rightEye]; //adding the left eye to the block
            return object;
            
            break;
            
        case 1:
            
            object2 = [SKShapeNode shapeNodeWithCircleOfRadius:20];
            object2.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:20];
            object2.fillColor = [self rectRanColor];
            object2.position = *(touch);
            [self addChild:object2];
            
            /* adding right eye to block */
            rightEye1 = [SKShapeNode shapeNodeWithCircleOfRadius:2];
            rightEye1.position = CGPointMake(12, 8);
            rightEye1.fillColor = [self rectRanColor];
            [object2 addChild:rightEye1];
            
            /* adding left eye to block */
            leftEye2 = [SKShapeNode shapeNodeWithCircleOfRadius:2];
            leftEye2.position = CGPointMake(-3, 8);
            leftEye2.fillColor =[self rectRanColor];
            [object2 addChild:leftEye2];

            
        default:
            break;
    }
    
    if (rand == 1)
    {
        return object;
        
    }
    else
    {
        return object2;
    }

}

/*random generating color */
-(UIColor *)rectRanColor
{
    
    int rand = arc4random() % 8;
    UIColor *color;
    
    
    switch (rand) {
        case 0:
            color = [UIColor redColor];
            break;
            
        case 1:
            color = [UIColor orangeColor];
            break;
            
        case 2:
            color = [UIColor blueColor];
            break;
            
        case 3:
            color = [UIColor orangeColor];
            break;
            
        case 4:
            color = [UIColor yellowColor];
            break;
            
        case 5:
            color = [UIColor greenColor];
            break;
            
        case 6:
            color = [UIColor purpleColor];
            break;
            
        case 7:
            color = [UIColor lightGrayColor];
            break;
            
        default:
            break;
    }
    return color;
}


@end
