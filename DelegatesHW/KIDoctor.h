//
//  KIDoctor.h
//  DelegatesHW
//
//  Created by n1ke71 on 13.12.2017.
//  Copyright © 2017 n1ke71. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "KIPatient.h"

@interface KIDoctor : NSObject


@property(strong,nonatomic) NSString* name;
@property(strong,nonatomic) NSMutableArray* dailyRaport;

-(NSString*) gotoSleep;
-(NSString*) takePill;
-(NSString*) makeShot;
-(NSString*) makeRaport:(NSString*) patient hasGotAPain:(NSString*) bodyPart;
@end
