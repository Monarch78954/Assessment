//
//  UserDataVC.swift
//  Assessment
//
//  Created by Monarch Bhardwaj on 30/03/22.
//

import UIKit
import Alamofire

class UserDataVC: UIViewController {
    
    @IBOutlet weak var userDataTV: UITableView!
    
    var resultData = [DataModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.getUserData()
    }
    
    func getUserData(){
        let url = "https://mocki.io/v1/55a8c3e1-e9db-46d3-bb2e-7746c0514ca1"
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            if response.result.value != nil{
                do{
                    self.resultData = try JSONDecoder().decode([DataModel].self, from: response.data!)
                    self.userDataTV.reloadData()
                }catch{
                    print(error)
                }
            }
        }
    }
}

extension UserDataVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserDataTVC", for: indexPath) as! UserDataTVC
        cell.userIdLabel.text = "User ID: \(self.resultData[indexPath.row].userId!)"
        cell.idLabel.text = "ID: \(self.resultData[indexPath.row].id!)"
        cell.titleLabel.text = "Title: \(self.resultData[indexPath.row].title!)"
        return cell
    }
}
