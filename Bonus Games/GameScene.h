//
//  GameScene.h
//  Bonus Games
//
//  Created by PointerWare Laptop 3 on 12-07-12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"
#import "SimpleAudioEngine.h"

@interface GameScene : CCLayer
{
    BOOL touch;
    int amountWon;
    int cash;
    CCLabelTTF *youWonLabel;
    CCLabelTTF *cashLabel;
    int numbers[6];
    CCMenu *m1,*m2,*m3,*m4,*m5,*m6;
    CCMenuItemImage *b1,*b2,*b3,*b4,*b5,*b6;
    
}

+(id) scene;

-(void)addFruits;
-(void)addLabels;
-(void)playGame:(id)sender;

@end