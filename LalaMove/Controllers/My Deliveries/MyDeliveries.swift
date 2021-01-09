//
//  ViewController.swift
//  LalaMove
//
//  Created by Issam Alshamlat on 1/4/21.
//

import UIKit
import SVProgressHUD
import Kingfisher

class MyDeliveries: UIViewController {
    
    private var deliveryTableView: UITableView!
    var dataSource : [Delivery] = []
    var favouriteItemsIds = [String] ()
    var offset: Int = 0
    var limit: Int = 20
    var isDataLoading: Bool = false
    var dbManager = DBManager ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        setup()
        fetchData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.title = " "
    }
    
    private func setup () {
        
        self.title = "My Deliveries"
        favouriteItemsIds =  UserDefaults.standard.stringArray(forKey: "favArr") != nil ? UserDefaults.standard.stringArray(forKey: "favArr")! : []
        dataSource.removeAll()
        offset = 0
        self.navigationController!.navigationBar.tintColor = UIColor.black
    }
    
    private func setupTableView () {
        let barHeight : CGFloat = (self.navigationController?.navigationBar.frame.height)!
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height

        deliveryTableView = UITableView(frame: CGRect(x: 0, y: (self.navigationController?.navigationBar.frame.height)! , width: displayWidth, height: displayHeight - barHeight))
        deliveryTableView.register( DeliveryItemTableViewCell.self , forCellReuseIdentifier: "DeliveryCell")
        deliveryTableView.dataSource = self
        deliveryTableView.delegate = self
        
        self.view.addSubview(deliveryTableView)
    }
    
    func fetchData () {
        SVProgressHUD.show()
        self.view.isUserInteractionEnabled = false
        LalaMoveRequestManager.getDeliveries(offset: offset , limit: limit) { (success, responseObject, error) in
            SVProgressHUD.dismiss()
            self.view.isUserInteractionEnabled = true
            if success {
                guard let response = responseObject as? [Dictionary<String, AnyObject>] else {
                    print("Dedode Error bookings")
                    return
                }
                for delivery in response {
                    self.dataSource.append(Delivery(delivery))
                }
                
                if self.dbManager.openDatabase() {
                    self.dbManager.insertDeliveryData(delivery: self.dataSource)
                    let d = self.dbManager.loadNotes()
                }

                self.deliveryTableView.reloadData()
            }else {
                self.dataSource = self.dbManager.loadNotes()
                self.deliveryTableView.reloadData()
            }
        }
        
    }
    
}

extension MyDeliveries : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DeliveryCell", for: indexPath as IndexPath) as! DeliveryItemTableViewCell
        cell.configurate(delivery: dataSource , index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DeliveryDetails ()
        vc.deliveryDetailsInfo = dataSource[indexPath.row]
        vc.modalPresentationStyle = .currentContext
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension MyDeliveries : UIScrollViewDelegate {
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
            isDataLoading = false
        }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if ((deliveryTableView.contentOffset.y + deliveryTableView.frame.size.height) >= deliveryTableView.contentSize.height)
        {
            if !isDataLoading{
                isDataLoading = true
                self.offset = dataSource.count
                fetchData()

            }
        }
    }
    
}
