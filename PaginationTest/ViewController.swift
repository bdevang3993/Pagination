//
//  ViewController.swift
//  PaginationTest
//
//  Created by devang bhavsar on 26/04/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tblDisplayData: UITableView!
    var arrJsonData = [PostIDData]()
    var postId:Int = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tblDisplayData.delegate = self
        self.tblDisplayData.dataSource = self
        self.tblDisplayData.estimatedRowHeight = 200
        self.setupAPIRequest()
    }
    func  setupAPIRequest() {
        let url = "https://jsonplaceholder.typicode.com/comments?postId=\(postId)"
        DispatchQueue.global(qos: .userInteractive).sync {
            
            APIRequestURL().getRequest(serviceName: url) { (jm:[PostIDData]) in
                print("Data = \(jm)")
                DispatchQueue.main.async {
                    for i in 0...jm.count - 1 {
                        self.arrJsonData.append(jm[i])
                    }
                    self.tblDisplayData.reloadData()
                }
                
               
            } andFailureBlock: { error in
                print("Failed Error = \(error)")
            }
        }
    }

}
extension ViewController:UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrJsonData.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        UITableView.automaticDimension
//    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblDisplayData.dequeueReusableCell(withIdentifier: "DescriptionTableViewCell") as! DescriptionTableViewCell
        let data = arrJsonData[indexPath.row]
        if let id = data.id {
            cell.lblUserId.text = "Id : " + "\(id)"
        }
        if let title = data.name {
            cell.lblTItle.text = "TItle : " + title
        }
        if let description = data.body {
            cell.txtViewDescription.text = description
        }
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastSectionIndex = tableView.numberOfSections - 1
        let lastRowIndex = tableView.numberOfRows(inSection: lastSectionIndex) - 1
        if indexPath.section ==  lastSectionIndex && indexPath.row == lastRowIndex {
           // print("this is the last cell")
            let spinner = UIActivityIndicatorView(style: .gray)
            spinner.startAnimating()
            spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: tableView.bounds.width, height: CGFloat(44))
            if self.postId > 100 {
                Alert().showAlert(message: "You can't be scroll more then this Data", viewController: self)
                return
            }
            self.postId = self.postId + 1
            self.setupAPIRequest()
            self.tblDisplayData.tableFooterView = spinner
            self.tblDisplayData.tableFooterView?.isHidden = false
        }
    }

    
}
