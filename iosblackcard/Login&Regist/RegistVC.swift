//
//  RegistVC.swift
//  iosblackcard
//
//  Created by sum on 2017/4/13.
//  Copyright © 2017年 YunDian. All rights reserved.
//

import UIKit

import SnapKit



class RegistVC: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource {

 
    //设置大的背景
    lazy var  bgScrollView: UIScrollView = {
        let bgScrollView = UIScrollView()
        bgScrollView.contentSize = CGSize(width: 375, height: 1000)
        return bgScrollView
        
    }()
    
    //设置大的背景
    lazy var  bgView: UIView = {
        let bgView = UIView()
      
        return bgView
        
    }()

    lazy var bannerImg: UIImageView = {
        let bannerImg = UIImageView()
        //        bannerImg.backgroundColor = UIColor.red
        return bannerImg
    }()
  
    
    lazy var customerName: UIButton = {
        let customerName = UIButton()
        customerName.setTitle("不定制\n黑开没有姓名", for: .normal)
        customerName.titleLabel?.numberOfLines = 0
        customerName.titleLabel?.textAlignment = .center
        customerName.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        customerName.backgroundColor = UIColor.gray
        customerName.addTarget(self , action: #selector(customerNameClick), for: .touchUpInside)
        return customerName
    }()
    lazy var nextBtn: UIButton = {
        let nextBtn = UIButton()
        nextBtn.setTitle("下一步", for: .normal)
        nextBtn.titleLabel?.numberOfLines = 0
        nextBtn.titleLabel?.textAlignment = .center
        nextBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        nextBtn.backgroundColor = UIColor.gray
        return nextBtn
    }()
    lazy var nameTF: UITextField = {
        let customerName = UITextField()
        customerName.placeholder = "中文姓名全品或者英文名"
        return customerName
    }()
    lazy var showBgview: UIView = {
        let showBgview = UIView()
        return showBgview
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
      
        initUI()
        
    }
    
   
    func doCustomerNameClick() {
        
        UIView.animate(withDuration: 0.23) {
            
            self.showBgview.isHidden = false
            self.showBgview.snp.updateConstraints { (make) in
//                make.top.equalTo(self.doCustomerName.snp.bottom).offset(5)
                make.left.equalTo(15)
                make.right.equalTo(-15)
                make.height.equalTo(100)
            }
            self.nextBtn.snp.updateConstraints { (make) in
                make.top.equalTo(self.showBgview.snp.bottom).offset(5)
                make.left.equalTo(15)
                make.right.equalTo(-15)
                make.height.equalTo(30)
            }
           self.bgView.layoutIfNeeded()
        }
        
    }
    func customerNameClick(){
        
        showBgview.isHidden = true
      
       
        nextBtn.snp.updateConstraints { (make) in
            make.top.equalTo(showBgview.snp.bottom).offset(5)
           
            make.right.equalTo(-15)
            make.height.equalTo(30)
            
        }
         self.view.layoutIfNeeded()
        self.bgView.layoutIfNeeded()
    }
    func initUI(){
        view.backgroundColor = UIColor.white
        view.addSubview(bgScrollView)
        bgScrollView.addSubview(bgView)
        bgScrollView.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
        }
        
        bgView.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
            make.height.equalTo(bgScrollView.contentSize.height)
            make.width.equalTo(self.view.frame.size.width)
            
        }
        bgView.addSubview(bannerImg)
      
        bannerImg.snp.makeConstraints { (make) in
            make.top.equalTo(15)
            make.left.equalTo(15)
            make.height.equalTo(180)
            make.right.equalTo(-15)
        
        }
     
    
        
        let customer : CustomerView = CustomerView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.size.width, height: 90))
         bgView.addSubview(customer)
//         customer.backgroundColor = UIColor.red
         customer.snp.makeConstraints { (make) in
        
            make.left.equalTo(0)
             make.top.equalTo(bannerImg.snp.bottom)
            make.right.equalTo(0)
            make.height.equalTo(90)
        }
        let flowLayout : UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        flowLayout.itemSize = CGSize.init(width: (320 - 50 - 40)/4, height: (320 - 50 - 34)/4)
        flowLayout.minimumLineSpacing = 10
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumInteritemSpacing = 5
        flowLayout.sectionInset=UIEdgeInsetsMake(10, 10, 5, 10)
        customer.reuseIdentifier = "mycell"
        customer.flowLayout =  flowLayout
        customer.objects = [["云栖会籍":"¥199.00"] as AnyObject,["云翼会籍":"¥1999.00"] as AnyObject,["云巅会籍":"¥9999.00"] as AnyObject]
        
        
        let imgView : CustomerView = CustomerView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.size.width, height: 170))
        bgView.addSubview(imgView)
        //         customer.backgroundColor = UIColor.red
        imgView.snp.makeConstraints { (make) in
            
            make.left.equalTo(0)
            make.top.equalTo(customer.snp.bottom).offset(20)
            make.right.equalTo(0)
            make.height.equalTo(90)
        }
       
        imgView.objects = [["云栖会籍":"¥199.00"] as AnyObject,["云翼会籍":"¥1999.00"] as AnyObject,["云巅会籍":"¥9999.00"] as AnyObject,["云栖会籍":"¥199.00"] as AnyObject,["云栖会籍":"¥199.00"] as AnyObject,["云栖会籍":"¥199.00"] as AnyObject,["云栖会籍":"¥199.00"] as AnyObject,]
        

//        let newline = UILabel()
//       
//        let tips = UILabel()
//        showBgview.addSubview(tips)
//        tips.text = "TIPS：定制卡因工序影响会出现部分延迟，请耐心等待。"
//        tips.numberOfLines = 0
//        tips.textColor = transferStringToColor("A6A6A6")
//        tips.font = UIFont.systemFont(ofSize: 12)
//        tips.snp.makeConstraints { (make) in
//            make.top.equalTo(newline.snp.bottom).offset(5)
//            make.left.equalTo(0)
//            make.right.equalTo(0)
//            make.height.equalTo(30)
//            
//        }
//        newline.backgroundColor = UIColor.gray
//
//        bgView.addSubview(nextBtn)
//        
//        nextBtn.snp.makeConstraints { (make) in
//            make.top.equalTo(showBgview.snp.bottom).offset(5)
//            make.left.equalTo(15)
//            make.right.equalTo(-15)
//
//            make.height.equalTo(30)
//            
//
//            
//        }
    
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath)
        
        
        return cell
        
    }
    
    override func viewDidLayoutSubviews() {
//        bgScrollView.frame = CGRect.init(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
//        bgScrollView.contentSize = CGSize.init(width: 375, height: 1000)
    }

  

}
