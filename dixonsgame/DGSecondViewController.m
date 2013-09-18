//
//  DGSecondViewController.m
//  dixonsgame
//
//  Created by Mahar Prasetio on 9/17/13.
//  Copyright (c) 2013 gaze. All rights reserved.
//

#import "DGSecondViewController.h"
#import "MBProgressHUD.h"

@interface DGSecondViewController ()
@property (nonatomic, strong) UIPopoverController *popOver;
@property NSMutableArray *listOfFilePath;
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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)browse_file_1:(id)sender {
    self.firstImage.text = @"";
    [self pickImage:1];
}

- (IBAction)browse_file_2:(id)sender {
    self.secondImage.text = @"";
    [self pickImage:2];
}

- (IBAction)browse_file_3:(id)sender {
    self.thirdImage.text = @"";
    [self pickImage:3];
}

- (IBAction)submitButton:(id)sender {
    [self moveFile];
    UIStoryboard *storyboard;
    storyboard = [UIStoryboard storyboardWithName:@"Ipad" bundle:nil];
    UIViewController *secondView = [self.storyboard instantiateViewControllerWithIdentifier:@"ThirdView"];
    [self presentViewController:secondView animated:YES completion:nil];
}



- (void)moveFile {
    NSFileManager *filemgr;
    filemgr = [NSFileManager defaultManager];

    for (int i = 0; i < self.listOfFilePath.count; i++) {
        [filemgr moveItemAtPath: [self.listOfFilePath objectAtIndex:i] toPath: [NSString stringWithFormat:@"/%@/%@.png", self.name.text,[self.listOfFilePath objectAtIndex:i]] error: NULL] ;
    }
}

- (void)pickImage:(int)buttonIndex {
    // Check if we have a camera
	if([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
	{
		UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                      initWithTitle:NSLocalizedString(@"Kies een foto",nil)
                                      delegate:(id)self
                                      cancelButtonTitle:NSLocalizedString(@"Annuleer",nil)
                                      destructiveButtonTitle:nil
                                      otherButtonTitles:NSLocalizedString(@"Maak foto",nil), NSLocalizedString(@"Kies foto",nil), nil];
        
		[actionSheet showInView:self.view];
	} else {
		UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
            UIPopoverController *popover = [[UIPopoverController alloc] initWithContentViewController:imagePicker];
            switch (buttonIndex) {
                case 1:
                [popover presentPopoverFromRect:self.firstImage.bounds inView:self.firstImage permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
                    break;
                case 2:
                    [popover presentPopoverFromRect:self.secondImage.bounds inView:self.secondImage permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
                    break;
                case 3:
                    [popover presentPopoverFromRect:self.thirdImage.bounds inView:self.thirdImage permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
                    break;
                default:
                    break;
            }
            self.popOver = popover;
        } else {
            [self presentViewController:imagePicker animated:YES completion:nil];
        }
        imagePicker.delegate = (id)self;
	}
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = (id)self;
    
    if(buttonIndex == 0) {
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
		imagePicker.showsCameraControls = YES;
        
    } else if (buttonIndex == 1) {
        //from gallery
    }
    [self presentViewController:imagePicker animated:YES completion:nil];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *) picker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *) picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    self.listOfFilePath = [[NSMutableArray alloc] init];

    
    // get current date
    NSDate *now = [NSDate date];
    
    //obtaining saving path
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *fileName = [NSString stringWithFormat:@"IMG-%@.png",now];
    NSString *imagePath = [documentsDirectory stringByAppendingPathComponent:fileName];
    
    //extracting image from the picker and saving it
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    if ([mediaType isEqualToString:@"public.image"]){
        UIImage *editedImage = [info objectForKey:UIImagePickerControllerEditedImage];
        NSData *webData = UIImagePNGRepresentation(editedImage);
        [webData writeToFile:imagePath atomically:YES];
    }
    if (self.firstImage.text != NULL) {
        self.firstImage.text = imagePath;
        [self.listOfFilePath addObject:fileName];
        NSLog(imagePath);
    } else if (self.secondImage.text != NULL) {
        self.secondImage.text = imagePath;
        [self.listOfFilePath addObject:fileName];
    } else if (self.thirdImage.text != NULL) {
        self.thirdImage.text = imagePath;
        [self.listOfFilePath addObject:fileName];
    }
//	[UIImageJPEGRepresentation(imageView.image, 1.0) writeToFile:jpgPath atomically:YES];
}

@end
