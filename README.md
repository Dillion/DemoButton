##DemoButton  

An UIButton enhancement for:  
 - Programmatic generation of button images using Core Image filters  
 - Caching the generated images in a Nimbus in-memory cache  
 - Setting custom line spacing on button text using MTLabel  

###Basic Usage  

1. For generating filtered images -  
a) To use Nimbus memory caching (ref. https://github.com/jverkoey/nimbus), add NIMEMCACHE=1 to Preprocessor Macros, Project Build Settings  
b) Generate the filtered image using the UIButton category function  
`- (UIImage *)generateImageUsingNormalImage:(UIImage *)normalImage
                                 cacheName:(NSString *)cacheName
                                filterType:(NSString *)kFilterType
                          filterAttributes:(NSDictionary *)attributes`  

2. For adjusting line spacing of button text -  
Use the button subclass DemoButton and set buttonLabel instead of titleLabel (ref. https://github.com/Tuszy/MTLabel)  

![Alt text](screenshot1.PNG)  
![Alt text](screenshot2.PNG)  
![Alt text](screenshot3.png)  
![Alt text](screenshot4.png)  