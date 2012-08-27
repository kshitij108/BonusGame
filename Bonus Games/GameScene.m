//
//  GameScene.m
//  Bonus Games
//
//  Created by PointerWare Laptop 3 on 12-07-12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GameScene.h"
#import "FinalScore.h"


@implementation GameScene

   // int totalBalance;
+(id) scene
{
    CCScene *scene = [CCScene node];
    
    GameScene *layer = [GameScene node];
    
    [scene addChild: layer];
    
    return scene;
}

-(id) init
{
    
    
    if( (self=[super init] )) {
        
        //[self loadSoundFilesInBackground];
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"rainforest.mp3"];
        amountWon = 0;
        cash = 100;
        [self addFruits];
        [self addLabels];
        //Fill numbers array with random values 10,20,30,40,50,60
        for (int i = 0; i < 6; i++)
        {
            BOOL success = NO;
            while (!success)
            {
                int randomNumber = (arc4random() % 6 + 1) * 10;
                int j;
                for (j = 0; j < i; j++)
                {
                    if (randomNumber == numbers[j])
                    {
                        break;
                    }
                }
                if (j == i)
                {
                    numbers[i] = randomNumber;
                    NSLog(@"%i",numbers[i]);
                    break;
                }
            }
        }
       
    }
    /*if (numbers[0] == m1) {
        
        UIAlertView *someError = [[UIAlertView alloc] initWithTitle: @"you won!" message: @"you won! - %d, m1" delegate: self cancelButtonTitle: @"Ok" otherButtonTitles: nil];
        [someError show];

    }
    else if (numbers[1] == m2)
    {
        UIAlertView *someError = [[UIAlertView alloc] initWithTitle: @"you won!" message: @"you won! - %d, m1" delegate: self cancelButtonTitle: @"Ok" otherButtonTitles: nil];
        [someError show];

    }
    else if (numbers[2] == m3)
    
    numbers[3] = m4;
    numbers[4] = m5;
    numbers[5] = m6;*/
    
    
    
    return self;
    
}

- (void) playGame:(id)sender
{
    
}

-(void)addFruits
{
    UIAlertView *someError = [[UIAlertView alloc] initWithTitle: @"Game Info" message: @"Try to score maximum bonus pointes by guessing one fruit!" delegate: self cancelButtonTitle: @"Ok" otherButtonTitles: nil];
    [someError show];
    
    
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    CCSprite *background = [CCSprite spriteWithFile:@"background.png"];
    background.position = ccp(winSize.width/2, winSize.height/2);
    [self addChild:background];
    /*
    b1 = [CCMenuItemImage itemFromNormalImage:@"1.png" selectedImage:@"1.png" target:self selector:@selector(playGame:)];
    m1 = [CCMenu menuWithItems: b1, nil];
    m1.position = ccp(40,400);
    [self addChild: m1];
    
    b2 = [CCMenuItemImage itemFromNormalImage:@"2.png" selectedImage:@"2.png" target:self selector:@selector(playGame:)];
    m2 = [CCMenu menuWithItems: b2, nil];
    m2.position = ccp(40,360);
    [self addChild: m2];
    
    
    b3 = [CCMenuItemImage itemFromNormalImage:@"3.png" selectedImage:@"3.png" target:self selector:@selector(playGame:)];
    m3 = [CCMenu menuWithItems: b3, nil];
    m3.position = ccp(40,320);
    [self addChild: m3];
    
    b4 = [CCMenuItemImage itemFromNormalImage:@"4.png" selectedImage:@"4.png" target:self selector:@selector(playGame:)];
    m4 = [CCMenu menuWithItems: b4, nil];
    m4.position = ccp(40,280);
    [self addChild: m4];
    
    b5 = [CCMenuItemImage itemFromNormalImage:@"5.png" selectedImage:@"5.png" target:self selector:@selector(playGame:)];
    m5 = [CCMenu menuWithItems: b5, nil];
    m5.position = ccp(40,240);
    [self addChild: m5];
    
    b6 = [CCMenuItemImage itemFromNormalImage:@"6.png" selectedImage:@"6.png" target:self selector:@selector(playGame:)];
    m6 = [CCMenu menuWithItems: b6, nil];
    m6.position = ccp(40,200);
    [self addChild: m6];
    */
    
    int x = 80;
    int y = 350;
    CCMenuItemImage *item;
    CCMenu *menu;
    for (int i = 0; i < 6; i++)
    {
        if (i%2 == 0 && i != 0)
        {
            x = 80;
            y -= 100;
        }
        else if (i%2 != 0)
        {
            x = 240;
        }
        
        item = [CCMenuItemImage itemFromNormalImage:[NSString stringWithFormat:@"%i.png",i+1] selectedImage:[NSString stringWithFormat:@"%i.png",i+1] target:self selector:@selector(playGame:)];
        menu = [CCMenu menuWithItems: item, nil];
        menu.position = ccp(x,y);
        [self addChild:menu];

    }
    
    
}
    
    


-(void)addLabels
{
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    
    // Add the You Won box and its label to the screen
    CCSprite *youWonBox = [CCSprite spriteWithFile:@"youWon.png"];
    youWonBox.scaleX = 0.6;
    youWonBox.scaleY = 0.6;
    youWonBox.position = ccp(youWonBox.contentSize.width/3,winSize.height-youWonBox.contentSize.height/3);
    [self addChild:youWonBox];
    youWonLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"$%i",amountWon] fontName:@"Arial" fontSize:15];
    youWonLabel.color = ccc3(0,0,0);
   youWonLabel.position = ccp(youWonBox.contentSize.width/3,winSize.height-youWonBox.contentSize.height/3-3);
    [self addChild:youWonLabel];
    
    // Add the Cash box and its label to the screen
    CCSprite *cashBox = [CCSprite spriteWithFile:@"cash.png"];
    cashBox.scaleX = 0.6;
    cashBox.scaleY = 0.6;
   cashBox.position = ccp(3*winSize.width/4,winSize.height-cashBox.contentSize.height/3);
    [self addChild:cashBox];
    cashLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"$%i",cash] fontName:@"Arial" fontSize:15];
    cashLabel.color = ccc3(0,0,0);
   cashLabel.position = ccp(3*winSize.width/4,winSize.height-cashBox.contentSize.height/3-3);
    [self addChild:cashLabel];
}

- (void) dealloc
{
    
    [super dealloc];
}

@end