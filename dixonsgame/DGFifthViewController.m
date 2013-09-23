//
//  DGFifthViewController.m
//  dixonsgame
//
//  Created by Mahar Prasetio on 9/17/13.
//  Copyright (c) 2013 gaze. All rights reserved.
//

#import "DGFifthViewController.h"
#import "DGSixthViewController.h"

@interface DGFifthViewController ()
@property NSTimer *countdownTimer;
@property int secondsCount;
@property int totalCorrectAnswer;
@property NSArray *productIpadDisplayName;
@property NSArray *productLaptopDisplayName;
@property NSArray *productDesktopDisplayName;
@property NSMutableArray *currentProductDisplayName;
@property NSMutableDictionary *currentCorrectProductAnswer;
@property NSDictionary *ipadProductSynonim;
@property NSDictionary *laptopProductSynonim;
@property NSDictionary *desktopProductSynonim;
@property NSMutableDictionary *currentProductSynonim;
@property NSNumber *totalScore;
@property AVAudioPlayer *soundPlayer;
@property AVAudioPlayer *clickPlayer;
@end

@implementation DGFifthViewController
@synthesize sharedData;

- (void)countTimer {
    self.secondsCount = 60;
    self.countdownTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerRun) userInfo:nil repeats:YES];
}

- (void)timerRun {
    self.secondsCount = self.secondsCount - 1;
    NSString *timeRemaining = [NSString stringWithFormat:@"%2d", self.secondsCount];
    self.timeRemaining.text = timeRemaining;
    if (self.secondsCount == 0) {
        [self.soundPlayer stop];
        UIStoryboard *storyboard;
        storyboard = [UIStoryboard storyboardWithName:@"Ipad" bundle:nil];
        DGSixthViewController *sixthViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SixthView"];
        sixthViewController.currentCorrectAnswerFromFifthView = self.currentCorrectProductAnswer;
        sixthViewController.currentProductDisplayNameFromFifthView = self.currentProductDisplayName;
        sixthViewController.totalCorrectAnswer = self.totalCorrectAnswer;
        sixthViewController.currentProductName = self.labelWhatProduct.text;
        [self presentViewController:sixthViewController animated:YES completion:nil];
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

- (void)clickSound : (NSString *)fileName : (NSString *)fileType {
    NSURL* musicFile = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                               pathForResource:fileName
                                               ofType:fileType]];
    self.clickPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:musicFile error:nil];
    self.clickPlayer.delegate = (id)self;
    [self.clickPlayer prepareToPlay];
    [self.clickPlayer play];
    self.clickPlayer.volume = 0.5;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)awakeFromNib {
    
    self.productIpadDisplayName = @[@"Apple tv",
                         @"Smart case",
                         @"Slip Case",
                         @"Keyboard cover",
                         @"Dock",
                         @"Adapters",
                         @"Cleaning kit",
                         @"Autolader",
                         @"Apple care",
                         @"Camera connection kit",
                         @"Screen protector",
                         @"Stylus pen",
                         @"Media Remote",
                         @"iTunes kaart",
                         @"USB cable",
                         @"AV cable",
                         @"VGA cable",
                         @"Earpods",
                         @"Speakers",
                         @"SD card reader"];
    
    self.ipadProductSynonim = @{@"appletv":@"0",
                                @"appletv":@"0",
                                @"apletv":@"0",
                                @"smartcase":@"1",
                                @"smartcover":@"1",
                                @"beschermhoes":@"1",
                                @"beschermhoezen":@"1",
                                @"case":@"1",
                                @"beschermhoes":@"1",
                                @"slipcase":@"2",
                                @"ipadcase":@"2",
                                @"sleeve":@"2",
                                @"hoes":@"2",
                                @"hoesje":@"2",
                                @"cover":@"2",
                                @"keyboardcover":@"3",
                                @"keyboardcovers":@"3",
                                @"toetsenbordcover":@"3",
                                @"touchcover":@"3",
                                @"keyboard":@"3",
                                @"toetsenbord":@"3",
                                @"dock":@"4",
                                @"ipaddock":@"4",
                                @"universaldock":@"4",
                                @"docking":@"4",
                                @"adapter":@"5",
                                @"oplader":@"5",
                                @"adaptor":@"5",
                                @"lightningkabel":@"5",
                                @"poweradapter":@"5",
                                @"adapter":@"5",
                                @"cleaningkit":@"6",
                                @"schoonmaakdoekjes":@"6",
                                @"clean":@"6",
                                @"schoonmaakkit":@"6",
                                @"spray":@"6",
                                @"screenspray":@"6",
                                @"autolader":@"7",
                                @"carcharger":@"7",
                                @"autooplader":@"7",
                                @"oplader":@"7",
                                @"autolader":@"7",
                                @"caradaptor":@"7",
                                @"verzekering":@"8",
                                @"appleondersteuning":@"8",
                                @"applesupport":@"8",
                                @"verzekering":@"8",
                                @"hfs":@"8",
                                @"applecare":@"8",
                                @"cameraconnectiekit":@"9",
                                @"cameraaansluiting":@"9",
                                @"connectionkit":@"9",
                                @"camera":@"9",
                                @"cameraconnection":@"9",
                                @"cameraconnectionkit":@"9",
                                @"screenprotector":@"10",
                                @"beschermfolie":@"10",
                                @"schermprotectie":@"10",
                                @"bescherming":@"10",
                                @"schermbeveiliging":@"10",
                                @"screenprotector":@"10",
                                @"styluspen":@"11",
                                @"touchscreenpen":@"11",
                                @"tabletpen":@"11",
                                @"ipadpen":@"11",
                                @"stylus":@"11",
                                @"pen":@"11",
                                @"mediaremote":@"12",
                                @"mediaafstandsbediening":@"12",
                                @"afstandsbediening":@"12",
                                @"remote":@"12",
                                @"mediaremote":@"12",
                                @"ituneskaart":@"13",
                                @"applekaart":@"13",
                                @"itunesgiftcard":@"13",
                                @"itunes":@"13",
                                @"ituneskaart":@"13",
                                @"usbkabel":@"14",
                                @"usbcable":@"14",
                                @"usbkabelaansluiting":@"14",
                                @"usb":@"14",
                                @"kabels":@"14",
                                @"kabel":@"14",
                                @"avkabel":@"15",
                                @"avcable":@"15",
                                @"videokabel":@"15",
                                @"digitaleavkabel":@"15",
                                @"av":@"15",
                                @"avcable":@"15",
                                @"vgakabel":@"16",
                                @"vgacable":@"16",
                                @"vgaadapter":@"16",
                                @"vgaadapter":@"16",
                                @"vga":@"16",
                                @"vagkabel":@"17",
                                @"koptelefoon":@"17",
                                @"oordopjes":@"17",
                                @"hoofdtelefoon":@"17",
                                @"headset":@"17",
                                @"earpods":@"17",
                                @"earphones":@"17",
                                @"speakers":@"18",
                                @"luidsprekers":@"18",
                                @"stereospeakers":@"18",
                                @"boxen":@"18",
                                @"geluidsboxen":@"18",
                                @"speakerdock":@"19",
                                @"sdcardreader":@"19",
                                @"sdkaartlezer":@"19",
                                @"kaartlezer":@"19",
                                @"sdreader":@"19",
                                @"sd":@"19",
                                @"sdcardreader":@"19"};
                                
    self.productLaptopDisplayName = @[@"Adapter",
                                      @"Antivirus",
                                      @"Autolader",
                                      @"Cooler",
                                      @"Externe harde schijf",
                                      @"Geheugen",
                                      @"hoofdtelefoon",
                                      @"Kabels (VGA / USB / AV)",
                                      @"Muis",
                                      @"Office",
                                      @"Printer / scanner",
                                      @"Screen cleaner",
                                      @"Software",
                                      @"Speakers",
                                      @"Standaard",
                                      @"Tas",
                                      @"Toetsenbord",
                                      @"USB stick",
                                      @"Verzekering",
                                      @"Webcam"];
    
    self.laptopProductSynonim = @{@"adapter":@"0",
                                  @"oplader":@"0",
                                  @"oplaadkabel":@"0",
                                  @"notebookoplader":@"0",
                                  @"notebookadapter":@"0",
                                  @"antivirus":@"1",
                                  @"pcprotection":@"1",
                                  @"internetsecurity":@"1",
                                  @"norton":@"1",
                                  @"virusbescherming":@"1",
                                  @"beveiliging":@"1",
                                  @"autolader":@"2",
                                  @"carcharger":@"2",
                                  @"autooplader":@"2",
                                  @"cooler":@"3",
                                  @"koeler":@"3",
                                  @"computercooling":@"3",
                                  @"computerkoelers":@"3",
                                  @"externehardeschijf":@"4",
                                  @"externharddisk":@"4",
                                  @"externeopslag":@"4",
                                  @"draagbareopslag":@"4",
                                  @"hdd":@"4",
                                  @"opslag":@"4",
                                  @"storage":@"4",
                                  @"harddisk":@"4",
                                  @"netwerkschijf":@"4",
                                  @"geheugen":@"5",
                                  @"memory":@"5",
                                  @"interngeheugen":@"5",
                                  @"werkgeheugen":@"5",
                                  @"hoofdtelefoon":@"6",
                                  @"headphone":@"6",
                                  @"koptelefoon":@"6",
                                  @"headset":@"6",
                                  @"oordopjes":@"6",
                                  @"oordoppen":@"6",
                                  @"kabelsvgausbav":@"7",
                                  @"kabel":@"7",
                                  @"vgakabel":@"7",
                                  @"avkabel":@"7",
                                  @"hdmi":@"7",
                                  @"usbkabel":@"7",
                                  @"usbcable":@"7",
                                  @"usb":@"7",
                                  @"vga":@"7",
                                  @"muis":@"8",
                                  @"mouse":@"8",
                                  @"computermuis":@"8",
                                  @"lasermuis":@"8",
                                  @"wirelessmuis":@"8",
                                  @"wirelessmouse":@"8",
                                  @"office":@"9",
                                  @"microsoftoffice":@"9",
                                  @"word":@"9",
                                  @"excel":@"9",
                                  @"officeproffesional":@"9",
                                  @"office365":@"9",
                                  @"microsoftoffice365":@"9",
                                  @"printerscanner":@"10",
                                  @"laserprinter":@"10",
                                  @"allinoneprinter":@"10",
                                  @"printer":@"10",
                                  @"inktjetprinter":@"10",
                                  @"scanner":@"10",
                                  @"screencleaner":@"11",
                                  @"schermreiniger":@"11",
                                  @"schermreinigen":@"11",
                                  @"schermbeveiliging":@"11",
                                  @"schermbeveiliging":@"11",
                                  @"software":@"12",
                                  @"adobe":@"12",
                                  @"microsoftwindows":@"12",
                                  @"windows7":@"12",
                                  @"windows8":@"12",
                                  @"photoshop":@"12",
                                  @"nero":@"12",
                                  @"speakers":@"13",
                                  @"luidsprekers":@"13",
                                  @"stereo":@"13",
                                  @"boxen":@"13",
                                  @"geluidsboxen":@"13",
                                  @"draadlozespeakers":@"13",
                                  @"speakerset":@"13",
                                  @"standaard":@"14",
                                  @"stand":@"14",
                                  @"notebookstandaard":@"14",
                                  @"tas":@"15",
                                  @"laptoptas":@"15",
                                  @"hoes":@"15",
                                  @"beschermtas":@"15",
                                  @"bag":@"15",
                                  @"sleeve":@"15",
                                  @"toetsenbord":@"16",
                                  @"keyboard":@"16",
                                  @"toetsenbord":@"16",
                                  @"usbstick":@"17",
                                  @"usb":@"17",
                                  @"flashdrive":@"17",
                                  @"drive":@"17",
                                  @"opslag":@"17",
                                  @"verzekering":@"18",
                                  @"notebookverzekering":@"18",
                                  @"notebookdekking":@"18",
                                  @"hfs":@"18",
                                  @"applecare":@"18",
                                  @"insurance":@"18",
                                  @"webcam":@"19",
                                  @"webcamera":@"19",
                                  @"gopro":@"19",
                                  @"gopro":@"19"};
    
    self.productDesktopDisplayName = @[@"Antivirus",
                                       @"Beeldscherm",
                                       @"Dvd brander",
                                       @"Externe harde schijf",
                                       @"Games",
                                       @"hoofdtelefoon",
                                       @"Kabels",
                                       @"Media speler",
                                       @"Modem",
                                       @"Muis",
                                       @"Office",
                                       @"Printer",
                                       @"Router",
                                       @"Scanner",
                                       @"Software",
                                       @"Speakers",
                                       @"SSD",
                                       @"Toetsenbord",
                                       @"Verzekering",
                                       @"Webcam"];
    
    self.desktopProductSynonim = @{@"antivirus":@"0",
                                   @"pcprotection":@"0",
                                   @"internetsecurity":@"0",
                                   @"norton":@"0",
                                   @"virusbescherming":@"0",
                                   @"beveiliging":@"0",
                                   @"nortonantivirus":@"0",
                                   @"beeldscherm":@"1",
                                   @"monitor":@"1",
                                   @"display":@"1",
                                   @"computerscherm":@"1",
                                   @"computerbeeldscherm":@"1",
                                   @"scherm":@"1",
                                   @"dvdbrander":@"2",
                                   @"cdbrander":@"2",
                                   @"dvdbrander":@"2",
                                   @"dvdwriter":@"2",
                                   @"externedvdbrander":@"2",
                                   @"externecdbrander":@"2",
                                   @"dvdburner":@"2",
                                   @"externehardeschijf":@"3",
                                   @"externharddisk":@"3",
                                   @"externeopslag":@"3",
                                   @"draagbareopslag":@"3",
                                   @"hdd":@"3",
                                   @"externehdd":@"5",
                                   @"storage":@"3",
                                   @"harddisk":@"3",
                                   @"netwerkschijf":@"3",
                                   @"games":@"4",
                                   @"spellen":@"4",
                                   @"computerspellen":@"4",
                                   @"computergame":@"4",
                                   @"spel":@"4",
                                   @"hoofdtelefoon":@"5",
                                   @"headphone":@"5",
                                   @"koptelefoon":@"5",
                                   @"headset":@"5",
                                   @"oordopjes":@"5",
                                   @"oordoppen":@"5",
                                   @"kabels":@"6",
                                   @"cable":@"6",
                                   @"kabel":@"6",
                                   @"usbkabel":@"6",
                                   @"usbcable":@"6",
                                   @"hdmi":@"6",
                                   @"hdmikabel":@"6",
                                   @"vgakabel":@"6",
                                   @"vga":@"6",
                                   @"mediaspeler":@"7",
                                   @"mediaplayer":@"7",
                                   @"mediabox":@"7",
                                   @"xtreamertv":@"7",
                                   @"mediaspeler":@"7",
                                   @"mediaplayer":@"7",
                                   @"modem":@"8",
                                   @"modems":@"8",
                                   @"muis":@"9",
                                   @"mouse":@"9",
                                   @"draadlozemuis":@"9",
                                   @"lasermuis":@"9",
                                   @"wirelessmuis":@"9",
                                   @"wirelessmouse":@"9",
                                   @"office":@"10",
                                   @"microsoftoffice":@"10",
                                   @"word":@"10",
                                   @"excel":@"10",
                                   @"officeproffesional":@"10",
                                   @"office365":@"10",
                                   @"microsoftoffice365":@"10",
                                   @"printer":@"11",
                                   @"laserprinter":@"11",
                                   @"allinoneprinter":@"11",
                                   @"inktjetprinter":@"11",
                                   @"router":@"12",
                                   @"wirelessrouter":@"12",
                                   @"modemrouter":@"12",
                                   @"scanner":@"13",
                                   @"computerscanner":@"13",
                                   @"pcscanner":@"13",
                                   @"software":@"14",
                                   @"adobe":@"14",
                                   @"microsoftwindows":@"14",
                                   @"windows7":@"14",
                                   @"windows8":@"14",
                                   @"photoshop":@"14",
                                   @"nero":@"14",
                                   @"adobepremiere":@"14",
                                   @"speakers":@"15",
                                   @"luidsprekers":@"15",
                                   @"stereo":@"15",
                                   @"stereoluidsprekers":@"15",
                                   @"geluidsboxen":@"15",
                                   @"boxen":@"15",
                                   @"ssd":@"16",
                                   @"ssdharddisk":@"16",
                                   @"solidstatedrive":@"16",
                                   @"electronischeschijf":@"16",
                                   @"ssdgeheugen":@"16",
                                   @"toetsenbord":@"17",
                                   @"keyboard":@"17",
                                   @"verzekering":@"18",
                                   @"hfs":@"18",
                                   @"insurance":@"18",
                                   @"applecare":@"18",
                                   @"webcam":@"19",
                                   @"webcamera":@"19",
                                   @"gopro":@"19",
                                   @"gopro":@"19",
                                   @"webcame":@"19"};
}


- (void)clearData {
    [self.currentCorrectProductAnswer removeAllObjects];
    [self.currentProductSynonim removeAllObjects];
    [self.currentProductDisplayName removeAllObjects];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self playMusic:@"timer-sound_mixdown" :@"wav" :YES];
    self.currentCorrectProductAnswer = [[NSMutableDictionary alloc] init];
    self.currentProductDisplayName = [[NSMutableArray alloc] init];
    self.currentProductSynonim = [[NSMutableDictionary alloc] init];
    sharedData = [NSUserDefaults standardUserDefaults];
    [self clearData];
    [self countTimer];
    [self.textFieldInputText becomeFirstResponder];
    self.buttonCheckText.enabled = NO;
    NSLog(@"productIdentifier : %@", [sharedData objectForKey:@"productIdentifier"]);
    if ([[sharedData objectForKey:@"productIdentifier"] isEqual:@"0"]) {
        self.productImage.image = [UIImage imageNamed:@"product-ipad"];
        [self.currentProductDisplayName addObjectsFromArray:self.productIpadDisplayName];
        [self.currentProductSynonim addEntriesFromDictionary:self.ipadProductSynonim];
        self.labelWhatProduct.text = @"Ipad";
    }
    if ([[sharedData objectForKey:@"productIdentifier"] isEqual:@"1"]) {
        self.productImage.image = [UIImage imageNamed:@"product-laptop"];
        [self.currentProductDisplayName addObjectsFromArray:self.productLaptopDisplayName];
        [self.currentProductSynonim addEntriesFromDictionary:self.laptopProductSynonim];
        self.labelWhatProduct.text = @"Notebook";
    }
    if ([[sharedData objectForKey:@"productIdentifier"] isEqual:@"2"]) {
        self.productImage.image = [UIImage imageNamed:@"product-desktop"];
        [self.currentProductDisplayName addObjectsFromArray:self.productDesktopDisplayName];
        [self.currentProductSynonim addEntriesFromDictionary:self.desktopProductSynonim];
        self.labelWhatProduct.text = @"Desktop";
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

- (IBAction)textFieldEditBegin:(id)sender {
    self.buttonCheckText.enabled = YES;
}

- (IBAction)buttonCheckClicked:(id)sender {
    [self checkText];
    self.textFieldInputText.text = @"";
    [self performSelector:@selector(MykeyBoardUp) withObject:nil afterDelay:0.0];
}

- (IBAction)textFieldFinished:(id)sender {
    [self checkText];
    self.textFieldInputText.text = @"";
    [self performSelector:@selector(MykeyBoardUp) withObject:nil afterDelay:0.0];
}

- (NSString *)trimText : str{
    NSMutableCharacterSet *charactersToKeep = [NSMutableCharacterSet alphanumericCharacterSet];
    NSCharacterSet *charactersToRemove = [charactersToKeep invertedSet];
    NSString *trimmedReplacement = [[ str componentsSeparatedByCharactersInSet:charactersToRemove] componentsJoinedByString:@"" ];
    return trimmedReplacement;
}

-(void)checkText {
    NSString *string = [self.textFieldInputText.text lowercaseString];
    NSLog(@"to trim: %@",string);
    string = [self trimText:string];
    NSLog(@"to check: %@",string);
    if ([self.currentProductSynonim objectForKey:string]) {
        [self clickSound:@"true-answer" :@"wav"];
        int index = [[self.currentProductSynonim objectForKey:string] intValue];
        [self.currentCorrectProductAnswer setObject:@"true" forKey:[self.currentProductDisplayName objectAtIndex: index]];
        self.totalCorrectAnswer += 1;
        NSLog(@"index : %@", [self.currentProductSynonim objectForKey:string]);
        NSLog(@"object at index : %@", [self.currentProductDisplayName objectAtIndex: index]);
        [self putDataToLabel:[self.currentProductDisplayName objectAtIndex: index] :index];
    } else {
        NSLog(@"string : %@",[self.currentProductSynonim objectForKey:string]);
        [self clickSound:@"false-answer" :@"wav"];
        [self shakeView:self.view];
    }
}

- (void)shakeView:(UIView *)viewToShake
{
    CGFloat t = 2.0;
    CGAffineTransform translateRight  = CGAffineTransformTranslate(CGAffineTransformIdentity, t, 0.0);
    CGAffineTransform translateLeft = CGAffineTransformTranslate(CGAffineTransformIdentity, -t, 0.0);
    
    viewToShake.transform = translateLeft;
    
    [UIView animateWithDuration:0.07 delay:0.0 options:UIViewAnimationOptionAutoreverse|UIViewAnimationOptionRepeat animations:^{
        [UIView setAnimationRepeatCount:2.0];
        viewToShake.transform = translateRight;
    } completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:0.05 delay:0.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
                viewToShake.transform = CGAffineTransformIdentity;
            } completion:NULL];
        }
    }];
}

- (void)putDataToLabel:(NSString *)textString :(int)indexOfArray {
    switch (indexOfArray) {
        case 0:
            self.labelProductName1.text = [NSString stringWithFormat:@"%@", textString];
            break;
        case 1:
            self.labelProductName2.text = [NSString stringWithFormat:@"%@", textString];
            break;
        case 2:
            self.labelProductName3.text = [NSString stringWithFormat:@"%@", textString];
            break;
        case 3:
            self.labelProductName4.text = [NSString stringWithFormat:@"%@", textString];
            break;
        case 4:
            self.labelProductName5.text = [NSString stringWithFormat:@"%@", textString];
            break;
        case 5:
            self.labelProductName6.text = [NSString stringWithFormat:@"%@", textString];
            break;
        case 6:
            self.labelProductName7.text = [NSString stringWithFormat:@"%@", textString];
            break;
        case 7:
            self.labelProductName8.text = [NSString stringWithFormat:@"%@", textString];
            break;
        case 8:
            self.labelProductName9.text = [NSString stringWithFormat:@"%@", textString];
            break;
        case 9:
            self.labelProductName10.text = [NSString stringWithFormat:@"%@", textString];
            break;
        case 10:
            self.labelProductName11.text = [NSString stringWithFormat:@"%@", textString];
            break;
        case 11:
            self.labelProductName12.text = [NSString stringWithFormat:@"%@", textString];
            break;
        case 12:
            self.labelProductName13.text = [NSString stringWithFormat:@"%@", textString];
            break;
        case 13:
            self.labelProductName14.text = [NSString stringWithFormat:@"%@", textString];
            break;
        case 14:
            self.labelProductName15.text = [NSString stringWithFormat:@"%@", textString];
            break;
        case 15:
            self.labelProductName16.text = [NSString stringWithFormat:@"%@", textString];
            break;
        case 16:
            self.labelProductName17.text = [NSString stringWithFormat:@"%@", textString];
            break;
        case 17:
            self.labelProductName18.text = [NSString stringWithFormat:@"%@", textString];
            break;
        case 18:
            self.labelProductName19.text = [NSString stringWithFormat:@"%@", textString];
            break;
        case 19:
            self.labelProductName20.text = [NSString stringWithFormat:@"%@", textString];
            break;
        default:
            break;
    }
}

-(void)MykeyBoardUp{
    
    [self.textFieldInputText becomeFirstResponder];
    
}

@end
