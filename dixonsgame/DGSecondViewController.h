//
//  DGSecondViewController.h
//  dixonsgame
//
//  Created by Mahar Prasetio on 9/17/13.
//  Copyright (c) 2013 gaze. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface DGSecondViewController : UIViewController <UIAlertViewDelegate, AVAudioPlayerDelegate>
- (IBAction)personeelFinish:(id)sender;
- (IBAction)birthdayFinish:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *personeelnummer;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;
@property (weak, nonatomic) IBOutlet UITextField *birthdayText;
- (IBAction)submitButtonPressed:(id)sender;

@end
