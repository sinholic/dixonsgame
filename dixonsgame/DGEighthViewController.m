//
//  DGEighthViewController.m
//  dixonsgame
//
//  Created by Mahar Prasetio on 9/19/13.
//  Copyright (c) 2013 gaze. All rights reserved.
//

#import "DGEighthViewController.h"
#import "DGDataViewController.h"

@interface DGEighthViewController ()
@property NSUserDefaults *sharedData;
@end

@implementation DGEighthViewController

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
    self.sharedData = [NSUserDefaults standardUserDefaults];
    NSString *productIdentifier = [self.sharedData objectForKey:@"productIdentifier"];
    NSLog(@"%@", productIdentifier);
    int intValueOfProductIndentifier = [productIdentifier intValue];
    if (intValueOfProductIndentifier == 2) {
        intValueOfProductIndentifier = 0;
    } else {
        intValueOfProductIndentifier += 1;
    }
    productIdentifier = [NSString stringWithFormat:@"%i",intValueOfProductIndentifier];
    NSLog(@"%@", productIdentifier);
    [self.sharedData setObject:productIdentifier forKey:@"productIdentifier"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonBackToStartClicked:(id)sender {
    NSString *textOnTextView =  [self.sharedData objectForKey:@"textOnDataView"];
    if ([textOnTextView isEqual:@""]) {
        textOnTextView = @"\n";
    }
    if ([[self.sharedData objectForKey:@"album"] isEqualToString:@""]) {
        [self.sharedData setObject:@"" forKey:@"album"];
    }
    NSString *textThatWillOnTextView = [NSString stringWithFormat:@"%@Personeel nummer : %@\nGeboordedatum : %@\nTotal correct answers : %@\nFeedback : %@\nMedia library folder : %@\n=========================\n",textOnTextView,[self.sharedData objectForKey:@"personeelnummer"], [self.sharedData objectForKey:@"geboortedatum"],[self.sharedData objectForKey:@"totalCorrectAnswers"], [self.sharedData objectForKey:@"feedback"], [self.sharedData objectForKey:@"album"]];
    [self.sharedData setObject:textThatWillOnTextView forKey:@"textOnDataView"];
    UIStoryboard *storyboard;
    storyboard = [UIStoryboard storyboardWithName:@"Ipad" bundle:nil];
    UIViewController *secondView = [self.storyboard instantiateViewControllerWithIdentifier:@"FirstView"];
    [self presentViewController:secondView animated:YES completion:nil];
}
@end
