//
//  KIDoctorsFriend.h
//  DelegatesHW
//
//  Created by n1ke71 on 18.12.2017.
//  Copyright © 2017 n1ke71. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "KIPatient.h"

@interface KIDoctorsFriend : NSObject


@property(strong,nonatomic) NSString* name;
@property(strong,nonatomic) NSMutableArray* dailyRaport;

-(NSString*) gotoRun;
-(NSString*) takeBroth; // Отвар :)
-(NSString*) makeDropper;//Капельница :)

@end
