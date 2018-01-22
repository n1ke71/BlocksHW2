//
//  KIPatient.m
//  DelegatesHW
//
//  Created by n1ke71 on 13.12.2017.
//  Copyright © 2017 n1ke71. All rights reserved.
//

#import "KIPatient.h"


@implementation KIPatient


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        NSTimeInterval interval = arc4random_uniform(20);
        NSLog(@"%.0f",interval);
        [self performSelector:@selector(patientInitiated) withObject:nil afterDelay:interval];
    }
    return self;
}

KIBlock block = ^(id object,KIPatientBodyParts part){
    
    KIPatient* patient = (KIPatient*)object;
    
    NSLog(@"Patients  name:%@" ,patient.name);
    NSLog(@"Patients temp:%.1f",patient.temperature);
    NSLog(@"Patients pres:%.1f",patient.pressure);
    NSLog(@"Patients has pain in:%@" ,[patient bodyPartDescription:part]);
    
    if (patient.temperature <= 36.6 | patient.temperature < 37 | part == KIPatientHead) {
        
        NSLog(@"Patient name:%@ %@",patient.name,[patient gotoSleep]);
    }
    else if (patient.temperature >= 37. && patient.temperature < 39. | patient.pressure >= 180. && patient.pressure < 190. | part == KIPatientArm){
        
        NSLog(@"Patient name:%@ %@",patient.name,[patient takePill]);
    }
    else if (patient.temperature >= 39. | patient.pressure >= 190. | part == KIPatientLeg | part == KIPatientStomach){
        
        NSLog(@"Patient name:%@ %@",patient.name,[patient makeShot]);
    }
    else NSLog(@"Patient name:%@ feels fine",patient.name);
    
    patient.doctorsRate = arc4random()%2;
    NSLog(@"doctorsRate:%u" ,patient.doctorsRate);
    
    
};

-(NSString*) gotoSleep{
    
    
    return @"gotoSleep";
}
-(NSString*) takePill{
    
    return @"takePill";
}
-(NSString*) makeShot{
    
    return @"makeShot";
    
}

-(NSString*) bodyPartDescription:(NSUInteger) bodyPart{
    
    NSString* partDescription = @"NOT identified";
    
    switch (bodyPart) {
        case 1:
            partDescription = @"Head";
            break;
        case 2:
            partDescription = @"Leg";
        case 3:
            partDescription = @"Stomach";
        case 4:
            partDescription = @"Arm";
            
    }
    
    return partDescription;
    
}

-(void)patientInitiated{
    
    [self patientFeelsBad:self patientBodyPain:arc4random_uniform(3) heelingBlock:block];
    
}

-(void)patientFeelsBad:(KIPatient*)patient patientBodyPain:(KIPatientBodyParts) bodyPart heelingBlock:(void(^)(KIPatient*,KIPatientBodyParts)) block{
    
    block(patient,bodyPart);
    
}

-(void)dealloc{
    
    NSLog(@"object %@ deallocated",self.name);
    
}
@end
