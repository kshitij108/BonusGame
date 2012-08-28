//
//  MainMenuScene.h
//  Bonus Games
//
//  Created by PointerWare Laptop 3 on 12-07-12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "cocos2d.h"

@interface MainMenuScene : CCLayer
{
    CCMenuItem *spinButton;
    CCMenu *spinButtonMenu;
    CGSize winSize;
    CCSprite *background;
    CCLabelTTF *title;
}

+(id) scene;

-(void)startGame;
-(void)displayWelcomenote;
-(void)creatingBackground;
-(void)startButton;

@end