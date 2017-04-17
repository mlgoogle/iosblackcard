//
//  LineTitleView.swift
//  iosblackcard
//
//  Created by sum on 2017/4/15.
//  Copyright © 2017年 YunDian. All rights reserved.
//

import UIKit

class LineTitleView: UIView {
    
    var title : String?{
    
    didSet{
        titltLb.text = title
    }
    }
    
    lazy var  titltLb: UILabel = {
        let customerName = UILabel()
        customerName.textAlignment = .center
        customerName.textColor = transferStringToColor("E3A63F")
        customerName.font = UIFont.systemFont(ofSize: 10)
        
        return customerName
    }()
     override init(frame: CGRect) {
    
        super.init(frame: frame)
        
        self.addSubview(titltLb)
        titltLb.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            
            make.centerX.equalTo(self.center.x)
            
            make.height.equalTo(30)
            
        }
        titltLb.text = "云栖会籍专属特权"
        let line = UILabel()
        self.addSubview(line)
        line.snp.makeConstraints { (make) in
            make.top.equalTo(15)
            make.left.equalTo(24)
            make.height.equalTo(0.5)
            
            make.right.equalTo(titltLb.snp.left).offset(-12)
        }
        line.backgroundColor = UIColor.gray
        
        let rightline = UILabel()
        self.addSubview(rightline)
        rightline.snp.makeConstraints { (make) in
            make.top.equalTo(15)
            make.left.equalTo(titltLb.snp.right).offset(12)
            make.height.equalTo(0.5)
            make.right.equalTo(-24)
        }
        rightline.backgroundColor = UIColor.gray
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
