//
//    File: UIButton+filter.h
//    Abstract: A UIButton category that creates new button images
//    from a supplied image and Core Image filters. The created images
//    are optionally cached with a Nimbus in-memory cache.
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

#if !defined(NIMEMCACHE) || NIMEMCACHE == 0
#define CACHE_OPTION 0
#else 
#define CACHE_OPTION 1
#endif

@interface UIButton (filter)

- (UIImage *)generateImageUsingNormalImage:(UIImage *)normalImage
                                 cacheName:(NSString *)cacheName
                                filterType:(NSString *)kFilterType
                          filterAttributes:(NSDictionary *)attributes;

@end
