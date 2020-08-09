//
//  CoreDataManager.swift
//  Jet2TT-Demo
//
//  Created by Tejas on 09/08/20.
//  Copyright © 2020 GlobalLogic. All rights reserved.
//

import Foundation
import CoreData
import UIKit
import CoreLocation

enum CreateStatus:Int {
    case error = -1
    case success = 1
    case none = 0
}

//struct CoreDataManager  {
//    
//    func createPin(_ location:Location) -> Int {
//        let max = retrivePinID()
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return CreateStatus.none.rawValue}
//        let managedContext = appDelegate.persistentContainer.viewContext
//        let userEntity = NSEntityDescription.entity(forEntityName: "PinTable", in: managedContext)!
//        let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
//        if let city = location.cityName, let lat = location.location?.latitude, let long = location.location?.longitude {
//            user.setValue(city, forKeyPath: "cityName")
//            user.setValue(lat, forKeyPath: "lat")
//            user.setValue(long, forKeyPath: "long")
//            user.setValue(max+1, forKeyPath: "id")
//        }
//        do {
//            try managedContext.save()
//            return CreateStatus.success.rawValue
//        } catch let error as NSError {
//            print("Could not save. \(error), \(error.userInfo)")
//            return CreateStatus.error.rawValue
//        }
//    }
//    
//    func retrievePin() -> [Location]{
//        
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return [Location]() }
//        let managedContext = appDelegate.persistentContainer.viewContext
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "PinTable")
//        fetchRequest.predicate = NSPredicate(format: "id > %@", "0")
//        fetchRequest.sortDescriptors = [NSSortDescriptor.init(key: "cityName", ascending: true)]
//        do {
//            let result = try managedContext.fetch(fetchRequest)
//            var locationArr : [Location] = [Location]()
//            for data in result as! [NSManagedObject] {
//                if let city = data.value(forKey: "cityName") as? String, let lat = data.value(forKey: "lat") as? Double, let long = data.value(forKey: "long") as? Double, let id = data.value(forKey: "id") as? Int {
//                    let location : Location = Location(id: id, cityName: city, location: CLLocationCoordinate2D(latitude: lat, longitude: long))
//                    locationArr.append(location)
//                }
//            }
//            return locationArr
//        } catch {
//            
//            print("Failed")
//        }
//        return [Location]()
//    }
//    
//    func retrivePinID() -> Int{
//        
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return 0}
//        let managedContext = appDelegate.persistentContainer.viewContext
//        
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "PinTable")
//        fetchRequest.predicate = NSPredicate(format: "id > %@", "0")
//        fetchRequest.fetchLimit = 1
//        //fetchRequest.sortDescriptors = [NSSortDescriptor.init(key: "id", ascending: false)]        
//        do {
//            let result = try managedContext.fetch(fetchRequest)
//            if result.count > 0{
//                let max = (result.first as? NSManagedObject)?.value(forKey: "id") as! Int
//                return max
//            }
//            return 0
//        } catch {
//            print("Failed")
//        }
//        return 0
//    }
//    
//    func deletePin(id:Int){
//        
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
//        let managedContext = appDelegate.persistentContainer.viewContext
//        
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "PinTable")
//        fetchRequest.predicate = NSPredicate(format: "id = %@", "\(id)")
//        do
//        {
//            let test = try managedContext.fetch(fetchRequest)
//            if test.count > 0 {
//                let objectToDelete = test[0] as! NSManagedObject
//                managedContext.delete(objectToDelete)
//                do{
//                    try managedContext.save()
//                    print("\(id) has been deleted")
//                }
//                catch
//                {
//                    print(error)
//                }
//            }
//        }
//        catch
//        {
//            print(error)
//        }
//    }
//}
