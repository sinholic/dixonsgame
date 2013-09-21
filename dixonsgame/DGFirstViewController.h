//
//  DGFirstViewController.h
//  dixonsgame
//
//  Created by Mahar Prasetio on 9/17/13.
//  Copyright (c) 2013 gaze. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <AVFoundation/AVAudioPlayer.h>

@interface DGFirstViewController : UIViewController <AVAudioPlayerDelegate>
-(IBAction)buttonStart:(id)sender;
@property NSUserDefaults *sharedData;
@end
