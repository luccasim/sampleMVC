//
//  Dev+CoreDataProperties.swift
//  sampleMVC
//
//  Created by Luc Casimir on 28/06/2017.
//  Copyright © 2017 Luc Casimir. All rights reserved.
//

import Foundation
import CoreData


extension Dev {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Dev> {
        return NSFetchRequest<Dev>(entityName: "Dev");
    }

    @NSManaged public var name: String?

}
