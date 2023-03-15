//
//  ViewController2.swift
//  DataBaseSqlite
//
//  Created by Bhautik Rajodiya on 11/03/23.
//

import UIKit

class ViewController2: UIViewController,UITableViewDelegate,UITableViewDataSource {
   

    @IBOutlet weak var tb: UITableView!
    var abc = SQLHelper.retriveData()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return abc.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tb.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        cell.l1.text = abc[indexPath.row].id.description
        cell.l2.text = abc[indexPath.row].name
        
        return cell
    }

}
