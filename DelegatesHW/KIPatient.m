//
//  KIPatient.m
//  DelegatesHW
//
//  Created by n1ke71 on 13.12.2017.
//  Copyright © 2017 n1ke71. All rights reserved.
//

#import "KIPatient.h"


@implementation KIPatient


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


-(void)patientFeelsBad:(KIPatient*)patient patientBodyPain:(KIPatientBodyParts) bodyPart heelingBlock:(void(^)(KIPatient*,KIPatientBodyParts)) block{
    
    block(patient,bodyPart);
    
}

-(void)dealloc{
    
    NSLog(@"object %@ deallocated",self.name);
    
}
@end
