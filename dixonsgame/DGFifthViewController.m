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
                                @"smartcase":@"1",
                                @"smartcover":@"1",
                                @"beschermhoes":@"1",
                                @"beschermhoezen":@"1",
                                @"case":@"1",
                                @"smartcover":@"1",
                                @"smartcase":@"1",
                                @"hoesje":@"1",
                                @"hoes":@"1",
                                @"sleeve":@"1",
                                @"slipcase":@"2",
                                @"ipadcase":@"2",
                                @"slipcase":@"2",
                                @"keyboardcover":@"3",
                                @"keyboardcovers":@"3",
                                @"toetsenbordcover":@"3",
                                @"touchcover":@"3",
                                @"touchcoverkeyboard":@"3",
                                @"toetsenbord":@"3",
                                @"keyboard":@"3",
                                @"dock":@"4",
                                @"ipaddock":@"4",
                                @"universaldock":@"4",
                                @"dockingstation":@"4",
                                @"adapters":@"5",
                                @"oplader":@"5",
                                @"oplaadkabel":@"5",
                                @"lightningkabel":@"5",
                                @"poweradapter":@"5",
                                @"adapter":@"5",
                                @"adaptor":@"5",
                                @"adaptors":@"5",
                                @"lader":@"5",
                                @"charger":@"5",
                                @"cleaningkit":@"6",
                                @"schoonmaakdoekjes":@"6",
                                @"clean":@"6",
                                @"schoonmaakkit":@"6",
                                @"schoonmaakdoekje":@"6",
                                @"schoonmaakdoekjes":@"6",
                                @"autolader":@"7",
                                @"carcharger":@"7",
                                @"autooplader":@"7",
                                @"autolader":@"7",
                                @"caradapter":@"7",
                                @"caradaptor":@"7",
                                @"applecare":@"8",
                                @"appleondersteuning":@"8",
                                @"applesupport":@"8",
                                @"verzekering":@"8",
                                @"hfs":@"8",
                                @"insurance":@"8",
                                @"cameraconnectionkit":@"9",
                                @"cameraaansluiting":@"9",
                                @"connectionkit":@"9",
                                @"camera":@"9",
                                @"cameraconnectiekit":@"9",
                                @"camerakit":@"9",
                                @"screenprotector":@"10",
                                @"beschermfolie":@"10",
                                @"schermprotectie":@"10",
                                @"bescherming":@"10",
                                @"schermbeveiliging":@"10",
                                @"schermhoes":@"10",
                                @"screenprotector":@"10",
                                @"styluspen":@"11",
                                @"touchscreenpen":@"11",
                                @"tabletpen":@"11",
                                @"ipadpen":@"11",
                                @"styluspen":@"11",
                                @"pen":@"11",
                                @"stylus":@"11",
                                @"mediaremote":@"12",
                                @"mediaafstandsbediening":@"12",
                                @"afstandsbediening":@"12",
                                @"remote":@"12",
                                @"mediaremote":@"12",
                                @"ituneskaart":@"13",
                                @"applekaart":@"13",
                                @"itunesgiftcard":@"13",
                                @"itunes":@"13",
                                @"itunes":@"13",
                                @"itunescard":@"13",
                                @"usbcable":@"14",
                                @"usbkabel":@"14",
                                @"usbkabelaansluiting":@"14",
                                @"usb":@"14",
                                @"avcable":@"15",
                                @"avkabel":@"15",
                                @"videokabel":@"15",
                                @"digitaleavkabel":@"15",
                                @"av":@"15",
                                @"vgacable":@"16",
                                @"vgakabel":@"16",
                                @"applenaarvgaadapter":@"16",
                                @"vgaadapter":@"16",
                                @"vga":@"16",
                                @"vagkabel":@"16",
                                @"earpods":@"17",
                                @"oordopjes":@"17",
                                @"koptelefoon":@"17",
                                @"headset":@"17",
                                @"hoofdtelefoon":@"17",
                                @"headphone":@"17",
                                @"earphones":@"17",
                                @"speakers":@"18",
                                @"luidsprekers":@"18",
                                @"stereospeakers":@"18",
                                @"stereoluidsprekers":@"18",
                                @"geluidsboxen":@"18",
                                @"speakerdock":@"18",
                                @"draadlozespeakers":@"18",
                                @"sdcardreader":@"19",
                                @"sdkaartlezer":@"19",
                                @"kaartlezer":@"19",
                                @"sdreader":@"19",
                                @"sd":@"19",
                                @"sdcardreader":@"19",
                                @"kaartreader":@"19",
                                @"cardreader":@"19",
                                @"memorycardlezer":@"19",
                                @"memorykaartadapter":@"19"};
                                
    self.productLaptopDisplayName = @[@"Muis",
                                      @"Toetsenbord",
                                      @"Tas",
                                      @"Geheugen",
                                      @"Externe harde schijf",
                                      @"Cooler",
                                      @"Standaard",
                                      @"Verzekering",
                                      @"Adapter",
                                      @"Screen cleaner",
                                      @"Printer / scanner",
                                      @"USB stick",
                                      @"Speakers",
                                      @"Antivirus",
                                      @"Office",
                                      @"Games",
                                      @"Autolader",
                                      @"Webcam",
                                      @"Oordopjes",
                                      @"Cable (VGA / USB / AV)"];
    
    self.laptopProductSynonim = @{@"muis":@"0",
                                  @"mouse":@"0",
                                  @"computermuis":@"0",
                                  @"lasermuis":@"0",
                                  @"wirelessmuis":@"0",
                                  @"wirelessmouse":@"0",
                                  @"draadlozemuis":@"0",
                                  @"toetsenbord":@"1",
                                  @"keyboard":@"1",
                                  @"tas":@"2",
                                  @"laptoptas":@"2",
                                  @"hoes":@"2",
                                  @"beschermtas":@"2",
                                  @"bag":@"2",
                                  @"sleeve":@"2",
                                  @"hoesje":@"2",
                                  @"cover":@"2",
                                  @"geheugen":@"3",
                                  @"memory":@"3",
                                  @"interngeheugen":@"3",
                                  @"werkgeheugen":@"3",
                                  @"externehardeschijf":@"4",
                                  @"externharddisk":@"4",
                                  @"externeopslag":@"4",
                                  @"draagbareopslag":@"4",
                                  @"externehdd":@"4",
                                  @"hdd":@"4",
                                  @"externedisk":@"4",
                                  @"opslag":@"4",
                                  @"storage":@"4",
                                  @"harddisk":@"4",
                                  @"draadlozeharddisk":@"4",
                                  @"draadlozedisk":@"4",
                                  @"draadlozehdd":@"4",
                                  @"netwerkhdd":@"4",
                                  @"netwerkschijf":@"4",
                                  @"cooler":@"5",
                                  @"koeler":@"5",
                                  @"computercooling":@"5",
                                  @"computerkoelers":@"5",
                                  @"standaard":@"6",
                                  @"stand":@"6",
                                  @"notebookstandaard":@"6",
                                  @"laptopstand":@"6",
                                  @"verzekering":@"7",
                                  @"notebookverzekering":@"7",
                                  @"notebookdekking":@"7",
                                  @"applecare":@"7",
                                  @"hfs":@"7",
                                  @"insurance":@"7",
                                  @"adapter":@"8",
                                  @"oplader":@"8",
                                  @"oplaadkabel":@"8",
                                  @"notebookoplader":@"8",
                                  @"notebookadapter":@"8",
                                  @"adaptor":@"8",
                                  @"lader":@"8",
                                  @"charger":@"8",
                                  @"screencleaner":@"9",
                                  @"schermreiniger":@"9",
                                  @"schermreinigen":@"9",
                                  @"cleaningkit":@"9",
                                  @"schoonmaakdoekje":@"9",
                                  @"schoonmaakkit":@"9",
                                  @"schoonmaakdoekjes":@"9",
                                  @"printerscanner":@"10",
                                  @"laserprinter":@"10",
                                  @"allinoneprinter":@"10",
                                  @"printer":@"10",
                                  @"inktjetprinter":@"10",
                                  @"scanner":@"10",
                                  @"usbstick":@"11",
                                  @"usb":@"11",
                                  @"flashdrive":@"11",
                                  @"drive":@"11",
                                  @"speakers":@"12",
                                  @"luidsprekers":@"12",
                                  @"stereo":@"12",
                                  @"boxen":@"12",
                                  @"geluidsboxen":@"12",
                                  @"draadlozespeakers":@"12",
                                  @"boxjes":@"12",
                                  @"antivirus":@"13",
                                  @"pcprotection":@"13",
                                  @"internetsecurity":@"13",
                                  @"norton":@"13",
                                  @"virusbescherming":@"13",
                                  @"beveiliging":@"13",
                                  @"antivirus":@"13",
                                  @"nortonantivirus":@"13",
                                  @"office":@"14",
                                  @"microsoftoffice":@"14",
                                  @"word":@"14",
                                  @"excel":@"14",
                                  @"officeproffesional":@"14",
                                  @"0ffice365":@"14",
                                  @"microsoftoffice365":@"14",
                                  @"officeprofessional":@"14",
                                  @"officepro":@"14",
                                  @"games":@"15",
                                  @"spellen":@"15",
                                  @"computerspellen":@"15",
                                  @"computergame":@"15",
                                  @"spel":@"15",
                                  @"computerspel":@"15",
                                  @"autolader":@"16",
                                  @"carcharger":@"16",
                                  @"autooplader":@"16",
                                  @"autolader":@"16",
                                  @"caradapter":@"16",
                                  @"caradaptor":@"16",
                                  @"webcam":@"17",
                                  @"webcamera":@"17",
                                  @"gopro":@"17",
                                  @"gopro":@"17",
                                  @"oordopjes":@"18",
                                  @"headphone":@"18",
                                  @"koptelefoon":@"18",
                                  @"headset":@"18",
                                  @"hoofdtelefoon":@"18",
                                  @"earpods":@"18",
                                  @"earphones":@"18",
                                  @"cablevgausbav":@"19",
                                  @"kabel":@"19",
                                  @"vgakabel":@"19",
                                  @"avkabel":@"19",
                                  @"hdmi":@"19",
                                  @"usbkabel":@"19",
                                  @"usbcable":@"19"};
    
    self.productDesktopDisplayName = @[@"Muis",
                                       @"Toetsenbord",
                                       @"Printer",
                                       @"Scanner",
                                       @"Speakers",
                                       @"Headset",
                                       @"Verzekering",
                                       @"Externe harde schijf",
                                       @"Antivirus",
                                       @"Office",
                                       @"Router",
                                       @"Kabels",
                                       @"Beeldscherm",
                                       @"Games",
                                       @"Webcam",
                                       @"Modem",
                                       @"Dvd brander",
                                       @"Media speler",
                                       @"SSD",
                                       @"Netwerkschijf"];
    
    self.desktopProductSynonim = @{@"muis":@"0",
                                  @"toetsenbord":@"1",
                                  @"printer":@"2",
                                  @"scanner":@"3",
                                  @"speakers":@"4",
                                  @"headset":@"5",
                                  @"verzekering":@"6",
                                  @"externehardeschijf":@"7",
                                  @"antivirus":@"8",
                                  @"office":@"9",
                                  @"router":@"10",
                                  @"kabels":@"11",
                                  @"beeldscherm":@"12",
                                  @"games":@"13",
                                  @"webcam":@"14",
                                  @"modem":@"15",
                                  @"dvdbrander":@"16",
                                  @"mediaspeler":@"17",
                                  @"ssd":@"18",
                                  @"netwerkschijf":@"19",
                                  @"mouse":@"0",
                                  @"computermuis":@"0",
                                  @"lasermuis":@"0",
                                  @"wirelessmuis":@"0",
                                  @"wirelessmouse":@"0",
                                  @"keyboard":@"1",
                                  @"laserprinter":@"2",
                                  @"allinoneprinter":@"2",
                                  @"inktjetprinter":@"2",
                                  @"computerscanner":@"3",
                                  @"pcscanner":@"3",
                                  @"luidsprekers":@"4",
                                  @"stereo":@"4",
                                  @"stereoluidsprekers":@"4",
                                  @"geluidsboxen":@"4",
                                  @"boxen":@"4",
                                  @"headphone":@"5",
                                  @"koptelefoon":@"5",
                                  @"oordopjes":@"5",
                                  @"desktopverzekering":@"6",
                                  @"externharddisk":@"7",
                                  @"externeopslag":@"7",
                                  @"draagbareopslag":@"7",
                                  @"pcprotection":@"8",
                                  @"internetsecurity":@"8",
                                  @"notebookprotection":@"8",
                                  @"virusbescherming":@"8",
                                  @"microsoftoffice":@"9",
                                  @"word":@"9",
                                  @"excel":@"9",
                                  @"officeproffesional":@"9",
                                  @"wirelessrouter":@"10",
                                  @"modemrouter":@"10",
                                  @"cable":@"11",
                                  @"kabel":@"11",
                                  @"monitor":@"12",
                                  @"display":@"12",
                                  @"computerscherm":@"12",
                                  @"computerbeeldscherm":@"12",
                                  @"scherm":@"12",
                                  @"spellen":@"13",
                                  @"computerspellen":@"13",
                                  @"computergame":@"13",
                                  @"spel":@"13",
                                  @"webcamera":@"14",
                                  @"modems":@"15",
                                  @"cdbrander":@"16",
                                  @"dvdbrander":@"16",
                                  @"dvdwriter":@"16",
                                  @"mediaplayer":@"17",
                                  @"mediabox":@"17",
                                  @"xtreamertv":@"17",
                                  @"ssdharddisk":@"18",
                                  @"solidstatedrive":@"18",
                                  @"electronischeschijf":@"18",
                                  @"netwerkschijven":@"19",
                                  @"netwerkopslag":@"19"};
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
    }
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
