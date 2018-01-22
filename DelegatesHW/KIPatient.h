//
//  KIPatient.h
//  DelegatesHW
//
//  Created by n1ke71 on 13.12.2017.
//  Copyright © 2017 n1ke71. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

typedef enum {
 
KIPatientHead    = 1,
KIPatientLeg     = 2,
KIPatientStomach = 3,
KIPatientArm     = 4
    
}KIPatientBodyParts;
@class KIPatient;

//typedef  void(^KIBlock)(KIPatient* patient,KIPatientBodyParts part);

@interface KIPatient : NSObject

@property(strong,nonatomic)   NSString* name;
@property(assign,nonatomic)   CGFloat   temperature;
@property(assign,nonatomic)   CGFloat   pressure;
@property(assign,nonatomic)   KIPatientBodyParts   bodyParts;
@property(assign,nonatomic)   BOOL      doctorsRate;

-(void)patientFeelsBad:(KIPatient*)patient patientBodyPain:(KIPatientBodyParts) bodyPart heelingBlock:(void(^)(KIPatient*,KIPatientBodyParts)) block;
-(NSString*) gotoSleep;
-(NSString*) takePill;
-(NSString*) makeShot;
-(NSString*) bodyPartDescription:(NSUInteger) bodyPart;
@end




