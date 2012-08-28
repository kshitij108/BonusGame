//
//  GameScene.h
//  Bonus Games
//
//  Created by PointerWare Laptop 3 on 12-07-12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"
#import "SimpleAudioEngine.h"

NSMutableDictionary *anotherDict;

@interface GameScene : CCLayer
{
    BOOL touch;
    int amountWon;
    int cash;
    CCLabelTTF *youWonLabel;
    CCLabelTTF *cashLabel;
    int numbers[6];
    CCMenuItemImage *item;
    CCMenu *menu;
}

+(id) scene;

-(void)addFruits;
-(void)addLabels;
-(void)playGame:(id)sender;

@end