//
//  FinalScore.m
//  Bonus Games
//
//  Created by PointerWare Laptop 3 on 12-07-12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FinalScore.h"
#import "GameScene.h"

@implementation FinalScore

+(id) scene
{
    CCScene *scene = [CCScene node];
    
    FinalScore *layer = [FinalScore node];
    
    [scene addChild: layer];
    
    return scene;
}

-(id) init
{
    
    if( (self=[super init] )) {
       
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"rainforest.mp3"];
        
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        CCSprite *background = [CCSprite spriteWithFile:@"background.png"];
        background.position = ccp(winSize.width/2, winSize.height/2);
        [self addChild:background];
    }
    return self;
}



- (void) dealloc
{
    
    [super dealloc];
}
@end