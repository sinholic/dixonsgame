//
//  DGFourthViewController.m
//  dixonsgame
//
//  Created by Mahar Prasetio on 9/17/13.
//  Copyright (c) 2013 gaze. All rights reserved.
//

#import "DGFourthViewController.h"

@interface DGFourthViewController ()
@property AVAudioPlayer *soundPlayer;

@end

@implementation DGFourthViewController

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
	// Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (IBAction)startButtonClicked:(id)sender {
    [self playMusic:@"doe-mee-button" :@"wav" :NO];
    UIStoryboard *storyboard;
    storyboard = [UIStoryboard storyboardWithName:@"Ipad" bundle:nil];
    UIViewController *secondView = [self.storyboard instantiateViewControllerWithIdentifier:@"FifthView"];
    [self presentViewController:secondView animated:YES completion:nil];
}
@end
