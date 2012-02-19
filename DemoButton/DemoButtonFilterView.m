//
//    File: DemoButtonFilterView.m
//    Abstract: A gallery view to display various filter types
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

#import "DemoButtonFilterView.h"

@implementation DemoButtonFilterView

@synthesize demoButton;
@synthesize attributeDictionary;

- (id)initWithFrame:(CGRect)frame
               type:(FilterType)aType
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        filterType = aType;
        
        self.attributeDictionary = [NSMutableDictionary dictionary];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, self.frame.size.width-10, 30)];
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.textColor = [UIColor whiteColor];
        [self addSubview:titleLabel];
        
        self.demoButton = [[DemoButton alloc] init];
        demoButton.setsSelectedOnTouchUpInside = YES;
        demoButton.frameOffset = CGPointMake(0, 3);
        demoButton.buttonLabel.font = [UIFont boldSystemFontOfSize:20];
        demoButton.buttonLabel.numberOfLines = 0;
        demoButton.buttonLabel.shadowOffset = CGSizeMake(-1.0, -1.0);
        demoButton.buttonLabel.text = @"DEMO\nBUTTON";
        demoButton.buttonLabel.fontColor = [UIColor whiteColor];
        demoButton.buttonLabel.shadowColor = [UIColor grayColor];
        demoButton.buttonLabel.selectedFontColor = [UIColor grayColor];
        demoButton.buttonLabel.selectedShadowColor = [UIColor darkGrayColor];
        demoButton.buttonLabel.lineHeight = 20.0;
        demoButton.buttonLabel.textAlignment = MTLabelTextAlignmentCenter;
        
        switch (aType) {
            case kColorControls: {
                titleLabel.text = @"Filter Type: Color Controls";
                
                UILabel *brightnessLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 110, self.frame.size.width-20, 20)];
                brightnessLabel.backgroundColor = [UIColor clearColor];
                brightnessLabel.textColor = [UIColor whiteColor];
                brightnessLabel.text = @"Brightness";
                UILabel *contrastLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 160, self.frame.size.width-20, 20)];
                contrastLabel.backgroundColor = [UIColor clearColor];
                contrastLabel.textColor = [UIColor whiteColor];
                contrastLabel.text = @"Contrast";
                UILabel *saturationLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 210, self.frame.size.width-20, 20)];
                saturationLabel.backgroundColor = [UIColor clearColor];
                saturationLabel.textColor = [UIColor whiteColor];
                saturationLabel.text = @"Saturation";
                
                brightnessSlider = [[UISlider alloc] initWithFrame:CGRectMake(10, 130, self.frame.size.width-20, 30)];
                brightnessSlider.tag = kInputBrightness;
                brightnessSlider.minimumValue = -1.0;
                brightnessSlider.maximumValue = 1.0;
                brightnessSlider.continuous = NO;
                [brightnessSlider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
                contrastSlider = [[UISlider alloc] initWithFrame:CGRectMake(10, 180, self.frame.size.width-20, 30)];
                contrastSlider.tag = kInputContrast;
                contrastSlider.minimumValue = 0.25;
                contrastSlider.maximumValue = 4.0;
                contrastSlider.continuous = NO;
                [contrastSlider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
                saturationSlider = [[UISlider alloc] initWithFrame:CGRectMake(10, 230, self.frame.size.width-20, 30)];
                saturationSlider.tag = kInputSaturation;
                saturationSlider.minimumValue = 0.0;
                saturationSlider.maximumValue = 3.0;
                saturationSlider.continuous = NO;
                [saturationSlider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
                
                [self addSubview:brightnessLabel];
                [self addSubview:contrastLabel];
                [self addSubview:saturationLabel];
                
                [self addSubview:brightnessSlider];
                [self addSubview:contrastSlider];
                [self addSubview:saturationSlider];
            }
                break;
            case kColorMatrix: {
                titleLabel.text = @"Filter Type: Color Matrix";
                
                UILabel *rVectorLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 110, 120, 20)];
                rVectorLabel.backgroundColor = [UIColor clearColor];
                rVectorLabel.textColor = [UIColor redColor];
                rVectorLabel.text = @"Red Vector";
                
                UILabel *rVectorXLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 130, 20, 30)];
                rVectorXLabel.backgroundColor = [UIColor clearColor];
                rVectorXLabel.textColor = [UIColor redColor];
                rVectorXLabel.text = @"X";
                UILabel *rVectorYLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 160, 20, 30)];
                rVectorYLabel.backgroundColor = [UIColor clearColor];
                rVectorYLabel.textColor = [UIColor redColor];
                rVectorYLabel.text = @"Y";
                UILabel *rVectorZLabel = [[UILabel alloc] initWithFrame:CGRectMake(140, 130, 20, 30)];
                rVectorZLabel.backgroundColor = [UIColor clearColor];
                rVectorZLabel.textColor = [UIColor redColor];
                rVectorZLabel.text = @"Z";
                UILabel *rVectorWLabel = [[UILabel alloc] initWithFrame:CGRectMake(140, 160, 20, 30)];
                rVectorWLabel.backgroundColor = [UIColor clearColor];
                rVectorWLabel.textColor = [UIColor redColor];
                rVectorWLabel.text = @"W";
                
                rVectorXSlider = [[UISlider alloc] initWithFrame:CGRectMake(20, 130, 60, 30)];
                rVectorXSlider.tag = kInputRVectorX;
                rVectorXSlider.minimumValue = 0.0;
                rVectorXSlider.maximumValue = 1.0;
                rVectorXSlider.continuous = NO;
                [rVectorXSlider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
                rVectorYSlider = [[UISlider alloc] initWithFrame:CGRectMake(20, 160, 60, 30)];
                rVectorYSlider.tag = kInputRVectorY;
                rVectorYSlider.minimumValue = 0.0;
                rVectorYSlider.maximumValue = 1.0;
                rVectorYSlider.continuous = NO;
                [rVectorYSlider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
                rVectorZSlider = [[UISlider alloc] initWithFrame:CGRectMake(80, 130, 60, 30)];
                rVectorZSlider.tag = kInputRVectorZ;
                rVectorZSlider.minimumValue = 0.0;
                rVectorZSlider.maximumValue = 1.0;
                rVectorZSlider.continuous = NO;
                [rVectorZSlider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
                rVectorWSlider = [[UISlider alloc] initWithFrame:CGRectMake(80, 160, 60, 30)];
                rVectorWSlider.tag = kInputRVectorW;
                rVectorWSlider.minimumValue = 0.0;
                rVectorWSlider.maximumValue = 1.0;
                rVectorWSlider.continuous = NO;
                [rVectorWSlider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
                
                [self addSubview:rVectorLabel];
                [self addSubview:rVectorXLabel];
                [self addSubview:rVectorYLabel];
                [self addSubview:rVectorZLabel];
                [self addSubview:rVectorWLabel];
                
                [self addSubview:rVectorXSlider];
                [self addSubview:rVectorYSlider];
                [self addSubview:rVectorZSlider];
                [self addSubview:rVectorWSlider];
                
                UILabel *bVectorLabel = [[UILabel alloc] initWithFrame:CGRectMake(170, 110, 120, 20)];
                bVectorLabel.backgroundColor = [UIColor clearColor];
                bVectorLabel.textColor = [UIColor blueColor];
                bVectorLabel.text = @"Blue Vector";
                
                UILabel *bVectorXLabel = [[UILabel alloc] initWithFrame:CGRectMake(165, 130, 20, 30)];
                bVectorXLabel.backgroundColor = [UIColor clearColor];
                bVectorXLabel.textColor = [UIColor blueColor];
                bVectorXLabel.text = @"X";
                UILabel *bVectorYLabel = [[UILabel alloc] initWithFrame:CGRectMake(165, 160, 20, 30)];
                bVectorYLabel.backgroundColor = [UIColor clearColor];
                bVectorYLabel.textColor = [UIColor blueColor];
                bVectorYLabel.text = @"Y";
                UILabel *bVectorZLabel = [[UILabel alloc] initWithFrame:CGRectMake(300, 130, 20, 30)];
                bVectorZLabel.backgroundColor = [UIColor clearColor];
                bVectorZLabel.textColor = [UIColor blueColor];
                bVectorZLabel.text = @"Z";
                UILabel *bVectorWLabel = [[UILabel alloc] initWithFrame:CGRectMake(300, 160, 20, 30)];
                bVectorWLabel.backgroundColor = [UIColor clearColor];
                bVectorWLabel.textColor = [UIColor blueColor];
                bVectorWLabel.text = @"W";
                
                bVectorXSlider = [[UISlider alloc] initWithFrame:CGRectMake(180, 130, 60, 30)];
                bVectorXSlider.tag = kInputBVectorX;
                bVectorXSlider.minimumValue = 0.0;
                bVectorXSlider.maximumValue = 1.0;
                bVectorXSlider.continuous = NO;
                [bVectorXSlider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
                bVectorYSlider = [[UISlider alloc] initWithFrame:CGRectMake(180, 160, 60, 30)];
                bVectorYSlider.tag = kInputBVectorY;
                bVectorYSlider.minimumValue = 0.0;
                bVectorYSlider.maximumValue = 1.0;
                bVectorYSlider.continuous = NO;
                [bVectorYSlider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
                bVectorZSlider = [[UISlider alloc] initWithFrame:CGRectMake(240, 130, 60, 30)];
                bVectorZSlider.tag = kInputBVectorZ;
                bVectorZSlider.minimumValue = 0.0;
                bVectorZSlider.maximumValue = 1.0;
                bVectorZSlider.continuous = NO;
                [bVectorZSlider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
                bVectorWSlider = [[UISlider alloc] initWithFrame:CGRectMake(240, 160, 60, 30)];
                bVectorWSlider.tag = kInputBVectorW;
                bVectorWSlider.minimumValue = 0.0;
                bVectorWSlider.maximumValue = 1.0;
                bVectorWSlider.continuous = NO;
                [bVectorWSlider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
                
                [self addSubview:bVectorLabel];
                [self addSubview:bVectorXLabel];
                [self addSubview:bVectorYLabel];
                [self addSubview:bVectorZLabel];
                [self addSubview:bVectorWLabel];

                [self addSubview:bVectorXSlider];
                [self addSubview:bVectorYSlider];
                [self addSubview:bVectorZSlider];
                [self addSubview:bVectorWSlider];
                
                UILabel *gVectorLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 200, 120, 20)];
                gVectorLabel.backgroundColor = [UIColor clearColor];
                gVectorLabel.textColor = [UIColor greenColor];
                gVectorLabel.text = @"Green Vector";
                
                UILabel *gVectorXLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 220, 20, 30)];
                gVectorXLabel.backgroundColor = [UIColor clearColor];
                gVectorXLabel.textColor = [UIColor greenColor];
                gVectorXLabel.text = @"X";
                UILabel *gVectorYLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 250, 20, 30)];
                gVectorYLabel.backgroundColor = [UIColor clearColor];
                gVectorYLabel.textColor = [UIColor greenColor];
                gVectorYLabel.text = @"Y";
                UILabel *gVectorZLabel = [[UILabel alloc] initWithFrame:CGRectMake(140, 220, 20, 30)];
                gVectorZLabel.backgroundColor = [UIColor clearColor];
                gVectorZLabel.textColor = [UIColor greenColor];
                gVectorZLabel.text = @"Z";
                UILabel *gVectorWLabel = [[UILabel alloc] initWithFrame:CGRectMake(140, 250, 20, 30)];
                gVectorWLabel.backgroundColor = [UIColor clearColor];
                gVectorWLabel.textColor = [UIColor greenColor];
                gVectorWLabel.text = @"W";
                
                gVectorXSlider = [[UISlider alloc] initWithFrame:CGRectMake(20, 220, 60, 30)];
                gVectorXSlider.tag = kInputGVectorX;
                gVectorXSlider.minimumValue = 0.0;
                gVectorXSlider.maximumValue = 1.0;
                gVectorXSlider.continuous = NO;
                [gVectorXSlider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
                gVectorYSlider = [[UISlider alloc] initWithFrame:CGRectMake(20, 250, 60, 30)];
                gVectorYSlider.tag = kInputGVectorY;
                gVectorYSlider.minimumValue = 0.0;
                gVectorYSlider.maximumValue = 1.0;
                gVectorYSlider.continuous = NO;
                [gVectorYSlider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
                gVectorZSlider = [[UISlider alloc] initWithFrame:CGRectMake(80, 220, 60, 30)];
                gVectorZSlider.tag = kInputGVectorZ;
                gVectorZSlider.minimumValue = 0.0;
                gVectorZSlider.maximumValue = 1.0;
                gVectorZSlider.continuous = NO;
                [gVectorZSlider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
                gVectorWSlider = [[UISlider alloc] initWithFrame:CGRectMake(80, 250, 60, 30)];
                gVectorWSlider.tag = kInputGVectorW;
                gVectorWSlider.minimumValue = 0.0;
                gVectorWSlider.maximumValue = 1.0;
                gVectorWSlider.continuous = NO;
                [gVectorWSlider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
                
                [self addSubview:gVectorLabel];
                [self addSubview:gVectorXLabel];
                [self addSubview:gVectorYLabel];
                [self addSubview:gVectorZLabel];
                [self addSubview:gVectorWLabel];
                
                [self addSubview:gVectorXSlider];
                [self addSubview:gVectorYSlider];
                [self addSubview:gVectorZSlider];
                [self addSubview:gVectorWSlider];
                
                UILabel *aVectorLabel = [[UILabel alloc] initWithFrame:CGRectMake(170, 200, 120, 20)];
                aVectorLabel.backgroundColor = [UIColor clearColor];
                aVectorLabel.textColor = [UIColor whiteColor];
                aVectorLabel.text = @"Alpha Vector";
                
                UILabel *aVectorXLabel = [[UILabel alloc] initWithFrame:CGRectMake(165, 220, 20, 30)];
                aVectorXLabel.backgroundColor = [UIColor clearColor];
                aVectorXLabel.textColor = [UIColor whiteColor];
                aVectorXLabel.text = @"X";
                UILabel *aVectorYLabel = [[UILabel alloc] initWithFrame:CGRectMake(165, 250, 20, 30)];
                aVectorYLabel.backgroundColor = [UIColor clearColor];
                aVectorYLabel.textColor = [UIColor whiteColor];
                aVectorYLabel.text = @"Y";
                UILabel *aVectorZLabel = [[UILabel alloc] initWithFrame:CGRectMake(300, 220, 20, 30)];
                aVectorZLabel.backgroundColor = [UIColor clearColor];
                aVectorZLabel.textColor = [UIColor whiteColor];
                aVectorZLabel.text = @"Z";
                UILabel *aVectorWLabel = [[UILabel alloc] initWithFrame:CGRectMake(300, 250, 20, 30)];
                aVectorWLabel.backgroundColor = [UIColor clearColor];
                aVectorWLabel.textColor = [UIColor whiteColor];
                aVectorWLabel.text = @"W";
                
                aVectorXSlider = [[UISlider alloc] initWithFrame:CGRectMake(180, 220, 60, 30)];
                aVectorXSlider.tag = kInputAVectorX;
                aVectorXSlider.minimumValue = 0.0;
                aVectorXSlider.maximumValue = 1.0;
                aVectorXSlider.continuous = NO;
                [aVectorXSlider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
                aVectorYSlider = [[UISlider alloc] initWithFrame:CGRectMake(180, 250, 60, 30)];
                aVectorYSlider.tag = kInputAVectorY;
                aVectorYSlider.minimumValue = 0.0;
                aVectorYSlider.maximumValue = 1.0;
                aVectorYSlider.continuous = NO;
                [aVectorYSlider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
                aVectorZSlider = [[UISlider alloc] initWithFrame:CGRectMake(240, 220, 60, 30)];
                aVectorZSlider.tag = kInputAVectorZ;
                aVectorZSlider.minimumValue = 0.0;
                aVectorZSlider.maximumValue = 1.0;
                aVectorZSlider.continuous = NO;
                [aVectorZSlider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
                aVectorWSlider = [[UISlider alloc] initWithFrame:CGRectMake(240, 250, 60, 30)];
                aVectorWSlider.tag = kInputAVectorW;
                aVectorWSlider.minimumValue = 0.0;
                aVectorWSlider.maximumValue = 1.0;
                aVectorWSlider.continuous = NO;
                [aVectorWSlider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
                
                [self addSubview:aVectorLabel];
                [self addSubview:aVectorXLabel];
                [self addSubview:aVectorYLabel];
                [self addSubview:aVectorZLabel];
                [self addSubview:aVectorWLabel];
                
                [self addSubview:aVectorXSlider];
                [self addSubview:aVectorYSlider];
                [self addSubview:aVectorZSlider];
                [self addSubview:aVectorWSlider];
            }
                break;
            case kGammaAdjust: {
                titleLabel.text = @"Filter Type: Gamma Adjust";
                
                UILabel *powerLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 110, self.frame.size.width-20, 20)];
                powerLabel.backgroundColor = [UIColor clearColor];
                powerLabel.textColor = [UIColor whiteColor];
                powerLabel.text = @"Power";
                
                powerSlider = [[UISlider alloc] initWithFrame:CGRectMake(10, 130, self.frame.size.width-20, 30)];
                powerSlider.tag = kInputPower;
                powerSlider.minimumValue = 0.0;
                powerSlider.maximumValue = 4.0;
                powerSlider.continuous = NO;
                [powerSlider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
                
                [self addSubview:powerLabel];
                
                [self addSubview:powerSlider];
            }
                break;
            case kHighlightShadowAdjust: {
                titleLabel.text = @"Filter Type: Highlight Shadow Adjust";
                
                UILabel *highlightLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 110, self.frame.size.width-20, 20)];
                highlightLabel.backgroundColor = [UIColor clearColor];
                highlightLabel.textColor = [UIColor whiteColor];
                highlightLabel.text = @"Highlight";
                UILabel *shadowLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 160, self.frame.size.width-20, 20)];
                shadowLabel.backgroundColor = [UIColor clearColor];
                shadowLabel.textColor = [UIColor whiteColor];
                shadowLabel.text = @"Shadow";
                
                highlightSlider = [[UISlider alloc] initWithFrame:CGRectMake(10, 130, self.frame.size.width-20, 30)];
                highlightSlider.tag = kInputHighlightAmount;
                highlightSlider.minimumValue = 0.0;
                highlightSlider.maximumValue = 1.0;
                highlightSlider.continuous = NO;
                [highlightSlider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
                
                shadowSlider = [[UISlider alloc] initWithFrame:CGRectMake(10, 180, self.frame.size.width-20, 30)];
                shadowSlider.tag = kInputShadowAmount;
                shadowSlider.minimumValue = -1.0;
                shadowSlider.maximumValue = 1.0;
                shadowSlider.continuous = NO;
                [shadowSlider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
                
                [self addSubview:highlightLabel];
                [self addSubview:shadowLabel];
                
                [self addSubview:highlightSlider];
                [self addSubview:shadowSlider];
            }
                break;
            default:
                break;
        }
        
        [self addSubview:demoButton];
        
        currentType = kNone;
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

- (void)updateButtonTypeWithType:(DemoButtonType)aType
{
    if (currentType != aType) {
        
        [attributeDictionary removeAllObjects];
        
        switch (aType) {
            case kRoundedRectBlueSpeckled:
                [demoButton setFrame:CGRectMake(10, 50, 200, 51)];
                currentImage = [UIImage imageNamed:@"demoButton1.png"];
                currentImageName = @"demoButton1";
                [demoButton setBackgroundImage:currentImage forState:UIControlStateNormal];
                break;
            case kRectWhiteGradient:
                demoButton.frame = CGRectMake(10, 50, 200, 51);
                currentImage = [UIImage imageNamed:@"demoButton2.png"];
                currentImageName = @"demoButton2";
                [demoButton setBackgroundImage:currentImage forState:UIControlStateNormal];
                break;
            case kPopRectGreen:
                demoButton.frame = CGRectMake(10, 50, 200, 51);
                currentImage = [UIImage imageNamed:@"demoButton3.png"];
                currentImageName = @"demoButton3";
                [demoButton setBackgroundImage:currentImage forState:UIControlStateNormal];
                break;
            case kPopRectDarkBlue:
                demoButton.frame = CGRectMake(10, 50, 199, 51);
                currentImage = [UIImage imageNamed:@"demoButton4.png"];
                currentImageName = @"demoButton4";
                [demoButton setBackgroundImage:currentImage forState:UIControlStateNormal];
                break;
            default:
                break;
        }
        
        switch (filterType) {
            case kColorControls: {
                brightnessSlider.value = brightnessSlider.minimumValue;
                contrastSlider.value = contrastSlider.minimumValue;
                saturationSlider.value = saturationSlider.minimumValue;
                
                [attributeDictionary setObject:[NSNumber numberWithFloat:brightnessSlider.value] forKey:@"inputBrightness"];
                [attributeDictionary setObject:[NSNumber numberWithFloat:contrastSlider.value] forKey:@"inputBrightness"];
                [attributeDictionary setObject:[NSNumber numberWithFloat:saturationSlider.value] forKey:@"inputBrightness"];
                
                UIImage *highlightedImage = [demoButton generateImageUsingNormalImage:currentImage cacheName:currentImageName filterType:@"CIColorControls" filterAttributes:attributeDictionary];
                [demoButton setBackgroundImage:highlightedImage forState:UIControlStateHighlighted];
                [demoButton setBackgroundImage:highlightedImage forState:UIControlStateHighlighted+UIControlStateSelected];
                [demoButton setBackgroundImage:highlightedImage forState:UIControlStateSelected];
            }
                break;
            case kColorMatrix: {
                rVectorXSlider.value = rVectorXSlider.minimumValue;
                rVectorYSlider.value = rVectorYSlider.minimumValue;
                rVectorZSlider.value = rVectorZSlider.minimumValue;
                rVectorWSlider.value = rVectorWSlider.minimumValue;
                
                bVectorXSlider.value = bVectorXSlider.minimumValue;
                bVectorYSlider.value = bVectorYSlider.minimumValue;
                bVectorZSlider.value = bVectorZSlider.minimumValue;
                bVectorWSlider.value = bVectorWSlider.minimumValue;
                
                gVectorXSlider.value = gVectorXSlider.minimumValue;
                gVectorYSlider.value = gVectorYSlider.minimumValue;
                gVectorZSlider.value = gVectorZSlider.minimumValue;
                gVectorWSlider.value = gVectorWSlider.minimumValue;
                
                aVectorXSlider.value = aVectorXSlider.maximumValue;
                aVectorYSlider.value = aVectorYSlider.maximumValue;
                aVectorZSlider.value = aVectorZSlider.maximumValue;
                aVectorWSlider.value = aVectorWSlider.minimumValue;
                
                CIVector *redVector = [CIVector vectorWithX:rVectorXSlider.value Y:rVectorYSlider.value Z:rVectorZSlider.value W:rVectorWSlider.value];
                [attributeDictionary setObject:redVector forKey:@"inputRVector"];
                CIVector *greenVector = [CIVector vectorWithX:gVectorXSlider.value Y:gVectorYSlider.value Z:gVectorZSlider.value W:gVectorWSlider.value];
                [attributeDictionary setObject:greenVector forKey:@"inputGVector"];
                CIVector *blueVector = [CIVector vectorWithX:bVectorXSlider.value Y:bVectorYSlider.value Z:bVectorZSlider.value W:bVectorWSlider.value];
                [attributeDictionary setObject:blueVector forKey:@"inputBVector"];
                CIVector *alphaVector = [CIVector vectorWithX:aVectorXSlider.value Y:aVectorYSlider.value Z:aVectorZSlider.value W:aVectorWSlider.value];
                [attributeDictionary setObject:alphaVector forKey:@"inputAVector"];
                
                UIImage *highlightedImage = [demoButton generateImageUsingNormalImage:currentImage cacheName:currentImageName filterType:@"CIColorMatrix" filterAttributes:attributeDictionary];
                [demoButton setBackgroundImage:highlightedImage forState:UIControlStateHighlighted];
                [demoButton setBackgroundImage:highlightedImage forState:UIControlStateHighlighted+UIControlStateSelected];
                [demoButton setBackgroundImage:highlightedImage forState:UIControlStateSelected];
            }
                break;
            case kGammaAdjust: {
                powerSlider.value = powerSlider.minimumValue;
                
                [attributeDictionary setObject:[NSNumber numberWithFloat:powerSlider.value] forKey:@"inputPower"];
                
                UIImage *highlightedImage = [demoButton generateImageUsingNormalImage:currentImage cacheName:currentImageName filterType:@"CIGammaAdjust" filterAttributes:attributeDictionary];
                [demoButton setBackgroundImage:highlightedImage forState:UIControlStateHighlighted];
                [demoButton setBackgroundImage:highlightedImage forState:UIControlStateHighlighted+UIControlStateSelected];
                [demoButton setBackgroundImage:highlightedImage forState:UIControlStateSelected];
            }
                break;
            case kHighlightShadowAdjust: {
                highlightSlider.value = highlightSlider.minimumValue;
                shadowSlider.value = shadowSlider.minimumValue;
                
                [attributeDictionary setObject:[NSNumber numberWithFloat:highlightSlider.value] forKey:@"inputHighlightAmount"];
                [attributeDictionary setObject:[NSNumber numberWithFloat:shadowSlider.value] forKey:@"inputShadowAmount"];
                
                UIImage *highlightedImage = [demoButton generateImageUsingNormalImage:currentImage cacheName:currentImageName filterType:@"CIHighlightShadowAdjust" filterAttributes:attributeDictionary];
                [demoButton setBackgroundImage:highlightedImage forState:UIControlStateHighlighted];
                [demoButton setBackgroundImage:highlightedImage forState:UIControlStateHighlighted+UIControlStateSelected];
                [demoButton setBackgroundImage:highlightedImage forState:UIControlStateSelected];
            }
                break;
            default:break;
        }
    }
}

- (void)sliderValueChanged:(UISlider *)sender
{
    switch (sender.tag) {
        case kInputBrightness:
            [attributeDictionary setObject:[NSNumber numberWithFloat:sender.value] forKey:@"inputBrightness"];
            break;
        case kInputContrast:
            [attributeDictionary setObject:[NSNumber numberWithFloat:sender.value] forKey:@"inputContrast"];
            break;
        case kInputSaturation:
            [attributeDictionary setObject:[NSNumber numberWithFloat:sender.value] forKey:@"inputSaturation"];
            break;
        case kInputRVectorX:
        case kInputRVectorY:
        case kInputRVectorZ:
        case kInputRVectorW: {
            CIVector *redVector = [CIVector vectorWithX:rVectorXSlider.value Y:rVectorYSlider.value Z:rVectorZSlider.value W:rVectorWSlider.value];
            [attributeDictionary setObject:redVector forKey:@"inputRVector"];
        }
            break;
        case kInputGVectorX:
        case kInputGVectorY:
        case kInputGVectorZ:
        case kInputGVectorW: {
            CIVector *greenVector = [CIVector vectorWithX:gVectorXSlider.value Y:gVectorYSlider.value Z:gVectorZSlider.value W:gVectorWSlider.value];
            [attributeDictionary setObject:greenVector forKey:@"inputGVector"];
        }
            break;
        case kInputBVectorX:
        case kInputBVectorY:
        case kInputBVectorZ:
        case kInputBVectorW: {
            CIVector *blueVector = [CIVector vectorWithX:bVectorXSlider.value Y:bVectorYSlider.value Z:bVectorZSlider.value W:bVectorWSlider.value];
            [attributeDictionary setObject:blueVector forKey:@"inputBVector"];
        }
            break;
        case kInputAVectorX:
        case kInputAVectorY:
        case kInputAVectorZ:
        case kInputAVectorW: {
            CIVector *alphaVector = [CIVector vectorWithX:aVectorXSlider.value Y:aVectorYSlider.value Z:aVectorZSlider.value W:aVectorWSlider.value];
            [attributeDictionary setObject:alphaVector forKey:@"inputAVector"];
        }
            break;
        case kInputPower:
            [attributeDictionary setObject:[NSNumber numberWithFloat:sender.value] forKey:@"inputPower"];
            break;
        case kInputHighlightAmount:
            [attributeDictionary setObject:[NSNumber numberWithFloat:sender.value] forKey:@"inputHighlightAmount"];
            break;
        case kInputShadowAmount:
            [attributeDictionary setObject:[NSNumber numberWithFloat:sender.value] forKey:@"inputShadowAmount"];
            break;
        default:break;
    }
    
    switch (filterType) {
        case kColorControls: {
            UIImage *highlightedImage = [demoButton generateImageUsingNormalImage:currentImage cacheName:currentImageName filterType:@"CIColorControls" filterAttributes:attributeDictionary];
            [demoButton setBackgroundImage:highlightedImage forState:UIControlStateHighlighted];
            [demoButton setBackgroundImage:highlightedImage forState:UIControlStateHighlighted+UIControlStateSelected];
            [demoButton setBackgroundImage:highlightedImage forState:UIControlStateSelected];
        }
            break;
        case kColorMatrix: {
            UIImage *highlightedImage = [demoButton generateImageUsingNormalImage:currentImage cacheName:currentImageName filterType:@"CIColorMatrix" filterAttributes:attributeDictionary];
            [demoButton setBackgroundImage:highlightedImage forState:UIControlStateHighlighted];
            [demoButton setBackgroundImage:highlightedImage forState:UIControlStateHighlighted+UIControlStateSelected];
            [demoButton setBackgroundImage:highlightedImage forState:UIControlStateSelected];
        }
            break;
        case kGammaAdjust: {
            UIImage *highlightedImage = [demoButton generateImageUsingNormalImage:currentImage cacheName:currentImageName filterType:@"CIGammaAdjust" filterAttributes:attributeDictionary];
            [demoButton setBackgroundImage:highlightedImage forState:UIControlStateHighlighted];
            [demoButton setBackgroundImage:highlightedImage forState:UIControlStateHighlighted+UIControlStateSelected];
            [demoButton setBackgroundImage:highlightedImage forState:UIControlStateSelected];
        }
            break;
        case kHighlightShadowAdjust: {
            UIImage *highlightedImage = [demoButton generateImageUsingNormalImage:currentImage cacheName:currentImageName filterType:@"CIHighlightShadowAdjust" filterAttributes:attributeDictionary];
            [demoButton setBackgroundImage:highlightedImage forState:UIControlStateHighlighted];
            [demoButton setBackgroundImage:highlightedImage forState:UIControlStateHighlighted+UIControlStateSelected];
            [demoButton setBackgroundImage:highlightedImage forState:UIControlStateSelected];
        }
            break;
        default:break;
    }
    
}

- (void)flipSelectedState
{
    [demoButton setSelected:!demoButton.selected];
}

@end
