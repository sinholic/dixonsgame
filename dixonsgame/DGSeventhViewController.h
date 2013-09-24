//
//  DGSeventhViewController.h
//  dixonsgame
//
//  Created by Mahar Prasetio on 9/19/13.
//  Copyright (c) 2013 gaze. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>

@interface DGSeventhViewController : UIViewController </*UIImagePickerControllerDelegate, UIActionSheetDelegate,*/ UIAlertViewDelegate, UITextViewDelegate>
//- (IBAction)buttonVideoClicked:(id)sender;
- (IBAction)buttonKlaarClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *textFeedback;
//@property (weak, nonatomic) IBOutlet UIButton *buttonPickVideo;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;
@property (weak, nonatomic) IBOutlet UILabel *timeRemaining;

@end
