//
//  ReetPwdVC.swift
//  iosblackcard
//
//  Created by sum on 2017/4/17.
//  Copyright © 2017年 YunDian. All rights reserved.
//

import UIKit

class ResetPwdVC: UIViewController {

    lazy var bannerImg: UIImageView = {
        let bannerImg = UIImageView()
        bannerImg.backgroundColor = UIColor.red
        //        bannerImg.backgroundColor = UIColor.red
        return bannerImg
    }()
     //验证码
    lazy var codeBtn: UIButton = {
        let codeBtn = UIButton.init(type: .custom)
        codeBtn.setTitle("获取验证吗", for: .normal)
        codeBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        codeBtn.setTitleColor(transferStringToColor("333333"), for: .normal)
        return codeBtn
    }()
     //重新输入的重置密码btn
    lazy var doreset: UIButton = {
        let codeBtn = UIButton.init(type: .custom)
        codeBtn.setTitle("重置密码", for: .normal)
        codeBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        codeBtn.setTitleColor(transferStringToColor("333333"), for: .normal)
        return codeBtn
    }()
    //绑定的手机号
    var bindPhone : UITextField?
    //重置密码
    var resetPwd : UITextField?
    //重新输入的重置密码
    var againresetPwd : UITextField?
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()

        // Do any additional setup after loading the view.
    }
   func  initUI(){
    
    self.view.addSubview(bannerImg)
    bannerImg.snp.makeConstraints { (make) in
        
        make.top.equalTo(17)
        make.left.equalTo(17)
        make.right.equalTo(-17)
        make.height.equalTo(100)
        
    }
    //绑定的手机号
    let inputPwd = InputWithBorder.init(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.size.width, height: 44))
    inputPwd.inputTf.placeholder = "黑卡绑定的手机号134*****"
    inputPwd.showImg = false
    self.view.addSubview(inputPwd)
    bindPhone = inputPwd.inputTf
    inputPwd.snp.makeConstraints { (make) in
       make.top.equalTo(bannerImg.snp.bottom).offset(30)
       make.height.equalTo(44)
       make.left.equalTo(17)
      }
    self.view.addSubview(codeBtn)
    codeBtn.snp.makeConstraints { (make) in
        make.top.equalTo(bannerImg.snp.bottom).offset(30)
        make.left.equalTo(inputPwd.snp.left).offset(-17)
        make.right.equalTo(-17)
        make.height.equalTo(44)
        make.width.equalTo(100)
     }
     //重置密码
    let resetView = InputWithBorder.init(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.size.width, height: 44))
    resetView.inputTf.placeholder = "重置密码"
    inputPwd.showImg = false
    self.view.addSubview(resetView)
    resetPwd = resetView.inputTf
    resetView.snp.makeConstraints { (make) in
        make.top.equalTo(codeBtn.snp.bottom).offset(30)
        make.height.equalTo(44)
        make.left.equalTo(17)
      make.right.equalTo(17)
    }
    //重新输入的重置密码
    let againresetPwdView = InputWithBorder.init(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.size.width, height: 44))
    againresetPwdView.inputTf.placeholder = "重新输入重置密码"
    againresetPwdView.showImg = false
    self.view.addSubview(againresetPwdView)
    againresetPwd = againresetPwdView.inputTf
    againresetPwdView.snp.makeConstraints { (make) in
        make.top.equalTo(resetView.snp.bottom).offset(30)
        make.height.equalTo(44)
        make.left.equalTo(17)
        make.right.equalTo(-17)
     }
    
    self.view.addSubview(doreset)
    doreset.snp.makeConstraints { (make) in
        make.right.equalTo(-17)
        make.bottom.equalTo(self.view.snp.bottom).offset(30)
        make.left.equalTo(17)
    }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
