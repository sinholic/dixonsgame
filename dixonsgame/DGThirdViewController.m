//
//  DGThirdViewController.m
//  dixonsgame
//
//  Created by Mahar Prasetio on 9/17/13.
//  Copyright (c) 2013 gaze. All rights reserved.
//

#import "DGThirdViewController.h"
#import "ALAssetsLibrary+CustomPhotoAlbum.h"


@interface DGThirdViewController ()
@property NSTimer *countdownTimer;
@property int secondsCount;
@property int totalImageCaptured;
@property (nonatomic, strong) UIPopoverController *popOver;
@property (strong, atomic) ALAssetsLibrary* library;
@property AVAudioPlayer *soundPlayer;
@property AVAudioPlayer *backSound;
@property NSUserDefaults *sharedData;
@property UIImagePickerController *imagePicker;

@end

@implementation DGThirdViewController
@synthesize firstImage, /*secondImage, thirdImage,*/ popOver, library;

- (void)countTimer {
    self.secondsCount = 60;
    self.countdownTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerRun) userInfo:nil repeats:YES];
}

- (void)timerRun {
    self.secondsCount = self.secondsCount - 1;
    NSString *timeRemaining = [NSString stringWithFormat:@"%2d", self.secondsCount];
    self.timeRemaining.text = timeRemaining;
    if (self.secondsCount == 0) {
        if ([self.imagePicker isBeingPresented]) {
            firstImage.enabled = NO;
            self.imagePicker.allowsEditing = NO;
            self.imagePicker.showsCameraControls = NO;
            [self.imagePicker takePicture];
        } else {
            UIStoryboard *storyboard;
            storyboard = [UIStoryboard storyboardWithName:@"Ipad" bundle:nil];
            UIViewController *fourthViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"FourthView"];
            [self presentViewController:fourthViewController animated:YES completion:nil];
        }
        [self.countdownTimer invalidate];
        self.timeRemaining.text = [NSString stringWithFormat:@"0"];
        [self.soundPlayer stop];
    }
}

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
    if (firstImage.imageView.image == nil) {
        firstImage.imageView.image = [UIImage imageNamed:@"button-pick-image-10.png"];
    }
    [self countTimer];
    [self playMusic:@"timer-sound_mixdown" :@"wav" :YES];
    self.library = [[ALAssetsLibrary alloc] init];
    self.sharedData = [NSUserDefaults standardUserDefaults];
    self.totalImageCaptured = 1;
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(cameraIsReady:)
                                                 name:AVCaptureSessionDidStartRunningNotification object:nil];
}

- (void)cameraIsReady:(NSNotification *)notification
{
    NSLog(@"Camera is ready...");
    // Whatever
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)browse_file_1:(id)sender {
    [self backsoundPlay:@"doe-mee-button" :@"wav" :NO];
    [self pickImage:1];
    self.buttonSubmit.enabled = YES;
    self.buttonSubmit.imageView.image = [UIImage imageNamed:@"button-verder-active"];
}
/*
- (IBAction)browse_file_2:(id)sender {
    [self playMusic:@"doe-mee-button" :@"wav" :NO];
    [self pickImage:2];
}

- (IBAction)browse_file_3:(id)sender {
    [self playMusic:@"doe-mee-button" :@"wav" :NO];
    [self pickImage:3];
}
*/
- (IBAction)submitButton:(id)sender {
    [self playMusic:@"doe-mee-button" :@"wav" :NO];
    UIStoryboard *storyboard;
    storyboard = [UIStoryboard storyboardWithName:@"Ipad" bundle:nil];
    UIViewController *secondView = [self.storyboard instantiateViewControllerWithIdentifier:@"FourthView"];
    [self presentViewController:secondView animated:YES completion:nil];
}

- (void)pickImage:(int)buttonIndex {
    // Check if we have a camera
	if([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
	{
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        imagePicker.delegate = (id)self;
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
		imagePicker.showsCameraControls = YES;
        self.imagePicker = imagePicker;
        [self presentViewController:imagePicker animated:YES completion:nil];
	}
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *) picker {
    [picker dismissViewControllerAnimated:NO completion:nil];
}

- (void)changeThumbnail: (UIImage *)image {
    switch (self.totalImageCaptured) {
        case 1:
            firstImage.imageView.image = image;
            firstImage.imageView.contentMode = UIViewContentModeScaleAspectFit;
            break;
       /* case 2:
            secondImage.imageView.image = image;
            secondImage.imageView.contentMode = UIViewContentModeScaleAspectFit;
            break;
        case 3:
            thirdImage.imageView.image = image;
            thirdImage.imageView.contentMode = UIViewContentModeScaleAspectFit;
            break;*/
        default:
            break;
    }
}

- (void)imagePickerController:(UIImagePickerController *) picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    firstImage.enabled = NO;
    [self changeThumbnail:image];
    NSString *album = [NSString stringWithFormat:@"%@", self.personeelnummer];
    [self.library saveImage:image toAlbum:album withCompletionBlock:^(NSError *error) {
        if (error!=nil) {
            NSLog(@"Big error: %@", [error description]);
        }
    }];
    self.totalImageCaptured += 1;
    [self.sharedData setObject:album forKey:@"album"];
    self.buttonSubmit.enabled = YES;
    self.buttonSubmit.imageView.image = [UIImage imageNamed:@"button-verder-active"];
    [picker dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"%@", info);
}

- (void)backsoundPlay : (NSString *)fileName : (NSString *)fileType : (BOOL)loop {
    NSURL* musicFile = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                               pathForResource:fileName
                                               ofType:fileType]];
    self.backSound = [[AVAudioPlayer alloc] initWithContentsOfURL:musicFile error:nil];
    self.backSound.delegate = (id)self;
    [self.backSound prepareToPlay];
    [self.backSound play];
    self.backSound.volume = 0.5;
    if (loop) {
        self.backSound.numberOfLoops = -1;
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

@end
