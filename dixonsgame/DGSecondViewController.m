//
//  DGSecondViewController.m
//  dixonsgame
//
//  Created by Mahar Prasetio on 9/17/13.
//  Copyright (c) 2013 gaze. All rights reserved.
//

#import "DGSecondViewController.h"
#import "MBProgressHUD.h"
#import "DGThirdViewController.h"

@interface DGSecondViewController ()
@property NSUserDefaults *sharedData;
@property AVAudioPlayer *soundPlayer;
@end

@implementation DGSecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.sharedData = [NSUserDefaults standardUserDefaults];
	// Do any additional setup after loading the view.
    self.submitButton.enabled = NO;
    [self.personeelnummer becomeFirstResponder];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)submit{
    if ([self.personeelnummer.text isEqualToString: @""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please fill the personeelnummer" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    } else if ([self.birthdayText.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please fill the geboordedatum" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    } else if ([self.personeelnummer.text isEqualToString:@"123456789"] && [self.birthdayText.text isEqualToString:@"987654321"]){
        UIStoryboard *storyboard;
        storyboard = [UIStoryboard storyboardWithName:@"Ipad" bundle:nil];
        UIViewController *dataView = [self.storyboard instantiateViewControllerWithIdentifier:@"DataView"];
        [self presentViewController:dataView animated:YES completion:nil];
    }else {
        [self playMusic:@"doe-mee-button" :@"wav" :NO ];
        [self.sharedData setObject:self.personeelnummer.text forKey:@"personeelnummer"];
        [self.sharedData setObject:self.birthdayText.text forKey:@"birthday"];
        UIStoryboard *storyboard;
        storyboard = [UIStoryboard storyboardWithName:@"Ipad" bundle:nil];
        DGThirdViewController *thirdView = [self.storyboard instantiateViewControllerWithIdentifier:@"ThirdView"];
        thirdView.personeelnummer = [NSString stringWithFormat:@"%@", self.personeelnummer.text];
        [self presentViewController:thirdView animated:YES completion:nil];
    }
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

- (IBAction)submitButtonPressed:(id)sender {
    [self submit];
}

- (IBAction)birthdayChanged:(id)sender {
    if ([self.birthdayText.text isEqualToString:@""]) {
        self.submitButton.enabled = NO;
    } else {
        self.submitButton.enabled = YES;
    }
}

- (IBAction)personeelFinish:(id)sender {
    [self.personeelnummer resignFirstResponder];
    [self.birthdayText becomeFirstResponder];
}



- (IBAction)birthdayFinish:(id)sender {
    [self submit];
}
@end
