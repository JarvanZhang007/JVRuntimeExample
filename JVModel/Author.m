#import "Author.h" 
                               
@implementation Author 
                               

+ (NSDictionary *)modelContainerPropertyGenericClass {                          
    return @{
             @"life" : [LifeModel class] 
             };     
}
@end
