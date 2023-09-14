//
//  ViewController.swift
//  AnimationPlayGround
//
//  Created by 林哲豪 on 2023/9/13.
//

import UIKit

class LobbyViewController: UIViewController {
    
    var dataList: [DataModel] = [
        DataModel(name: "基本操作", type: .uvpa)]

    @IBOutlet weak var listTableView: UITableView! {
        didSet {
            listTableView.delegate = self
            listTableView.dataSource = self
            listTableView.registerCellWithNib(identifier: AnimationDataCell.identifier, bundle: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    
}

extension LobbyViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AnimationDataCell.identifier, for: indexPath)
        
        guard let animationDataCell = cell as? AnimationDataCell else {
            return cell
        }
        animationDataCell.setValueIntoLabel(dataList[indexPath.row].type.rawValue, dataList[indexPath.row].name)
        
        return animationDataCell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = PropertyAnimatorManager.shared.createPAVC()
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
