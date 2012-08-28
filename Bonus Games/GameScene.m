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
                
        anotherDict = (NSMutableDictionary *)[NSMutableDictionary dictionaryWithContentsOfFile:@"/Users/pointerware3/Desktop/BonusGamesInfo/Bonus Games/bonusGame1.plist"];
        NSLog(@"Count: - %i", anotherDict.count);
        for (id key in anotherDict) {
            NSLog(@"key: %@, value: %@", key, [anotherDict objectForKey:key]);
        }
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
    CCSprite *background = [CCSprite spriteWithFile:[anotherDict objectForKey:@"backGround"]];
    background.position = ccp(winSize.width/2, winSize.height/2);
    [self addChild:background];
        
    int x = 80;
    int y = 350;
    
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
    CCSprite *youWonBox = [CCSprite spriteWithFile:[anotherDict objectForKey:@"youwon"]];
    youWonBox.scaleX = 0.6;
    youWonBox.scaleY = 0.6;
    youWonBox.position = ccp(youWonBox.contentSize.width/3,winSize.height-youWonBox.contentSize.height/3);
    [self addChild:youWonBox];
    youWonLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"$%i",amountWon] fontName:@"Arial" fontSize:15];
    youWonLabel.color = ccc3(0,0,0);
   youWonLabel.position = ccp(youWonBox.contentSize.width/3,winSize.height-youWonBox.contentSize.height/3-3);
    [self addChild:youWonLabel];
    
    // Add the Cash box and its label to the screen
    CCSprite *cashBox = [CCSprite spriteWithFile:[anotherDict objectForKey:@"cash"]];
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