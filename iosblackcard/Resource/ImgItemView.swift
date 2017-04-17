//
//  ImgItemView.swift
//  iosblackcard
//
//  Created by sum on 2017/4/15.
//  Copyright © 2017年 YunDian. All rights reserved.
//

import UIKit

class ImgItemView: BaseCustomerCell {

    lazy var  imgView: UIImageView = {
        let customerName = UIImageView()
        customerName.backgroundColor = UIColor.red
        
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
        
        self.layer.borderWidth = 1
        self.layer.borderColor = transferStringToColor("A6A6A6").cgColor
        
        self.addSubview(imgView)
        self.addSubview(Account)
        
        imgView.snp.makeConstraints { (make) in
            
            make.top.equalTo(0)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.height.equalTo(self.frame.size.height - 20)
            
            
        }
        Account.snp.makeConstraints { (make) in
            
            make.top.equalTo(imgView.snp.bottom).offset(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(20)
           Account.text = "123"
            
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func update(model:AnyObject, withAnimal :Bool){
        
        let dic = model as! [String : String]
//        titltLb.text = dic.keys.first
        Account.text = dic[dic.keys.first!]
        if withAnimal{
            
            self.layer.borderColor = transferStringToColor("A6A6A6").cgColor
            self.layer.borderWidth = 2
        }else{
            self.layer.borderWidth = 1
            self.layer.borderColor = transferStringToColor("A6A6A6").cgColor
            
        }
    }
    

}
