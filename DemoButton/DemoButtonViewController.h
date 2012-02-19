//
//    File: DemoButtonViewController.h
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

#import <UIKit/UIKit.h>

@interface DemoButtonViewController : UIViewController <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *buttonTypeScrollView;
@property (nonatomic, strong) UIScrollView *filterTypeScrollView;

@property (nonatomic, strong) UIPageControl *buttonTypePageControl;
@property (nonatomic, strong) UIPageControl *filterTypePageControl;

@property (nonatomic, strong) UISwitch *flashSwitch;

@property (nonatomic, strong) UIBarButtonItem *lockButton;

- (void)onPageChange:(id)sender;

- (void)lockFilterScroll:(id)sender;

- (void)flashSelectedState:(UISwitch *)sender;
- (void)switchToSelectedState;
- (void)switchBackNormalState;

@end
