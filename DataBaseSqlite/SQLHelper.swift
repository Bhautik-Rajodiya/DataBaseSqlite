//
//  SQLHelper.swift
//  DataBaseSqlite
//
//  Created by Bhautik Rajodiya on 11/03/23.

import Foundation
import SQLite3

struct Model {
    var id: Int
    var name: String
}

class SQLHelper {
    
    static var file: OpaquePointer?
    
    static func creatFlie() {
        var x = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        x.appendPathComponent("My Sql File1.db")
        sqlite3_open(x.path, &file)
        print(x.path)
        creatTable()
    }
    
    static func creatTable() {
        let q = "Create Table if not exists Students (name text, id integer)"
        var table: OpaquePointer?
        sqlite3_prepare(file, q, -1, &table, nil)
        sqlite3_step(table)
    }
    static func addData(name: String , id: Int) {
        let q = "insert into students values ('\(name)', \(id))"
        var add: OpaquePointer?
        sqlite3_prepare(file, q, -1, &add, nil)
        sqlite3_step(add)
    }
    static func retriveData()-> [Model]{
        var arr = [Model]()
        let q = "select * from Students"
        var get: OpaquePointer?
        sqlite3_prepare(file, q, -1, &get, nil)
        
        while sqlite3_step(get) == SQLITE_ROW {
            let id = sqlite3_column_int64(get, 1)
            print("id = \(id); ", terminator: "")
            
            if let cString = sqlite3_column_text(get, 0) {
                let name = String(cString: cString)
//                model(id: Int(id), name: name)
                arr.append(Model(id: Int(id), name: name))
            } else {
                print("name not found")
            }
        }
        
        return arr
    }
    static func deleteData(name:String,id : Int) {
        let q = "DELETE FROM Students WHERE id = \(id)"
        var table: OpaquePointer?
        sqlite3_prepare(file, q, -1, &table, nil)
        sqlite3_step(table)
        
    }
}
