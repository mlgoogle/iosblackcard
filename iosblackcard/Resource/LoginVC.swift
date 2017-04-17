//
//  LoginVC.swift
//  iosblackcard
//
//  Created by sum on 2017/4/15.
//  Copyright © 2017年 YunDian. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    lazy var bannerImg: UIImageView = {
        let bannerImg = UIImageView()
        //        bannerImg.backgroundColor = UIColor.red
        return bannerImg
    }()
    lazy var phone: UITextField = {
        let customerName = UITextField()
        customerName.font = UIFont.systemFont(ofSize: 13)
//        customerName.textAlignment = .center

        customerName.placeholder = "请输入您的卡号/手机号码"
        return customerName
    }()
    
    lazy var loginBtn: UIButton = {
        let loginBtn = UIButton()
        loginBtn.backgroundColor = transferStringToColor("CDA351")
        loginBtn.setTitle("登录", for: .normal)
        loginBtn.layer.cornerRadius = 3
        loginBtn.clipsToBounds = true
        loginBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        
        
        return loginBtn
    }()
    lazy var passPd: UITextField = {
        let customerName = UITextField()
        customerName.font = UIFont.systemFont(ofSize: 13)
       
        customerName.layer.borderColor = transferStringToColor("F4F4F4").cgColor
        customerName.placeholder = "请输入您的登录密码"
        return customerName
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
        // Do any additional setup after loading the view.
    }
    func initUI(){
    
        let head  =  UIImageView.init()
        head.image = UIImage.init(named: "rechargebanner")
        view.addSubview(head)
        head.clipsToBounds = true
        head.layer.cornerRadius = 40
        head.snp.makeConstraints { (make) in
            make.top.equalTo(60)
         
            make.centerX.equalTo(self.view.center.x)

             make.height.equalTo(80)
            make.width.equalTo(80)
            
        }
        
        
        self.view.backgroundColor = UIColor.gray
        let cusomer = UIView.init()
        cusomer.layer.cornerRadius = 5
        cusomer.layer.borderWidth = 1
        cusomer.layer.borderColor = UIColor.white.cgColor
        view.addSubview(cusomer)
         cusomer.snp.makeConstraints { (make) in
            make.top.equalTo(head.snp.bottom).offset(30)
            make.left.equalTo(17)
            make.right.equalTo(-17)
             make.height.equalTo(44)
            
        }
     
        let left  =  UIImageView.init()
          left.image = UIImage.init(named: "rechargebanner")
         cusomer.addSubview(left)
        left.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.left.equalTo(10)
          
            make.bottom.equalTo(-10)
            make.width.equalTo(15)
            
        }
        let leftLine  =  UIImageView.init()
        leftLine.backgroundColor = transferStringToColor("FFFFFF")
        cusomer.addSubview(leftLine)
        leftLine.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.left.equalTo(left.snp.right).offset(10)
            make.bottom.equalTo(-10)
            make.width.equalTo(0.5)
            
            
        }
        cusomer.addSubview(phone)
        phone.snp.makeConstraints { (make) in
             make.left.equalTo(leftLine.snp.right).offset(20)
             make.top .equalTo(0)
             make.bottom .equalTo(0)
             make.right .equalTo(0)
        }
        
        let cusomerPd = UIView.init()
        view.addSubview(cusomerPd)
        cusomerPd.layer.cornerRadius = 5
        cusomerPd.layer.borderWidth = 1
        cusomerPd.layer.borderColor = UIColor.white.cgColor

        cusomerPd.snp.makeConstraints { (make) in
            make.top.equalTo(cusomer.snp.bottom).offset(40)
            make.left.equalTo(17)
            make.right.equalTo(-17)
            make.height.equalTo(44)
            
        }
        
        let leftpd  =  UIImageView.init()
        leftpd.image = UIImage.init(named: "rechargebanner")
        cusomerPd.addSubview(leftpd)
        leftpd.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.width.equalTo(15)
            make.left.equalTo(10)

            make.bottom.equalTo(-10)
            
        }
        let leftpdLine  =  UIImageView.init()
        leftpdLine.backgroundColor = transferStringToColor("FFFFFF")
        cusomerPd.addSubview(leftpdLine)
        leftpdLine.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.left.equalTo(leftpd.snp.right).offset(10)
            make.bottom.equalTo(-10)
            make.width.equalTo(0.5)
            
            
        }
        cusomerPd.addSubview(passPd)
        passPd.snp.makeConstraints { (make) in
            make.left.equalTo(leftpdLine.snp.right).offset(20)
            make.top .equalTo(0)
            make.bottom .equalTo(0)
            make.right .equalTo(0)
        }
        
         view.addSubview(loginBtn)
        loginBtn.snp.makeConstraints { (make) in
            make.left .equalTo(17)
             make.right .equalTo(-17)
             make.height .equalTo(44)
            make.top.equalTo(cusomerPd.snp.bottom).offset(60)
        }
        
        let nowBtn = UIButton()
        view.addSubview(nowBtn)
        nowBtn.backgroundColor = UIColor.clear
        nowBtn.setTitle("在线申请", for: .normal)
       
        nowBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        nowBtn.snp.makeConstraints { (make) in
            make.left.equalTo(17)
            make.top .equalTo(loginBtn.snp.bottom).offset(20)
            
            make.width .equalTo(70)
        }
        let regist = UIButton()
         view.addSubview(regist)
        regist.backgroundColor = UIColor.clear
        regist.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        regist.setTitle("找回密码", for: .normal)
               nowBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        regist.snp.makeConstraints { (make) in
            make.right.equalTo(-17)
            make.top .equalTo(loginBtn.snp.bottom).offset(20)
            
            make.width .equalTo(70)
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    


}
