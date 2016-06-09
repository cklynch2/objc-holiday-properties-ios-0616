//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}


- (NSArray *)holidaysInSeason:(NSString *)season {
    NSDictionary *holidaysWithSupplies = self.database[season];
    NSArray *holidays = [holidaysWithSupplies allKeys];
    return holidays;
}

- (NSArray *)suppliesInHoliday:(NSString *)holiday
                      inSeason:(NSString *)season {
    NSArray *suppliesInHoliday = self.database[season][holiday];
    return suppliesInHoliday;
}

- (BOOL)holiday:(NSString* )holiday
     isInSeason:(NSString *)season {
    NSLog(@"We are looking to see if %@ is listed in the %@ season.", holiday, season);
    NSArray *holidays = [self holidaysInSeason:season];
    NSLog(@"This is the array of holidays for the season: %@", holidays);
    if ([holidays containsObject:holiday]) {
        NSLog(@"We entered the if statement.");
        return YES;
    }
    return NO;
}

- (BOOL)supply:(NSString *)supply
   isInHoliday:(NSString *)holiday
      inSeason:(NSString *)season {
    NSArray *supplies = [self suppliesInHoliday:holiday inSeason:season];
    if ([supplies containsObject:supply]) {
        return YES;
    }
    return NO;
}

- (void)addHoliday:(NSString *)holiday
          toSeason:(NSString *)season {
    NSMutableDictionary *seasonDictionary = self.database[season];
    [seasonDictionary setValue:[@[] mutableCopy] forKey:holiday];
}

- (void)addSupply:(NSString *)supply
        toHoliday:(NSString *)holiday
         inSeason:(NSString *)season {
    NSMutableArray *holidaySupplies = self.database[season][holiday];
    [holidaySupplies addObject:supply];
}

@end
