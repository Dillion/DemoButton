//
//    File: DemoButtonView.m
//    Abstract: A gallery view to display various button types
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

#import "DemoButtonView.h"

@implementation DemoButtonView

@synthesize demoButton;
@synthesize demoButtonType;

- (id)initWithFrame:(CGRect)frame
               type:(DemoButtonType)aType
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        demoButtonType = aType;
        
        self.demoButton = [UIButton buttonWithType:UIButtonTypeCustom];
        demoButton.titleLabel.font = [UIFont boldSystemFontOfSize:20];
        demoButton.titleLabel.numberOfLines = 0;
        demoButton.titleLabel.shadowOffset = CGSizeMake(-1.0, -1.0);
        [demoButton setTitle:@"  DEMO \nBUTTON" forState:UIControlStateNormal];
        [demoButton setTitleShadowColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        
        switch (aType) {
            case kRoundedRectBlueSpeckled:
                demoButton.frame = CGRectMake(10, 10, 200, 51);
                [demoButton setBackgroundImage:[UIImage imageNamed:@"demoButton1.png"] forState:UIControlStateNormal];
                break;
            case kRectWhiteGradient:
                demoButton.frame = CGRectMake(10, 10, 200, 51);
                [demoButton setBackgroundImage:[UIImage imageNamed:@"demoButton2.png"] forState:UIControlStateNormal];
                break;
            case kPopRectGreen:
                demoButton.frame = CGRectMake(10, 10, 200, 51);
                [demoButton setBackgroundImage:[UIImage imageNamed:@"demoButton3.png"] forState:UIControlStateNormal];
                break;
            case kPopRectDarkBlue:
                demoButton.frame = CGRectMake(10, 10, 199, 51);
                [demoButton setBackgroundImage:[UIImage imageNamed:@"demoButton4.png"] forState:UIControlStateNormal];
                break;
            default:
                break;
        }
        
        [self addSubview:demoButton];
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
