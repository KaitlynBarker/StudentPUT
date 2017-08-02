//
//  StudentController.swift
//  StudentPut_iOS14
//
//  Created by Kaitlyn Barker on 8/2/17.
//  Copyright © 2017 Kaitlyn Barker. All rights reserved.
//

import Foundation

class StudentController {
    
    static var students: [Student] = [] // DataSource
    
    static let baseURL = URL(string: "https://survey-ios14.firebaseio.com/students")
    
    static func fetchStudents(completion: @escaping () -> Void) {
        guard let baseURL = self.baseURL else { completion(); return }
        
        let url = baseURL.appendingPathExtension("json")
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.httpBody = nil
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, _, error) in
            
            if let error = error { NSLog("Error found. Error: \(error.localizedDescription)"); completion(); return }
            
            guard let data = data else { NSLog("No data returned from the dataTask"); completion(); return }
            
            guard let studentsDictionary = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String: [String:String]] else { NSLog("Unable to serialize JSON"); completion(); return }
            
            // use the failable init to create our students
            
            let students = studentsDictionary.flatMap { Student(dictionary: $0.value) }
            
            self.students = students
            
            completion()
            
        }
        dataTask.resume()
    }
    
    static func postStudents() {
        
    }
    
}

/*
 
 *use this in a playground to completely understand*
 
 let dictionary = ["name": "Mike"]
 
 dictionary.flatMap { print($0.value) }
 
 let additionalDictionary = ["someID": ["name": "Mike"]]
 
 additionalDictionary.flatMap { print($0.value) }
 
 */

// DataSource
// build the url
// fetch students
// post students

// response string is mainly to help us see the results coming back. it will print everything that comes from the api. it'll help with debugging.

// since this is a simple app, we dont need the response data string.
