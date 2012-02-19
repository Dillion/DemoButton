//
//    File: DemoButtonFilterView.h
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

#import <UIKit/UIKit.h>
#import "DemoButtonView.h"

typedef enum {
    kColorControls,
    kColorMatrix,
    kGammaAdjust,
    kHighlightShadowAdjust,
} FilterType;

typedef enum {
    kInputBrightness,
    kInputContrast,
    kInputSaturation,
    kInputRVectorX,
    kInputRVectorY,
    kInputRVectorZ,
    kInputRVectorW,
    kInputGVectorX,
    kInputGVectorY,
    kInputGVectorZ,
    kInputGVectorW,
    kInputBVectorX,
    kInputBVectorY,
    kInputBVectorZ,
    kInputBVectorW,
    kInputAVectorX,
    kInputAVectorY,
    kInputAVectorZ,
    kInputAVectorW,
    kInputPower,
    kInputHighlightAmount,
    kInputShadowAmount,
} FilterAttributes;

@interface DemoButtonFilterView : UIView {
    DemoButtonType currentType;
    FilterType filterType;
    
    UIImage *currentImage;
    NSString *currentImageName;
    
    UISlider *brightnessSlider;
    UISlider *contrastSlider;
    UISlider *saturationSlider;
    
    UISlider *rVectorXSlider;
    UISlider *rVectorYSlider;
    UISlider *rVectorZSlider;
    UISlider *rVectorWSlider;
    
    UISlider *bVectorXSlider;
    UISlider *bVectorYSlider;
    UISlider *bVectorZSlider;
    UISlider *bVectorWSlider;
    
    UISlider *gVectorXSlider;
    UISlider *gVectorYSlider;
    UISlider *gVectorZSlider;
    UISlider *gVectorWSlider;
    
    UISlider *aVectorXSlider;
    UISlider *aVectorYSlider;
    UISlider *aVectorZSlider;
    UISlider *aVectorWSlider;
    
    UISlider *powerSlider;
    
    UISlider *highlightSlider;
    UISlider *shadowSlider;
}

@property (nonatomic, strong) DemoButton *demoButton;

@property (nonatomic, strong) NSMutableDictionary *attributeDictionary;

- (id)initWithFrame:(CGRect)frame
               type:(FilterType)aType;

- (void)updateButtonTypeWithType:(DemoButtonType)aType;
- (void)sliderValueChanged:(UISlider *)sender;

- (void)flipSelectedState;

@end
