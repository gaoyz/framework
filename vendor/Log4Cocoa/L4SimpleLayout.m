/**
 * For copyright & license, see LICENSE.
 */

#import "L4SimpleLayout.h"
#import "L4LogEvent.h"
#import "L4Level.h"
#import <sys/sysctl.h>

@implementation L4SimpleLayout

- (NSString *)format:(L4LogEvent *)event
{
    if (_logDic == nil) {
        self.logDic = [NSMutableDictionary dictionary];
    }
    
    //计算开始结束间隔时间
    NSArray *array = [event.renderedMessage componentsSeparatedByString:@"\t"];
    event.key = [array safeObjectAtIndex:1];
    event.status = [array safeObjectAtIndex:2];
    
    if (event.status != nil) {
        NSRange range = [event.status rangeOfString:@"start"];
        if (range.length > 0) {
            //当前状态为开始，则保存开始时间
            if (event.key != nil) {
                [self.logDic setObject:@(event.millisSinceStart) forKey:event.key];
            }
        }
        else{
            //当前非开始状态，取出保存的开始时间，计算差值
            if (event.key != nil) {
                NSNumber *startSecond = [self.logDic objectForKey:event.key];
                if (startSecond != nil && [startSecond integerValue] < event.millisSinceStart) {
                    event.useTime = event.millisSinceStart - [startSecond integerValue];
                    [self.logDic removeObjectForKey:event.key];
                }
                
            }
        }
    }
    
    NSString *strSpace20 = @"                    ";
    NSString *strFile = [[event.fileName lastPathComponent] stringByAppendingString:strSpace20];
    strFile = [strFile substringToIndex:20];
    
    return [NSString stringWithFormat:@"%ldms\t%4ldms\t%@\t(%4d:%@) \t %@",
            event.millisSinceStart,
            event.useTime,
            [PubFunction DateGetstrFromNSDate:[PubFunction convertDateToLocalTime:event.timestamp] returnFormat:@"HH:mm:ss.SSS"],
            [event.lineNumber integerValue],
            [PubFunction strFill_SourceStr:event.fileName fillStr:@" " allLength:20],
            event.renderedMessage];
}

@end
