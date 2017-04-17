//
//  LoginVC.swift
//  iosblackcard
//
//  Created by sum on 2017/4/15.
//  Copyright © 2017年 YunDian. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
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
        
        let input = InputWithBorder.init(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.size.width, height: 44))
        input.inputTf.placeholder = "请输入您的卡号/手机号码"
        
        self.view.addSubview(input)
        phone = input.inputTf
        input.snp.makeConstraints { (make) in
            make.top.equalTo(head.snp.bottom).offset(60)
            make.centerX.equalTo(self.view.center.x)
            make.height.equalTo(44)
            make.left.equalTo(17)
            make.right.equalTo(-17)
        }
        
        self.view.backgroundColor = UIColor.gray
        let inputPwd = InputWithBorder.init(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.size.width, height: 44))
        inputPwd.inputTf.placeholder = "请输入您的密码"
        inputPwd.showImg = false
        self.view.addSubview(inputPwd)
        passPd = inputPwd.inputTf
        inputPwd.snp.makeConstraints { (make) in
            make.top.equalTo(input.snp.bottom).offset(30)
            make.centerX.equalTo(self.view.center.x)
            make.height.equalTo(44)
            make.left.equalTo(17)
            make.right.equalTo(-17)
        }
        
        
        self.view.addSubview(loginBtn)
        loginBtn.snp.makeConstraints { (make) in
            make.left.equalTo(17)
            make.right.equalTo(-17)
            make.height.equalTo(44)
            make.top .equalTo(inputPwd.snp.bottom).offset(20)
        }
        let nowBtn = UIButton()
        view.addSubview(nowBtn)
        nowBtn.backgroundColor = UIColor.clear
        nowBtn.setTitle("在线申请", for: .normal)
        nowBtn.addTarget(self , action: #selector(doregist), for: .touchUpInside)
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
    func doregist(){
        
        let vc = RegistVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    


}
