//
//    File: UIButton+filter.m
//    Abstract: A UIButton category that creates new button images
//    from a supplied image and Core Image filters
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

#import "UIButton+filter.h"

@interface UIButton ()
- (UIImage *)generateImageUsingImage:(CIImage *)image
                          filterType:(NSString *)kFilterType
                    filterAttributes:(NSDictionary *)attributes;
@end


@implementation UIButton (filter)

- (UIImage *)generateImageUsingNormalImage:(UIImage *)normalImage
                                 cacheName:(NSString *)cacheName
                                filterType:(NSString *)kFilterType
                          filterAttributes:(NSDictionary *)attributes
{
    UIImage *newImage = nil;
    
    if (normalImage) {
        
        if (CACHE_OPTION == 1) {
            NSString *hashDesc = [[attributes description] md5Hash];
            NSString *cacheFileName = [NSString stringWithFormat:@"%@%@%@", cacheName, kFilterType, hashDesc];
            //NSLog(@"cache name generated is %@", cacheFileName);
            
            if ([[Nimbus imageMemoryCache] containsObjectWithName:cacheFileName]) { // cache hit
                
                newImage = [[Nimbus imageMemoryCache] objectWithName:cacheFileName];
                
            } else { // cache miss
                
                newImage = [self generateImageUsingImage:[CIImage imageWithCGImage:normalImage.CGImage] filterType:kFilterType filterAttributes:attributes];
                
                [[Nimbus imageMemoryCache] storeObject:newImage withName:cacheFileName];
            }
        } else { // not using cache
            newImage = [self generateImageUsingImage:[CIImage imageWithCGImage:normalImage.CGImage] filterType:kFilterType filterAttributes:attributes];
        }
    }
    
    return newImage;
}


- (UIImage *)generateImageUsingImage:(CIImage *)image
                          filterType:(NSString *)kFilterType
                    filterAttributes:(NSDictionary *)attributes
{
    UIImage *newImage = nil;
    CIFilter *filter = nil;
    
    if ([kFilterType compare:@"CIColorControls"] == NSOrderedSame) {
        filter = [CIFilter filterWithName:kFilterType];
        //NSLog(@"Color Controls %@", [filter attributes]);
        [filter setValue:image forKey:kCIInputImageKey];
        [filter setValue:[attributes objectForKey:@"inputBrightness"] forKey:@"inputBrightness"];
        [filter setValue:[attributes objectForKey:@"inputContrast"] forKey:@"inputContrast"];
        [filter setValue:[attributes objectForKey:@"inputSaturation"] forKey:@"inputSaturation"];
    } else if ([kFilterType compare:@"CIColorMatrix"] == NSOrderedSame) {
        filter = [CIFilter filterWithName:kFilterType];
        //NSLog(@"Color Matrix %@", [filter attributes]);
        [filter setValue:image forKey:kCIInputImageKey];
        [filter setValue:[attributes objectForKey:@"inputRVector"] forKey:@"inputRVector"];
        [filter setValue:[attributes objectForKey:@"inputGVector"] forKey:@"inputGVector"];
        [filter setValue:[attributes objectForKey:@"inputBVector"] forKey:@"inputBVector"];
        [filter setValue:[attributes objectForKey:@"inputAVector"] forKey:@"inputAVector"];
        //due to space constraints in DemoButtonFilterView, bias vector configuration is not displayed
        //[filter setValue:[attributes objectForKey:@"inputBiasVector"] forKey:@"inputBiasVector"];
    } else if ([kFilterType compare:@"CIGammaAdjust"] == NSOrderedSame) {
        filter = [CIFilter filterWithName:kFilterType];
        //NSLog(@"Gamma Adjust %@", [filter attributes]);
        [filter setValue:image forKey:kCIInputImageKey];
        [filter setValue:[attributes objectForKey:@"inputPower"] forKey:@"inputPower"];
    } else if ([kFilterType compare:@"CIHighlightShadowAdjust"] == NSOrderedSame) {
        filter = [CIFilter filterWithName:kFilterType];
        //NSLog(@"HighlightShadow Adjust %@", [filter attributes]);
        [filter setValue:image forKey:kCIInputImageKey];
        [filter setValue:[attributes objectForKey:@"inputHighlightAmount"] forKey:@"inputHighlightAmount"];
        [filter setValue:[attributes objectForKey:@"inputShadowAmount"] forKey:@"inputShadowAmount"];
    } 
    
    if (filter) {
        CIContext *context = [CIContext contextWithOptions:nil];
        CIImage *result = [filter valueForKey:kCIOutputImageKey];
        newImage = [UIImage imageWithCGImage:[context createCGImage:result fromRect:[result extent]]];
    }
    
    return newImage;
    
}

@end
