//
//  DevDataManager.swift
//  sampleMVC
//
//  Created by Luc Casimir on 28/06/2017.
//  Copyright © 2017 Luc Casimir. All rights reserved.
//

import Foundation
import CoreData
import UIKit

//MARK: Protocol

protocol DevDataManagerProtocol : class {
    var devs : [Dev] {get}
    
    func add(Dev dev:Dev)
    func add(Name str:String)
    func delete(Dev dev:Dev)
    func retrieveAll()-> [Dev]
}

class DevDataManager {

//MARK: Properties
    
    fileprivate var appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    lazy var devs: [Dev] = {
       return self.retrieveAll()
    }()
    
    fileprivate func save(){
        appDelegate?.saveContext()
    }
}

//MARK: DevDataManagerProtocol

extension DevDataManager : DevDataManagerProtocol {

    /// retrive All entity
    
    func retrieveAll() -> [Dev] {
        var allDevs : [Dev] = []
        
        guard let context = appDelegate?.persistentContainer.viewContext else {
            return allDevs
        }
        let fechtRequest = NSFetchRequest<Dev>(entityName: "Dev")
        do {
            allDevs = try context.fetch(fechtRequest)
        }
        catch let err {
            print(err)
        }
        return allDevs
    }
    
    /// Add new entity
    
    func add(Dev dev: Dev) {
        devs.append(dev)
        save()
    }
    
    func add(Name str: String) {
        guard let context = appDelegate?.persistentContainer.viewContext,
            let entity = NSEntityDescription.entity(forEntityName: "Dev", in: context) else {
                return ;
        }
        let newDev = Dev(entity: entity, insertInto: context)
        newDev.setValue(str, forKey: "name")
        devs.append(newDev)
        save()
    }
    
    /// Delete entity
    
    func delete(Dev dev: Dev) {
        if let index = devs.index(of: dev) {
            devs.remove(at: index)
            save()
        }
    }
}
