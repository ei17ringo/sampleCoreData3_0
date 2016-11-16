//
//  ViewController.swift
//  sampleCoreDataSwift3_0
//
//  Created by Eriko Ichinohe on 2016/11/16.
//  Copyright © 2016年 Eriko Ichinohe. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //値の追加（Create)
    @IBAction func tapAdd(_ sender: UIButton) {
        
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let viewContext = appDelegate.persistentContainer.viewContext
        let tweet = NSEntityDescription.entity(forEntityName: "Tweet", in: viewContext)
        let newRecord = NSManagedObject(entity: tweet!, insertInto: viewContext)
        newRecord.setValue("値", forKey: "body") //値を代入
        newRecord.setValue(Date(), forKey: "created_at")//値を代入
        
        do {
            try viewContext.save()
        } catch {
        }
    }
    
    //値の読み出し(Read）
    @IBAction func tapRead(_ sender: UIButton) {
        
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let viewContext = appDelegate.persistentContainer.viewContext
        let query: NSFetchRequest<Tweet> = Tweet.fetchRequest()
        
        do {
            let fetchResults = try viewContext.fetch(query)
            for result: AnyObject in fetchResults {
                let body: String? = result.value(forKey: "body") as? String
                let created_at: Date? = result.value(forKey: "created_at") as? Date
                
                print("body\(body)")
                print("ceated_at\(created_at)")
            }
        } catch {
        }
    }
    
    //値の更新(Update)
    @IBAction func tapUpdate(_ sender: UIButton) {
        
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let viewContext = appDelegate.persistentContainer.viewContext
        let request: NSFetchRequest<Tweet> = Tweet.fetchRequest()
        do {
            let fetchResults = try viewContext.fetch(request)
            for result: AnyObject in fetchResults {
                let record = result as! NSManagedObject
                record.setValue(Date(), forKey: "created_at")
            }
            try viewContext.save()
        } catch {
        }

    }
    
    //値の削除(Delete)
    @IBAction func tapDelete(_ sender: UIButton) {
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let viewContext = appDelegate.persistentContainer.viewContext
        let request: NSFetchRequest<Tweet> = Tweet.fetchRequest()
        do {
            let fetchResults = try viewContext.fetch(request)
            for result: AnyObject in fetchResults {
                let record = result as! NSManagedObject
                viewContext.delete(record)
            }
            try viewContext.save()
        } catch {
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

