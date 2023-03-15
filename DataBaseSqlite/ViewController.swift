//
//  ViewController.swift
//  DataBaseSqlite
//
//  Created by Bhautik Rajodiya on 11/03/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var idTextFiled: UITextField!
    @IBOutlet weak var nameTextFiled: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SQLHelper.creatFlie()
        
    }

    @IBAction func addDataAction(_ sender: Any) {
        if let x = idTextFiled.text , let y = Int(x) {
        SQLHelper.addData(name: nameTextFiled.text ?? "", id: y )
        }
    }
    
    @IBAction func getData(_ sender: Any) {
        neviction()
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        if let x = idTextFiled.text , let y = Int(x) {
            SQLHelper.deleteData(name: nameTextFiled.text ?? "", id: y)
        }
        
    }
    func neviction() {
        let neviget = storyboard?.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2 
        navigationController?.pushViewController(neviget, animated: true)
    }
}
