//
//  DGSixthViewController.h
//  dixonsgame
//
//  Created by Mahar Prasetio on 9/19/13.
//  Copyright (c) 2013 gaze. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface DGSixthViewController : UIViewController <AVAudioPlayerDelegate>
@property NSString *currentProductName;
@property NSArray *currentProductDisplayNameFromFifthView;
@property NSDictionary *currentCorrectAnswerFromFifthView;
@property (weak, nonatomic) IBOutlet UILabel *labelFinish;
@property (weak, nonatomic) IBOutlet UIImageView *imageScore;
@property (weak, nonatomic) IBOutlet UILabel *labelProductName1;
@property (weak, nonatomic) IBOutlet UILabel *labelProductName2;
@property (weak, nonatomic) IBOutlet UILabel *labelProductName3;
@property (weak, nonatomic) IBOutlet UILabel *labelProductName4;
@property (weak, nonatomic) IBOutlet UILabel *labelProductName5;
@property (weak, nonatomic) IBOutlet UILabel *labelProductName6;
@property (weak, nonatomic) IBOutlet UILabel *labelProductName7;
@property (weak, nonatomic) IBOutlet UILabel *labelProductName8;
@property (weak, nonatomic) IBOutlet UILabel *labelProductName9;
@property (weak, nonatomic) IBOutlet UILabel *labelProductName10;
@property (weak, nonatomic) IBOutlet UILabel *labelProductName11;
@property (weak, nonatomic) IBOutlet UILabel *labelProductName12;
@property (weak, nonatomic) IBOutlet UILabel *labelProductName13;
@property (weak, nonatomic) IBOutlet UILabel *labelProductName14;
@property (weak, nonatomic) IBOutlet UILabel *labelProductName15;
@property (weak, nonatomic) IBOutlet UILabel *labelProductName16;
@property (weak, nonatomic) IBOutlet UILabel *labelProductName17;
@property (weak, nonatomic) IBOutlet UILabel *labelProductName18;
@property (weak, nonatomic) IBOutlet UILabel *labelProductName19;
@property (weak, nonatomic) IBOutlet UILabel *labelProductName20;
- (IBAction)verderButtonClicked:(id)sender;

@end
