//
//  DGSeventhViewController.m
//  dixonsgame
//
//  Created by Mahar Prasetio on 9/19/13.
//  Copyright (c) 2013 gaze. All rights reserved.
//

#import "DGSeventhViewController.h"
#import "AssetsLibrary/ALAssetRepresentation.h"
#import "ALAssetsLibrary+CustomPhotoAlbum.h"

@interface DGSeventhViewController ()
@property (strong, atomic) ALAssetsLibrary* library;
@property NSUserDefaults *sharedData;
@end

@implementation DGSeventhViewController

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
    self.textFeedback.delegate = self;
    self.library = [[ALAssetsLibrary alloc] init];
    self.sharedData = [NSUserDefaults standardUserDefaults];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonVideoClicked:(id)sender {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
	{
        UIImagePickerController *videoRecorder = [[UIImagePickerController alloc] init];
        videoRecorder.delegate = (id)self;
        videoRecorder.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        NSArray *mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
        NSArray *videoMediaTypesOnly = [mediaTypes filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"(SELF contains %@)", @"movie"]];
        
        if ([videoMediaTypesOnly count] == 0)		//Is movie output possible?
        {
            UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Sorry but your device does not support video recording"
                                                                     delegate:nil
                                                            cancelButtonTitle:@"OK"
                                                       destructiveButtonTitle:nil
                                                            otherButtonTitles:nil];
            [actionSheet showInView:[[self view] window]];
        }
        else
        {
            //Select front facing camera if possible
            if ([UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront])
                videoRecorder.cameraDevice = UIImagePickerControllerCameraDeviceFront;
            
            videoRecorder.mediaTypes = videoMediaTypesOnly;
            videoRecorder.videoQuality = UIImagePickerControllerQualityTypeMedium;
            videoRecorder.videoMaximumDuration = 60;			//Specify in seconds (600 is default)
            NSLog(@"HI THERE!!!!");
            [self presentViewController:videoRecorder animated:YES completion:nil];
        }
    }
    else
    {
        //No camera is availble
    }
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    NSString *album = [self.sharedData objectForKey:@"album"];
    if ([mediaType isEqualToString:@"public.movie"]){
        // Saving the video / // Get the new unique filename
        NSString *sourcePath = [[info objectForKey:@"UIImagePickerControllerMediaURL"]relativePath];
        NSURL *urlVideo = [info objectForKey:@"UIImagePickerControllerMediaURL"];
        MPMoviePlayerController *player = [[MPMoviePlayerController alloc] initWithContentURL:urlVideo];
        
        UIImage *thumbnail = [player thumbnailImageAtTime:1.0 timeOption:MPMovieTimeOptionNearestKeyFrame];
        self.buttonPickVideo.imageView.image = thumbnail;
        //Player autoplays audio on init
        [player stop];
        NSLog(@"%@", sourcePath);
//        UISaveVideoAtPathToSavedPhotosAlbum(sourcePath,nil,nil,nil);
        [self.library saveVideo:urlVideo toAlbum:album withCompletionBlock:^(NSError *error) {
            if (error!=nil) {
                NSLog(@"Big error: %@", [error description]);
            }
        }];
        NSLog(@"%@", info);
        NSLog(@"%@", album);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    textView.text = @"";
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    [self finishTheGame];
}


- (IBAction)buttonKlaarClicked:(id)sender {
    [self finishTheGame];
}

-(BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    NSLog(@"textViewShouldEndEditing");
    return TRUE;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    NSLog(@"shouldChangeTextInRange");
    // Any new character added is passed in as the "text" parameter
    if ([text isEqualToString:@"\n"])
    {
        [textView resignFirstResponder];
        return FALSE;
    }
    
    // For any other character return TRUE so that the text gets added to the view
    return TRUE;
}

- (void)finishTheGame {
    if ([self.textFeedback isEqual:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please fill the antwoord" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    [self.sharedData setObject:self.textFeedback.text forKey:@"feedback"];
    UIStoryboard *storyboard;
    storyboard = [UIStoryboard storyboardWithName:@"Ipad" bundle:nil];
    UIViewController *secondView = [self.storyboard instantiateViewControllerWithIdentifier:@"EigththView"];
    [self presentViewController:secondView animated:YES completion:nil];
}

@end
