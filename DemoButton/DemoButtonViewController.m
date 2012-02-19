//
//    File: DemoButtonViewController.m
//    Abstract: Button gallery to showcase the effects of Core Image
//    filters on button images.
//    Top section controls the original button image, bottom section
//    controls the filter type applied.
//
//    Copyright 2012 Dillion Tan
//
//    Licensed under the Apache License, Version 2.0 (the "License");
//    you may not use this file except in compliance with the License.
//    You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
//    Unless required by applicable law or agreed to in writing, software
//    distributed under the License is distributed on an "AS IS" BASIS,
//    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//    See the License for the specific language governing permissions and
//    limitations under the License.

#import "DemoButtonViewController.h"
#import "DemoButtonView.h"
#import "DemoButtonFilterView.h"

@implementation DemoButtonViewController

@synthesize flashSwitch;

@synthesize buttonTypeScrollView;
@synthesize filterTypeScrollView;
@synthesize buttonTypePageControl;
@synthesize filterTypePageControl;

@synthesize lockButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor darkGrayColor];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 230, 30)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.text = @"Button Type                  Flash";
    titleLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:titleLabel];
    
    self.flashSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(240, 5, 0, 0)];
    [flashSwitch addTarget:self action:@selector(flashSelectedState:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:flashSwitch];
    
    self.buttonTypeScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 30, self.view.frame.size.width, 70)];
    buttonTypeScrollView.contentSize = CGSizeMake(self.view.frame.size.width*4, 70);
    buttonTypeScrollView.pagingEnabled = YES;
    buttonTypeScrollView.delegate = self;
    [self.view addSubview:buttonTypeScrollView];
    
    for (int i = 0; i < 4; i++) {
        DemoButtonView *demoButtonView = [[DemoButtonView alloc] initWithFrame:CGRectMake(self.view.frame.size.width*i, 0, self.view.frame.size.width, 70) type:i];
        [buttonTypeScrollView addSubview:demoButtonView];
    }
    
    self.buttonTypePageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 30)];
    buttonTypePageControl.numberOfPages = 4;
    buttonTypePageControl.currentPage = 0;
    [buttonTypePageControl addTarget:self action:@selector(onPageChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:buttonTypePageControl];
    
    self.filterTypeScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 130, self.view.frame.size.width, 320)];
    filterTypeScrollView.contentSize = CGSizeMake(self.view.frame.size.width*4, 320);
    filterTypeScrollView.pagingEnabled = YES;
    filterTypeScrollView.delegate = self;
    [self.view addSubview:filterTypeScrollView];
    
    for (int i = 0; i < 4; i++) {
        DemoButtonFilterView *demoButtonFilterView = [[DemoButtonFilterView alloc] initWithFrame:CGRectMake(self.view.frame.size.width*i, 0, self.view.frame.size.width, 320) type:i];
        [demoButtonFilterView updateButtonTypeWithType:kRoundedRectBlueSpeckled];
        [filterTypeScrollView addSubview:demoButtonFilterView];
    }
    
    self.filterTypePageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 420, self.view.frame.size.width, 30)];
    filterTypePageControl.numberOfPages = 4;
    filterTypePageControl.currentPage = 0;
    [filterTypePageControl addTarget:self action:@selector(onPageChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:filterTypePageControl];
    
    UIToolbar *lockbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 450, self.view.frame.size.width, 30)];
    lockbar.barStyle = UIBarStyleBlackTranslucent;
    self.lockButton = [[UIBarButtonItem alloc] initWithTitle:@"Lock Filter Scroll" style:UIBarButtonItemStylePlain target:self action:@selector(lockFilterScroll:)];
    [lockbar setItems:[NSArray arrayWithObjects:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],lockButton,nil]];
    
    [self.view addSubview:lockbar];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)scrollViewDidScroll:(UIScrollView *)sender 
{
    if (sender == buttonTypeScrollView) {
        CGFloat pageWidth = self.buttonTypeScrollView.frame.size.width;
        int page = floor((self.buttonTypeScrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
        buttonTypePageControl.currentPage = page;
        DemoButtonView *currentView = [[buttonTypeScrollView subviews] objectAtIndex:buttonTypePageControl.currentPage];
        for (UIView *view in [filterTypeScrollView subviews]) {
            if ([view isKindOfClass:[DemoButtonFilterView class]]) {
                [(DemoButtonFilterView *)view updateButtonTypeWithType:currentView.demoButtonType];
            }
        }
    } else if (sender == filterTypeScrollView) {
        CGFloat pageWidth = self.filterTypeScrollView.frame.size.width;
        int page = floor((self.filterTypeScrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
        filterTypePageControl.currentPage = page;
    }
}

- (void)onPageChange:(id)sender
{
    if (sender == buttonTypePageControl) {
        DemoButtonView *currentView = [[buttonTypeScrollView subviews] objectAtIndex:buttonTypePageControl.currentPage];
        [buttonTypeScrollView scrollRectToVisible:currentView.frame animated:YES];
        for (UIView *view in [filterTypeScrollView subviews]) {
            if ([view isKindOfClass:[DemoButtonFilterView class]]) {
                [(DemoButtonFilterView *)view updateButtonTypeWithType:currentView.demoButtonType];
            }
        }
    } else if (sender == filterTypePageControl) {
        DemoButtonFilterView *currentFilterView = [[filterTypeScrollView subviews] objectAtIndex:filterTypePageControl.currentPage];
        [filterTypeScrollView scrollRectToVisible:currentFilterView.frame animated:YES];
    }
}

- (void)lockFilterScroll:(id)sender
{
    filterTypeScrollView.scrollEnabled = !filterTypeScrollView.scrollEnabled;
    
    if (filterTypeScrollView.scrollEnabled) {
        [lockButton setTitle:@"Lock Filter Scroll"];
    } else {
        [lockButton setTitle:@"Unlock Filter Scroll"];
    }
}

- (void)flashSelectedState:(UISwitch *)sender
{
    if (sender.on) {
        [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(switchToSelectedState) userInfo:nil repeats:NO];
    }
}

- (void)switchToSelectedState
{
    DemoButtonFilterView *currentFilterView = [[filterTypeScrollView subviews] objectAtIndex:filterTypePageControl.currentPage];
    [currentFilterView flipSelectedState];
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(switchBackNormalState) userInfo:nil repeats:NO];
}

- (void)switchBackNormalState
{
    if (flashSwitch.on) {
        DemoButtonFilterView *currentFilterView = [[filterTypeScrollView subviews] objectAtIndex:filterTypePageControl.currentPage];
        [currentFilterView flipSelectedState];
        [NSTimer scheduledTimerWithTimeInterval:1.8 target:self selector:@selector(switchToSelectedState) userInfo:nil repeats:NO];
    }
}

@end

