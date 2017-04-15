//
//  TitltleCollectionViewCell.swift
//  iosblackcard
//
//  Created by sum on 2017/4/14.
//  Copyright © 2017年 YunDian. All rights reserved.
//

import UIKit
import SnapKit
class TitltleCollectionViewCell: BaseCustomerCell{
    
    lazy var  titltLb: UILabel = {
        let customerName = UILabel()
        customerName.textAlignment = .center
        customerName.textColor = transferStringToColor("434343")
        customerName.font = UIFont.systemFont(ofSize: 16)
        
        return customerName
    }()
    lazy var Account: UILabel = {
        let Account = UILabel()
        Account.textAlignment = .center
        Account.textColor = transferStringToColor("E3A63F")
        Account.font = UIFont.systemFont(ofSize: 12)
        return Account
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.clipsToBounds = true
        self.layer.cornerRadius  = 3
        self.layer.borderWidth = 1
        self.layer.borderColor = transferStringToColor("A6A6A6").cgColor
      
         self.addSubview(titltLb)
         self.addSubview(Account)
        
        titltLb.snp.makeConstraints { (make) in
            
            make.top.equalTo(10)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(25)
            
        }
        Account.snp.makeConstraints { (make) in
            
            make.top.equalTo(titltLb.snp.bottom).offset(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(20)
            
        }
      
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func update(model:AnyObject, withAnimal :Bool){
    
        let dic = model as! [String : String]
        titltLb.text = dic.keys.first
        Account.text = dic[dic.keys.first!]
        if withAnimal{
        
            self.layer.borderColor = transferStringToColor("E3A63F").cgColor
            self.layer.borderWidth = 2
        }else{
            self.layer.borderWidth = 1
            self.layer.borderColor = transferStringToColor("A6A6A6").cgColor

        }
    }
    
}
class CustomerollectionViewCell: BaseCustomerCell{
    
    lazy var  titltLb: UILabel = {
        let customerName = UILabel()
        customerName.textAlignment = .center
        customerName.textColor = transferStringToColor("434343")
        customerName.font = UIFont.systemFont(ofSize: 16)
        
        return customerName
    }()
    lazy var Account: UILabel = {
        let Account = UILabel()
        Account.textAlignment = .center
        Account.textColor = transferStringToColor("E3A63F")
        Account.font = UIFont.systemFont(ofSize: 12)
        return Account
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.clipsToBounds = true
        self.layer.cornerRadius  = 3
        self.layer.borderWidth = 1
        self.layer.borderColor = transferStringToColor("A6A6A6").cgColor
        
        self.addSubview(titltLb)
        self.addSubview(Account)
        
        titltLb.snp.makeConstraints { (make) in
            
            make.top.equalTo(10)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(25)
            
        }
        Account.snp.makeConstraints { (make) in
            
            make.top.equalTo(titltLb.snp.bottom).offset(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(20)
            
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func update(model:AnyObject, withAnimal :Bool){
        
        let dic = model as! [String : String]
        titltLb.text = dic.keys.first
        Account.text = dic[dic.keys.first!]
        if withAnimal{
            
            self.layer.borderColor = transferStringToColor("E3A63F").cgColor
            self.layer.borderWidth = 2
        }else{
            self.layer.borderWidth = 1
            self.layer.borderColor = transferStringToColor("A6A6A6").cgColor
            
        }
    }
    
    
    
}

