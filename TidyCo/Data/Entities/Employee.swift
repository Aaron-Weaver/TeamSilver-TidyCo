//
//  Employee.swift
//  TidyCo
//
//  Created by Aaron Weaver on 10/13/15.
//  Copyright © 2015 Team Silver. All rights reserved.
//

import Foundation

class Employee: PFObject, PFSubclassing
{
    static let EMPLOYEE_TYPE_POINTER: String = "employeeType"
    
    @NSManaged var firstName: String
    @NSManaged var middleInitial: String
    @NSManaged var lastName: String
    @NSManaged var employeeId: String
    @NSManaged var loginId: String
    @NSManaged var hashedPassword: String
    
    var employeeType: EmployeeType {
        get
        {
            return self[Employee.EMPLOYEE_TYPE_POINTER] as! EmployeeType
        }
    }
    
    override class func initialize() {
        struct Static {
            static var onceToken: dispatch_once_t = 0;
        }
        dispatch_once(&Static.onceToken) {
            self.registerSubclass()
        }
    }
    
    class func parseClassName() -> String {
        return "Employee"
    }
    
    
}