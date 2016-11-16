//
//  Tweet+CoreDataProperties.swift
//  sampleCoreDataSwift3_0
//
//  Created by Eriko Ichinohe on 2016/11/16.
//  Copyright © 2016年 Eriko Ichinohe. All rights reserved.
//

import Foundation
import CoreData


extension Tweet {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tweet> {
        return NSFetchRequest<Tweet>(entityName: "Tweet");
    }

    @NSManaged public var body: String?
    @NSManaged public var created_at: NSDate?

}
