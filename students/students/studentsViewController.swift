//
//  studentsViewController.swift
//  students
//
//  Created by Александр Иванов on 09.07.2021.
//

import UIKit

class studentsViewController: UIViewController {

    @IBOutlet weak var studTableView: UITableView!{
        didSet{
            studTableView?.delegate = self
            studTableView?.dataSource = self
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.studTableView.reloadData()
    }
    
}


extension studentsViewController:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Base.shared.rating.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell!
        if let dCell = tableView.dequeueReusableCell(withIdentifier: "dCell"){
            cell = dCell
        }else{
            cell = UITableViewCell()
        }
        
        cell.textLabel!.text = Base.shared.rating[indexPath.row].description
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "addViewController") as? addViewController else {return}
        
        vc.showName = Base.shared.rating[indexPath.row].name
        vc.showSurname = Base.shared.rating[indexPath.row].surname
        vc.showRate = Base.shared.rating[indexPath.row].rate
        vc.indexBase = indexPath.row
        
        
        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
}
