#import "Book.h" 
                               
@implementation Book 
                               

+ (NSDictionary *)modelContainerPropertyGenericClass {                          
    return @{
             @"catalogue" : [CatalogueModel class] 
             };     
}
@end