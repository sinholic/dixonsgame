//
//  DGSecondViewController.h
//  dixonsgame
//
//  Created by Mahar Prasetio on 9/17/13.
//  Copyright (c) 2013 gaze. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DGSecondViewController : UIViewController
- (IBAction)browse_file_1:(id)sender;
- (IBAction)browse_file_2:(id)sender;
- (IBAction)browse_file_3:(id)sender;
- (IBAction)submitButton:(id)sender;
@property (nonatomic) IBOutlet UIButton *firstImage;
@property (nonatomic) IBOutlet UIButton *secondImage;
@property (nonatomic) IBOutlet UIButton *thirdImage;
@end
