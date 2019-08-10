//
//  Item1ViewController.swift
//  AlamofirePractice
//
//  Created by 黃威愷 on 2018/8/30.
//  Copyright © 2018年 黃威愷. All rights reserved.
//

import UIKit
import Alamofire

class Item1ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{
    @IBOutlet var tableView:UITableView!
    private var notes = ["","","","",""]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        Alamofire.request("http://127.0.0.1:5000/todo/api/v1.0/tasks").responseJSON
            {(response) in
                
                if let data = response.result.value{
                    let temp:Dictionary = data as! Dictionary<String,Any>
                    self.notes[0] = temp["note1"] as! String
                    self.notes[1] = temp["note2"] as! String
                    self.notes[2] = temp["note3"] as! String
                    self.notes[3] = temp["note4"] as! String
                    self.notes[4] = temp["note5"] as! String
                }
                cell.textLabel?.text = self.notes[indexPath.row]
        }
        return cell
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
