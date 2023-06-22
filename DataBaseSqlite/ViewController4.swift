//
//  ViewController4.swift
//  DataBaseSqlite
//
//  Created by R96 on 20/06/23.
//

import UIKit

class ViewController4: UIViewController {
    
    @IBOutlet weak var t1: UITextField!
    
    @IBOutlet weak var t2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btAction(_ sender: Any) {
        if SQLHelper.checkData(name: t2.text ?? "", id: Int(t1.text ?? "") ?? 0 )
        {
            print("login****")
        }
    }
    
}
