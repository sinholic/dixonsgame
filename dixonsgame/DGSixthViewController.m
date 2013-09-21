//
//  DGSixthViewController.m
//  dixonsgame
//
//  Created by Mahar Prasetio on 9/19/13.
//  Copyright (c) 2013 gaze. All rights reserved.
//

#import "DGSixthViewController.h"

@interface DGSixthViewController ()
@property NSUserDefaults *sharedData;
@property AVAudioPlayer *soundPlayer;
@end

@implementation DGSixthViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)playMusic : (NSString *)fileName : (NSString *)fileType : (BOOL)loop {
    NSURL* musicFile = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                               pathForResource:fileName
                                               ofType:fileType]];
    self.soundPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:musicFile error:nil];
    self.soundPlayer.delegate = (id)self;
    [self.soundPlayer prepareToPlay];
    [self.soundPlayer play];
    self.soundPlayer.volume = 0.5;
    if (loop) {
        self.soundPlayer.numberOfLoops = -1;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self playMusic:@"win-the-game" :@"wav":NO];
    self.sharedData = [NSUserDefaults standardUserDefaults];
    NSString *objectForTotalCorrectAnswers = [NSString stringWithFormat:@"%i", self.totalCorrectAnswer ];
    [self.sharedData setObject:objectForTotalCorrectAnswers forKey:@"totalCorrectAnswers"];
    self.labelFinish.text = [NSString stringWithFormat:@"Je hebt %i producten geraden die je kan bijverkopen voor de %@!", self.totalCorrectAnswer, self.currentProductName];
    self.imageScore.image = [UIImage imageNamed:[NSString stringWithFormat:@"%i.png", self.totalCorrectAnswer]];
    for (int i = 0; i < self.currentProductDisplayNameFromFifthView.count; i++) {
        if (self.currentCorrectAnswerFromFifthView != nil && [self.currentCorrectAnswerFromFifthView objectForKey:[self.currentProductDisplayNameFromFifthView objectAtIndex:i]]) {
            [self putDataToLabel:[self.currentProductDisplayNameFromFifthView objectAtIndex:i] :i :@"bold"];
        } else {
            [self putDataToLabel:[self.currentProductDisplayNameFromFifthView objectAtIndex:i] :i :@"normal"];
        }
        NSLog(@"current product correct answer name : %@", [self.currentCorrectAnswerFromFifthView objectForKey:[self.currentProductDisplayNameFromFifthView objectAtIndex:i]]);
//        NSLog(@"current product display name : %@", [self.currentProductDisplayNameFromFifthView objectAtIndex:i]);
    }
	// Do any additional setup after loading the view.
}



- (void)putDataToLabel:(NSString *)textString :(int)indexOfArray :(NSString *)textType {
    switch (indexOfArray) {
        case 0:
            if ([textType isEqualToString:@"bold"]) {
                [self.labelProductName1 setTextColor:[UIColor blackColor]];
                self.labelProductName1.font = [UIFont boldSystemFontOfSize:16.0f];
            }
            self.labelProductName1.text = [NSString stringWithFormat:@"%@", textString];
            break;
        case 1:
            if ([textType isEqualToString:@"bold"]) {
                [self.labelProductName2 setTextColor:[UIColor blackColor]];
                self.labelProductName2.font = [UIFont boldSystemFontOfSize:16.0f];
            }
            self.labelProductName2.text = [NSString stringWithFormat:@"%@", textString];
            break;
        case 2:
            if ([textType isEqualToString:@"bold"]) {
                [self.labelProductName3 setTextColor:[UIColor blackColor]];
                self.labelProductName3.font = [UIFont boldSystemFontOfSize:16.0f];
            }
            self.labelProductName3.text = [NSString stringWithFormat:@"%@", textString];
            break;
        case 3:
            if ([textType isEqualToString:@"bold"]) {
                [self.labelProductName4 setTextColor:[UIColor blackColor]];
                self.labelProductName4.font = [UIFont boldSystemFontOfSize:16.0f];
            }
            self.labelProductName4.text = [NSString stringWithFormat:@"%@", textString];
            break;
        case 4:
            if ([textType isEqualToString:@"bold"]) {
                [self.labelProductName5 setTextColor:[UIColor blackColor]];
                self.labelProductName5.font = [UIFont boldSystemFontOfSize:16.0f];
            }
            self.labelProductName5.text = [NSString stringWithFormat:@"%@", textString];
            break;
        case 5:
            if ([textType isEqualToString:@"bold"]) {
                [self.labelProductName6 setTextColor:[UIColor blackColor]];
                self.labelProductName6.font = [UIFont boldSystemFontOfSize:16.0f];
            }
            self.labelProductName6.text = [NSString stringWithFormat:@"%@", textString];
            break;
        case 6:
            if ([textType isEqualToString:@"bold"]) {
                [self.labelProductName7 setTextColor:[UIColor blackColor]];
                self.labelProductName7.font = [UIFont boldSystemFontOfSize:16.0f];
            }
            self.labelProductName7.text = [NSString stringWithFormat:@"%@", textString];
            break;
        case 7:
            if ([textType isEqualToString:@"bold"]) {
                [self.labelProductName8 setTextColor:[UIColor blackColor]];
                self.labelProductName8.font = [UIFont boldSystemFontOfSize:16.0f];
            }
            self.labelProductName8.text = [NSString stringWithFormat:@"%@", textString];
            break;
        case 8:
            if ([textType isEqualToString:@"bold"]) {
                [self.labelProductName9 setTextColor:[UIColor blackColor]];
                self.labelProductName9.font = [UIFont boldSystemFontOfSize:16.0f];
            }
            self.labelProductName9.text = [NSString stringWithFormat:@"%@", textString];
            break;
        case 9:
            if ([textType isEqualToString:@"bold"]) {
                [self.labelProductName10 setTextColor:[UIColor blackColor]];
                self.labelProductName10.font = [UIFont boldSystemFontOfSize:16.0f];
            }
            self.labelProductName10.text = [NSString stringWithFormat:@"%@", textString];
            break;
        case 10:
            if ([textType isEqualToString:@"bold"]) {
                [self.labelProductName11 setTextColor:[UIColor blackColor]];
                self.labelProductName11.font = [UIFont boldSystemFontOfSize:16.0f];
            }
            self.labelProductName11.text = [NSString stringWithFormat:@"%@", textString];
            break;
        case 11:
            if ([textType isEqualToString:@"bold"]) {
                [self.labelProductName12 setTextColor:[UIColor blackColor]];
                self.labelProductName12.font = [UIFont boldSystemFontOfSize:16.0f];
            }
            self.labelProductName12.text = [NSString stringWithFormat:@"%@", textString];
            break;
        case 12:
            if ([textType isEqualToString:@"bold"]) {
                [self.labelProductName13 setTextColor:[UIColor blackColor]];
                self.labelProductName13.font = [UIFont boldSystemFontOfSize:16.0f];
            }
            self.labelProductName13.text = [NSString stringWithFormat:@"%@", textString];
            break;
        case
            13:
            if ([textType isEqualToString:@"bold"]) {
                [self.labelProductName14 setTextColor:[UIColor blackColor]];
                self.labelProductName14.font = [UIFont boldSystemFontOfSize:16.0f];
            }
            self.labelProductName14.text = [NSString stringWithFormat:@"%@", textString];
            break;
        case 14:
            if ([textType isEqualToString:@"bold"]) {
                [self.labelProductName15 setTextColor:[UIColor blackColor]];
                self.labelProductName15.font = [UIFont boldSystemFontOfSize:16.0f];
            }
            self.labelProductName15.text = [NSString stringWithFormat:@"%@", textString];
            break;
        case 15:
            if ([textType isEqualToString:@"bold"]) {
                [self.labelProductName16 setTextColor:[UIColor blackColor]];
                self.labelProductName16.font = [UIFont boldSystemFontOfSize:16.0f];
            }
            self.labelProductName16.text = [NSString stringWithFormat:@"%@", textString];
            break;
        case 16:
            if ([textType isEqualToString:@"bold"]) {
                [self.labelProductName17 setTextColor:[UIColor blackColor]];
                self.labelProductName17.font = [UIFont boldSystemFontOfSize:16.0f];
            }
            self.labelProductName17.text = [NSString stringWithFormat:@"%@", textString];
            break;
        case 17:
            if ([textType isEqualToString:@"bold"]) {
                [self.labelProductName18 setTextColor:[UIColor blackColor]];
                self.labelProductName18.font = [UIFont boldSystemFontOfSize:16.0f];
            }
            self.labelProductName18.text = [NSString stringWithFormat:@"%@", textString];
            break;
        case 18:
            if ([textType isEqualToString:@"bold"]) {
                [self.labelProductName19 setTextColor:[UIColor blackColor]];
                self.labelProductName19.font = [UIFont boldSystemFontOfSize:16.0f];
            }
            self.labelProductName19.text = [NSString stringWithFormat:@"%@", textString];
            break;
        case 19:
            if ([textType isEqualToString:@"bold"]) {
                [self.labelProductName20 setTextColor:[UIColor blackColor]];
                self.labelProductName20.font = [UIFont boldSystemFontOfSize:16.0f];
            }
            self.labelProductName20.text = [NSString stringWithFormat:@"%@", textString];
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)verderButtonClicked:(id)sender {
    [self playMusic:@"doe-mee-button" :@"wav":NO];
    UIStoryboard *storyboard;
    storyboard = [UIStoryboard storyboardWithName:@"Ipad" bundle:nil];
    UIViewController *secondView = [self.storyboard instantiateViewControllerWithIdentifier:@"SeventhView"];
    [self presentViewController:secondView animated:YES completion:nil];
}
@end
