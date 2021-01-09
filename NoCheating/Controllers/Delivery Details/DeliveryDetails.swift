//
//  DeliveryDetails.swift
//  LalaMove
//
//  Created by Issam Alshamlat on 1/5/21.
//

import Foundation
import UIKit
import Kingfisher

class DeliveryDetails : UIViewController {
    
    var deliveryDetailsInfo : Delivery?
    var addToFavouriteButton : UIButton?
    var favouriteItemsIds = UserDefaults.standard.stringArray(forKey: "favArr") != nil ? UserDefaults.standard.stringArray(forKey: "favArr") : []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UserDefaults.standard.setValue(favouriteItemsIds, forKey: "favArr")

    }
    
    func setupUI () {
        self.view.backgroundColor = .white
        self.title = "Delivery Details"

        let fromLabel = UILabel (frame: CGRect(x: 10 , y: 80, width: view.frame.size.width * 0.3 , height: 50))
        let fromLabelValue = UILabel (frame: CGRect(x: view.frame.size.width * 0.3 , y: 80, width: view.frame.size.width * 0.7, height: 50))
        
        let toLabel = UILabel (frame: CGRect(x: 10, y: 130, width: view.frame.size.width * 0.3, height: 50))
        let toLabelValue = UILabel (frame: CGRect(x: view.frame.size.width * 0.3 , y: 130, width: view.frame.size.width * 0.7, height: 50))
        
        let timeLabel = UILabel (frame: CGRect(x: 10, y: 180 , width: view.frame.size.width * 0.3, height: 50))
        let timeLabelValue = UILabel (frame: CGRect(x: view.frame.size.width * 0.3 , y: 180, width: view.frame.size.width * 0.7, height: 50))

        
        let divider = UIView (frame: CGRect(x: 30 , y: 235 , width: view.frame.size.width - 60 , height: 1))
        
        let goodsLabel = UILabel (frame: CGRect(x: 10, y: 240, width: view.frame.size.width, height: 60))
        let goodsImage = UIImageView (frame: CGRect (x: 10 , y: 300 , width: view.frame.size.width * 0.5 , height:  120))
        
        let imageDivider = UIView (frame: CGRect(x: 30 , y: 435 , width: view.frame.size.width - 60 , height: 1))
        
        let deliveryFeeLabel = UILabel (frame: CGRect(x: 10, y: 440, width: view.frame.size.width * 0.5, height: 60))
        let deliveryFeeValueLabel = UILabel (frame: CGRect(x: view.frame.size.width * 0.5 , y: 440, width: view.frame.size.width * 0.5, height: 60))
        
        addToFavouriteButton = UIButton (frame: CGRect(x: 10 , y: view.bounds.size.height - 60 , width: view.frame.size.width - 20 , height: 50))
        
        if let url = URL(string: deliveryDetailsInfo!.goodsPicture) {
            goodsImage.kf.setImage(with: url)
        }
        
        fromLabel.textAlignment = .left
        toLabel.textAlignment = .left
        goodsLabel.textAlignment = .left
        deliveryFeeLabel.textAlignment = .left
        deliveryFeeValueLabel.textAlignment = .center

        addToFavouriteButton!.setTitle( favouriteItemsIds!.contains(deliveryDetailsInfo!.id) ? "Remove from favourite" : "Add To Favourite", for: .normal)
        addToFavouriteButton!.layer.borderWidth = 1.0
        addToFavouriteButton!.layer.borderColor = UIColor.black.cgColor
        addToFavouriteButton!.setTitleColor(UIColor.black , for: .normal)
        addToFavouriteButton!.addTarget(self, action: #selector (addToFavouritePressed), for: .touchUpInside)
        addToFavouriteButton?.layer.cornerRadius = 10
        addToFavouriteButton?.layer.masksToBounds = true
        
        fromLabel.font = UIFont.boldSystemFont(ofSize: 20)
        fromLabelValue.font = UIFont.boldSystemFont(ofSize: 18)
        
        toLabel.font = UIFont.boldSystemFont(ofSize: 20)
        toLabelValue.font = UIFont.boldSystemFont(ofSize: 18)
        
        goodsLabel.font = UIFont.boldSystemFont(ofSize: 20)
        goodsLabel.text = "Goods to deliver"
        
        
        divider.backgroundColor = UIColor.gray.withAlphaComponent(0.4)
        
        imageDivider.backgroundColor = UIColor.gray.withAlphaComponent(0.4)
        
        deliveryFeeLabel.font = UIFont.boldSystemFont(ofSize: 20)
        deliveryFeeValueLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        fromLabel.text = "From : "
        fromLabelValue.text = deliveryDetailsInfo?.route.start
        fromLabelValue.textColor = UIColor.black.withAlphaComponent(0.7)
        
        toLabel.text = "To : "
        toLabelValue.text = deliveryDetailsInfo?.route.end
        toLabelValue.textColor = UIColor.black.withAlphaComponent(0.7)
        
        goodsImage.layer.cornerRadius = 10
        goodsImage.layer.masksToBounds = true
        
        addToFavouriteButton?.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        
        deliveryFeeLabel.text = "Delivery Fee"
        deliveryFeeValueLabel.textColor = UIColor.black.withAlphaComponent(0.7)
        
        let pickupTime = deliveryDetailsInfo?.pickupTime.components(separatedBy: "T")
        timeLabel.text = "Pickup :"
        timeLabel.font = UIFont.boldSystemFont(ofSize: 20)
        timeLabelValue.font = UIFont.boldSystemFont(ofSize: 18)
        timeLabelValue.text = pickupTime![0] + " at " + pickupTime![1].prefix(5)
        timeLabelValue.textColor = UIColor.black.withAlphaComponent(0.7)
        
        let currencyString = deliveryDetailsInfo!.deliveryFee.prefix(1)
        deliveryFeeValueLabel.text = String (format : "%.02f" , Double( String (deliveryDetailsInfo!.deliveryFee.dropFirst()))! + Double (String ( deliveryDetailsInfo!.surcharge.dropFirst()))!) + " " + currencyString
        
        view.addSubview(fromLabel)
        view.addSubview(toLabel)
        view.addSubview(goodsLabel)
        view.addSubview(goodsImage)
        view.addSubview(deliveryFeeLabel)
        view.addSubview(deliveryFeeValueLabel)
        view.addSubview(addToFavouriteButton!)
        view.addSubview(fromLabelValue)
        view.addSubview(toLabelValue)
        view.addSubview(divider)
        view.addSubview(imageDivider)
        view.addSubview(timeLabel)
        view.addSubview(timeLabelValue)
    }
    
    @objc func addToFavouritePressed () {

        addToFavouriteButton!.setTitle( favouriteItemsIds!.contains(deliveryDetailsInfo!.id) ? "Add To Favourite" : "Remove from favourite" , for: .normal)
        if !favouriteItemsIds!.contains(deliveryDetailsInfo!.id) {
            favouriteItemsIds!.append(deliveryDetailsInfo!.id)
            
        }else {
            favouriteItemsIds!.remove(at: favouriteItemsIds!.firstIndex(of: deliveryDetailsInfo!.id)! )
        }
    }
    
}
