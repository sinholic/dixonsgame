//
//  DGDataViewController.h
//  dixonsgame
//
//  Created by Mahar Prasetio on 9/20/13.
//  Copyright (c) 2013 gaze. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DGDataViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *listOfDataInTextView;
- (IBAction)doneViewList:(id)sender;
@end
