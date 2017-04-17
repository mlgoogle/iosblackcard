//
//  LineTitleView.swift
//  iosblackcard
//
//  Created by sum on 2017/4/15.
//  Copyright © 2017年 YunDian. All rights reserved.
//

import UIKit
class InputWithBorder: UIView {
    
    
    var leftImg :  UIImageView?
    var leftLine : UIImageView?
    lazy var inputTf: UITextField = {
        let customerName = UITextField()
        customerName.font = UIFont.systemFont(ofSize: 13)
        //        customerName.textAlignment = .center
        
        customerName.placeholder = "请输入您的卡号/手机号码"
        return customerName
    }()
    var showImg : Bool?{
    
        didSet{
        
            if  showImg == false{
                
                leftImg?.isHidden = true
                leftLine?.isHidden = true
                inputTf.snp.makeConstraints { (make) in
                    make.left.equalTo(17)
                    make.top .equalTo(0)
                    make.bottom .equalTo(0)
                    make.right .equalTo(0)
                }

  
            }
        }
    }
    override init(frame: CGRect){
        
        super.init(frame : frame)
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.white.cgColor
        initUI()
    
    }
    func initUI(){
    
        leftImg  =  UIImageView.init()
        leftImg?.image = UIImage.init(named: "rechargebanner")
        self.addSubview(leftImg!)
        leftImg?.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.left.equalTo(10)
            
            make.bottom.equalTo(-10)
            make.width.equalTo(15)
            
        }
        let leftLine  =  UIImageView.init()
        leftLine.backgroundColor = transferStringToColor("FFFFFF")
        self.addSubview(leftLine)
        leftLine.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.left.equalTo((leftImg?.snp.right)!).offset(10)
            make.bottom.equalTo(-10)
            make.width.equalTo(0.5)
            
            
        }
      
         self.addSubview(inputTf)
        inputTf.snp.makeConstraints { (make) in
            make.left.equalTo(leftLine.snp.right).offset(20)
            make.top .equalTo(0)
            make.bottom .equalTo(0)
            make.right .equalTo(0)
        }
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
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
