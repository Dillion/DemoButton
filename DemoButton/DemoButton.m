//
//    File: DemoButton.m
//    Abstract: A subclassed UIButton that allows customization of
//    line spacing on button text through MTLabel
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

#import "DemoButton.h"

@implementation DemoButton

@synthesize frameOffset;
@synthesize frameInset;
@synthesize buttonLabel;
@synthesize setsSelectedOnTouchUpInside;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code
        
        frameOffset = CGPointZero;
        frameInset = CGPointZero;
        setsSelectedOnTouchUpInside = NO;
        
        self.buttonLabel = [[MTLabel alloc] init];
        buttonLabel.userInteractionEnabled = NO;
        [self addSubview:buttonLabel];
        
        [self addTarget:self action:@selector(onTouchDown:) forControlEvents:UIControlEventTouchDown];
        [self addTarget:self action:@selector(onTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
        [self addTarget:self action:@selector(onTouchUpOutside:) forControlEvents:UIControlEventTouchUpOutside|UIControlEventTouchDragOutside|UIControlEventTouchDragExit];
        
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

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    
    CGRect labelAfterOffset = CGRectOffset(CGRectMake(0, 0, frame.size.width, frame.size.height), frameOffset.x, frameOffset.y);
    CGRect labelAfterOffsetInset = CGRectInset(labelAfterOffset, frameInset.x, frameInset.y);
    [buttonLabel setFrame:labelAfterOffsetInset];
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    if (selected) {
        [buttonLabel setState:UIControlStateSelected];
    } else {
        [buttonLabel setState:UIControlStateNormal];
    }
}

- (void)onTouchDown:(UIButton *)sender
{
    [buttonLabel setState:UIControlStateSelected];
}

- (void)onTouchUpInside:(UIButton *)sender
{
    if (setsSelectedOnTouchUpInside) {
        if (sender.selected) {
            sender.selected = NO;
            [buttonLabel setState:UIControlStateNormal];
        } else {
            sender.selected = YES;
            [buttonLabel setState:UIControlStateSelected];
        }
    } else {
        [buttonLabel setState:UIControlStateNormal];
    }
}

- (void)onTouchUpOutside:(UIButton *)sender
{
    sender.selected = NO;
    [buttonLabel setState:UIControlStateNormal];
}

@end
