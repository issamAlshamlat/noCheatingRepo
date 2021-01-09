//
//  DeliveryItemTableViewCell.swift
//  LalaMove
//
//  Created by Issam Alshamlat on 1/5/21.
//

import UIKit
import Kingfisher

class DeliveryItemTableViewCell: UITableViewCell {
    
    let itemImage = UIImageView ()
    let fromLabel = UILabel()
    let toLabel = UILabel()
    let priceLabel = UILabel()
    let isFavourite = UIImageView ()
    let pickupLabel = UILabel ()
    var pickupImage = UIImageView ()
    let pickupTimeLabel = UILabel ()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String? ) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.separatorInset = UIEdgeInsets.zero
        
        itemImage.translatesAutoresizingMaskIntoConstraints = false
        fromLabel.translatesAutoresizingMaskIntoConstraints = false
        toLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        isFavourite.translatesAutoresizingMaskIntoConstraints = false
        pickupImage.translatesAutoresizingMaskIntoConstraints = false
        pickupLabel.translatesAutoresizingMaskIntoConstraints = false
        pickupTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(itemImage)
        contentView.addSubview(fromLabel)
        contentView.addSubview(toLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(isFavourite)
        contentView.addSubview(pickupLabel)
        contentView.addSubview(pickupImage)
        contentView.addSubview(pickupTimeLabel)
        
        itemImage.layer.cornerRadius = 10
        itemImage.layer.masksToBounds = true
        
        priceLabel.textAlignment = .center
        priceLabel.adjustsFontSizeToFitWidth = true
        
        isFavourite.contentMode = .center
        
        fromLabel.font = UIFont.boldSystemFont(ofSize: 15)
        toLabel.font = UIFont.boldSystemFont(ofSize: 15)
        priceLabel.font = UIFont.boldSystemFont(ofSize: 15)

        pickupLabel.textColor = UIColor.gray
        pickupLabel.font = UIFont.boldSystemFont(ofSize: 14)
        
        pickupTimeLabel.textColor = UIColor.gray
        pickupTimeLabel.font = UIFont.boldSystemFont(ofSize: 14)
        
        
        let itemImageLeadingConstraints = NSLayoutConstraint(item: itemImage , attribute: .leading, relatedBy: .equal, toItem: contentView , attribute: .leading, multiplier: 1, constant: 5)
        let itemImageWidthConstraints = NSLayoutConstraint(item: itemImage , attribute: .width, relatedBy: .equal, toItem: contentView , attribute: .width, multiplier: 0.3, constant: 0)
        let itemImageTopConstraints = NSLayoutConstraint(item: itemImage , attribute: .top, relatedBy: .equal, toItem: contentView , attribute: .top, multiplier: 1, constant: 5)
        let itemImageBottomConstraints = NSLayoutConstraint(item: itemImage , attribute: .bottom, relatedBy: .equal, toItem: contentView , attribute: .bottom, multiplier: 1, constant: -5)
        
        contentView.addConstraints([itemImageTopConstraints , itemImageWidthConstraints , itemImageBottomConstraints,itemImageLeadingConstraints])
        
        let fromLabelLeadingConstraints = NSLayoutConstraint(item: fromLabel , attribute: .leading, relatedBy: .equal, toItem: itemImage , attribute: .trailing, multiplier: 1, constant: 10)
        let fromLabelWidthConstraints = NSLayoutConstraint(item: fromLabel , attribute: .width, relatedBy: .equal, toItem: contentView , attribute: .width, multiplier: 0.4, constant: 0)
        let fromLabelTopConstraints = NSLayoutConstraint(item: fromLabel , attribute: .top, relatedBy: .equal, toItem: contentView , attribute: .top, multiplier: 1, constant: 0)
        let fromLabelHeightConstraints = NSLayoutConstraint(item: fromLabel , attribute: .height, relatedBy: .equal, toItem: contentView , attribute: .height, multiplier: 0.3, constant: 0)
        
        contentView.addConstraints([ fromLabelLeadingConstraints , fromLabelWidthConstraints , fromLabelTopConstraints ,fromLabelHeightConstraints])
        
        let toLabelLeadingConstraints = NSLayoutConstraint(item: toLabel , attribute: .leading, relatedBy: .equal, toItem: itemImage , attribute: .trailing, multiplier: 1, constant: 10)
        let toLabelWidthConstraints = NSLayoutConstraint(item: toLabel , attribute: .width, relatedBy: .equal, toItem: contentView , attribute: .width, multiplier: 0.4, constant: 0)
        let toLabelTopConstraints = NSLayoutConstraint(item: toLabel , attribute: .top, relatedBy: .equal, toItem: fromLabel , attribute: .bottom, multiplier: 1, constant: 0)
        let toLabelHeightConstraints = NSLayoutConstraint(item: toLabel , attribute: .height, relatedBy: .equal, toItem: contentView , attribute: .height, multiplier: 0.3, constant: 0)
        
        contentView.addConstraints([ toLabelLeadingConstraints , toLabelWidthConstraints , toLabelTopConstraints ,toLabelHeightConstraints])
        
        let pickupImageLeadingConstraints = NSLayoutConstraint(item: pickupImage , attribute: .leading, relatedBy: .equal, toItem: itemImage , attribute: .trailing, multiplier: 1, constant: 10)
        let pickupImageWidthConstraints = NSLayoutConstraint(item: pickupImage , attribute: .width, relatedBy: .equal, toItem: nil , attribute: .notAnAttribute, multiplier: 1 , constant: 20)
        let pickupImageTopConstraints = NSLayoutConstraint(item: pickupImage , attribute: .top, relatedBy: .equal, toItem: toLabel , attribute: .bottom, multiplier: 1, constant: 0)
        let pickupImageHeightConstraints = NSLayoutConstraint(item: pickupImage , attribute: .height, relatedBy: .equal, toItem: contentView , attribute: .height, multiplier: 0.3, constant: 0)

        contentView.addConstraints([ pickupImageLeadingConstraints , pickupImageWidthConstraints , pickupImageTopConstraints ,pickupImageHeightConstraints])
        
        let pickupLabelLeadingConstraints = NSLayoutConstraint(item: pickupLabel , attribute: .leading, relatedBy: .equal, toItem: pickupImage , attribute: .trailing, multiplier: 1, constant: 10)
        let pickupLabelWidthConstraints = NSLayoutConstraint(item: pickupLabel , attribute: .width, relatedBy: .equal, toItem: contentView , attribute: .width, multiplier: 0.3, constant: 0)
        let pickupLabelTopConstraints = NSLayoutConstraint(item: pickupLabel , attribute: .top, relatedBy: .equal, toItem: toLabel , attribute: .bottom, multiplier: 1, constant: 0)
        let pickupLabelHeightConstraints = NSLayoutConstraint(item: pickupLabel , attribute: .height, relatedBy: .equal, toItem: contentView , attribute: .height, multiplier: 0.15, constant: 0)

        contentView.addConstraints([ pickupLabelLeadingConstraints , pickupLabelWidthConstraints , pickupLabelTopConstraints ,pickupLabelHeightConstraints])
        
        let pickupTimeLabelLeadingConstraints = NSLayoutConstraint(item: pickupTimeLabel , attribute: .leading, relatedBy: .equal, toItem: pickupImage , attribute: .trailing, multiplier: 1, constant: 10)
        let pickupTimeLabelWidthConstraints = NSLayoutConstraint(item: pickupTimeLabel , attribute: .width, relatedBy: .equal, toItem: contentView , attribute: .width, multiplier: 0.3, constant: 0)
        let pickupTimeLabelTopConstraints = NSLayoutConstraint(item: pickupTimeLabel , attribute: .top, relatedBy: .equal, toItem: pickupLabel , attribute: .bottom, multiplier: 1, constant: 5)
        let pickupTimeLabelHeightConstraints = NSLayoutConstraint(item: pickupTimeLabel , attribute: .height, relatedBy: .equal, toItem: contentView , attribute: .height, multiplier: 0.15, constant: 0)

        contentView.addConstraints([ pickupTimeLabelLeadingConstraints , pickupTimeLabelWidthConstraints , pickupTimeLabelTopConstraints ,pickupTimeLabelHeightConstraints])
        
        let isFavouriteTrailingConstraints = NSLayoutConstraint(item: isFavourite , attribute: .trailing, relatedBy: .equal, toItem: contentView , attribute: .trailing, multiplier: 1, constant: -30)
        let isFavouriteLeadingConstraints = NSLayoutConstraint(item: isFavourite , attribute: .leading, relatedBy: .equal, toItem: fromLabel , attribute: .trailing, multiplier: 1, constant: 30)
        let isFavouriteTopConstraints = NSLayoutConstraint(item: isFavourite , attribute: .top, relatedBy: .equal, toItem: contentView , attribute: .top, multiplier: 1, constant: 0)
        let isFavouriteHeightConstraints = NSLayoutConstraint(item: isFavourite , attribute: .height, relatedBy: .equal, toItem: contentView , attribute: .height, multiplier: 0.5, constant: 0)

        contentView.addConstraints([  isFavouriteTrailingConstraints , isFavouriteTopConstraints ,isFavouriteHeightConstraints , isFavouriteLeadingConstraints])
        
        let priceLabelLeadingConstraints = NSLayoutConstraint(item: priceLabel , attribute: .leading, relatedBy: .equal, toItem: toLabel , attribute: .trailing, multiplier: 1, constant: 20)
        let priceLabelTrailingConstraints = NSLayoutConstraint(item: priceLabel , attribute: .trailing, relatedBy: .equal, toItem: contentView , attribute: .trailing, multiplier: 1, constant: -10)
        let priceLabelTopConstraints = NSLayoutConstraint(item: priceLabel , attribute: .top, relatedBy: .equal, toItem: isFavourite , attribute: .bottom, multiplier: 1, constant: 0)
        let priceLabelBottomConstraint = NSLayoutConstraint(item: priceLabel , attribute: .bottom, relatedBy: .equal, toItem: contentView , attribute: .bottom, multiplier: 1, constant: 0)

        contentView.addConstraints([ priceLabelLeadingConstraints , priceLabelTrailingConstraints , priceLabelTopConstraints ,priceLabelBottomConstraint])
        

        
    }
    
    func configurate( delivery : [Delivery] , index : Int) {
        let favouriteItemsIds =  UserDefaults.standard.stringArray(forKey: "favArr") != nil ? UserDefaults.standard.stringArray(forKey: "favArr")! : []

        fromLabel.text = delivery[index].route.start
        toLabel.text = "To : " + delivery[index].route.end
        let currencyString = delivery[index].deliveryFee.prefix(1)
        isFavourite.image = favouriteItemsIds.contains(delivery[index].id) ? UIImage (named : "heart") : UIImage (named : "")
        priceLabel.text = String (format : "%.02f" , Double( String (delivery[index].deliveryFee.dropFirst()))! + Double (String ( delivery[index].surcharge.dropFirst()))!) + " " + currencyString
        itemImage.image = #imageLiteral(resourceName: "picture")
        if let url = URL(string: delivery[index].goodsPicture) {
            itemImage.kf.setImage(with: url)
        }
        let pickupTime = delivery[index].pickupTime.components(separatedBy: "T")
        pickupLabel.text = pickupTime[0]
        pickupTimeLabel.text = String(pickupTime[1].prefix(5))
        pickupImage.image = #imageLiteral(resourceName: "pickup-truck ")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
