//
//  MainMenuScene.m
//  Bonus Games
//
//  Created by PointerWare Laptop 3 on 12-07-12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MainMenuScene.h"
#import "GameScene.h"

@implementation MainMenuScene

+(id) scene
{
    CCScene *scene = [CCScene node];
    
    MainMenuScene *layer = [MainMenuScene node];
    
    [scene addChild: layer];
    
    return scene;
}

-(id) init
{
    
    if( (self=[super init] )) {
                
        
        [self creatingBackground];
        [self displayWelcomenote];
        [self startButton];
                
                        
    }
        return self;
}
-(void)displayWelcomenote
{
    
    CCLabelTTF *title = [CCLabelTTF labelWithString:@"Pointerware Bonus Games!" fontName:@"Courier" fontSize:20];
    title.color = ccc3(255,0,0);
    title.position = ccp(165, 440);
    [self addChild: title];

}
-(void)startButton
{
    
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    CCMenuItem *spinButton = [CCMenuItemImage
                              itemFromNormalImage:@"greenButton.png" selectedImage:@"redButton.png"
                              target:self selector:@selector(startGame)];
    spinButton.position = ccp(winSize.width/2, 45);
    CCMenu *spinButtonMenu = [CCMenu menuWithItems:spinButton, nil];
    spinButtonMenu.position = CGPointZero;
    [self addChild:spinButtonMenu];

}
//Creating background graphics
-(void)creatingBackground
{
    [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"rainforest.mp3"];
    
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    
    CCSprite *background = [CCSprite spriteWithFile:@"background.png"];
    
    background.position = ccp(winSize.width/2, winSize.height/2);
    
    [self addChild:background];

}


- (void) startGame
{
    [[CCDirector sharedDirector] replaceScene:[GameScene scene]];
}

- (void) dealloc
{
    
    [super dealloc];
}
@end