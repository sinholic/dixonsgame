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
@property int totalImageCaptured;
@property (nonatomic, strong) UIPopoverController *popOver;
@property (strong, atomic) ALAssetsLibrary* library;
@property AVAudioPlayer *soundPlayer;
@property NSUserDefaults *sharedData;

@end

@implementation DGThirdViewController
@synthesize firstImage, secondImage, thirdImage, popOver, library;

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
    self.library = [[ALAssetsLibrary alloc] init];
    self.sharedData = [NSUserDefaults standardUserDefaults];
    self.totalImageCaptured = 1;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)browse_file_1:(id)sender {
    [self playMusic:@"doe-mee-button" :@"wav" :NO];
    [self pickImage:1];
    self.buttonSubmit.enabled = YES;
    self.buttonSubmit.imageView.image = [UIImage imageNamed:@"button-verder-active"];
}

- (IBAction)browse_file_2:(id)sender {
    [self playMusic:@"doe-mee-button" :@"wav" :NO];
    [self pickImage:2];
}

- (IBAction)browse_file_3:(id)sender {
    [self playMusic:@"doe-mee-button" :@"wav" :NO];
    [self pickImage:3];
}

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
        case 2:
            secondImage.imageView.image = image;
            secondImage.imageView.contentMode = UIViewContentModeScaleAspectFit;
            break;
        case 3:
            thirdImage.imageView.image = image;
            thirdImage.imageView.contentMode = UIViewContentModeScaleAspectFit;
            break;
        default:
            break;
    }
}

- (void)imagePickerController:(UIImagePickerController *) picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    [self changeThumbnail:image];
    NSString *album = [NSString stringWithFormat:@"%@", self.personeelnummer];
    [self.library saveImage:image toAlbum:album withCompletionBlock:^(NSError *error) {
        if (error!=nil) {
            NSLog(@"Big error: %@", [error description]);
        }
    }];
    [picker dismissViewControllerAnimated:YES completion:nil];
    self.totalImageCaptured += 1;
    [self.sharedData setObject:album forKey:@"album"];
    self.buttonSubmit.enabled = YES;
    self.buttonSubmit.imageView.image = [UIImage imageNamed:@"button-verder-active"];
    NSLog(@"%@", info);
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
