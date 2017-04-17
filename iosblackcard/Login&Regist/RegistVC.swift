//
//  RegistVC.swift
//  iosblackcard
//
//  Created by sum on 2017/4/13.
//  Copyright © 2017年 YunDian. All rights reserved.
//

import UIKit

import SnapKit



class RegistVC: UIViewController ,CustomerCollectionviewDelegate {

 
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
  
    lazy var nextBtn: UIButton = {
        let nextBtn = UIButton()
        nextBtn.setTitle("下一步", for: .normal)
        nextBtn.titleLabel?.numberOfLines = 0
        nextBtn.titleLabel?.textAlignment = .center
        nextBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        nextBtn.backgroundColor = UIColor.gray
        nextBtn.setTitleColor(transferStringToColor("F8F8F8"), for: .normal)
        nextBtn.backgroundColor = transferStringToColor("434343")
        return nextBtn
    }()
    lazy var nameTF: UITextField = {
        let customerName = UITextField()
        customerName.font = UIFont.systemFont(ofSize: 13)
        customerName.textAlignment = .center
        customerName.layer.borderWidth = 1
        customerName.layer.cornerRadius  = 3
        customerName.clipsToBounds = true
        customerName.layer.borderColor = transferStringToColor("A6A6A6").cgColor
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
   
//           self.bgView.layoutIfNeeded()
        }
        
    }
    func customerNameClick(){
        
       
      
       
        UIView.animate(withDuration: 0.23) {
            
            self.showBgview.isHidden = true
//            self.bgView.layoutIfNeeded()
        }
//         self.view.layoutIfNeeded()
//        self.bgView.layoutIfNeeded()
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
        //设置大背景
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
        bannerImg.image = UIImage.init(named: "rechargebanner")
    
        //设置title 标题栏
        let customer : CustomerView = CustomerView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.size.width, height: 90))
         bgView.addSubview(customer)
//         customer.backgroundColor = UIColor.red
         customer.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.top.equalTo(bannerImg.snp.bottom)
            make.right.equalTo(0)
            make.height.equalTo(90)
        }
        customer.size =  CGSize.init(width: (self.view.frame.size.width - 50 - 70)/3, height: (self.view.frame.size.width - 170)/3)
        customer.canChoose = true
        let flowLayout : UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        flowLayout.itemSize = CGSize.init(width: (self.view.frame.size.width - 50 - 40)/3, height: (self.view.frame.size.width - 200)/3)
        
        flowLayout.minimumLineSpacing = 20
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumInteritemSpacing = 20
        flowLayout.sectionInset=UIEdgeInsetsMake(10, 40, 5, 30)
        customer.reuseIdentifier = "TitltleCollectionViewCell"
        customer.flowLayout =  flowLayout
        customer.objects = [["云栖会籍":"¥199.00"] as AnyObject,["云翼会籍":"¥1999.00"] as AnyObject,["云巅会籍":"¥9999.00"] as AnyObject]
        customer.delegate = self
        
        
        let linetitle : LineTitleView = LineTitleView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.size.width, height: 30))
        bgView.addSubview(linetitle)
        linetitle.title  = "云巅会籍专属特权"
        linetitle.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.top.equalTo(customer.snp.bottom).offset(10)
            make.right.equalTo(0)
            make.height.equalTo(30)
        }


        //设置 图片展示title
        let customerImg : CustomerView = CustomerView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.size.width, height: 180))
        bgView.addSubview(customerImg)
        customerImg.snp.makeConstraints { (make) in
            
            make.left.equalTo(0)
            make.top.equalTo(linetitle.snp.bottom).offset(20)
            make.right.equalTo(0)
            make.height.equalTo(180)
        }
        customerImg.size =  CGSize.init(width: (self.view.frame.size.width - 50 - 40)/4, height: (self.view.frame.size.width - 90)/4)
        let newflowLayout : UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        newflowLayout.itemSize = CGSize.init(width: (self.view.frame.size.width - 50 - 40)/4, height: (self.view.frame.size.width - 40)/4)
        
        newflowLayout.minimumLineSpacing = 10
        newflowLayout.scrollDirection = .vertical
        newflowLayout.minimumInteritemSpacing = 5
        newflowLayout.sectionInset=UIEdgeInsetsMake(10, 30, 5, 30)
        customerImg.reuseIdentifier = "ImgItemView"
        customerImg.flowLayout =  newflowLayout
        
        customerImg.objects = [["云栖会籍":"¥199.00"] as AnyObject,["云翼会籍":"¥1999.00"] as AnyObject,["云巅会籍":"¥9999.00"] as AnyObject,["云翼会籍":"¥1999.00"] as AnyObject,["云翼会籍":"¥1999.00"] as AnyObject,["云翼会籍":"¥1999.00"] as AnyObject,["云翼会籍":"¥1999.00"] as AnyObject,["云翼会籍":"¥1999.00"] as AnyObject]
//        customerImg.delegate = self
        
        let lineboomtitle : LineTitleView = LineTitleView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.size.width, height: 30))
        bgView.addSubview(lineboomtitle)
        lineboomtitle.title  = "定制姓名"
        lineboomtitle.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.top.equalTo(customerImg.snp.bottom).offset(10)
            make.right.equalTo(0)
            make.height.equalTo(30)
        }
        
        
        
        //设置t下面的两个itle
        let docustomer : CustomerView = CustomerView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.size.width, height: 67))
        bgView.addSubview(docustomer)
        //         customer.backgroundColor = UIColor.red
        docustomer.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.top.equalTo(lineboomtitle.snp.bottom).offset(20)
            make.right.equalTo(0)
            make.height.equalTo(90)
        }
        docustomer.size =  CGSize.init(width: (self.view.frame.size.width - 120)/2, height: 60)
        docustomer.canChoose = true
        let docustomerflowLayout : UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        docustomerflowLayout.scrollDirection = .vertical
        docustomer.selectIndexPath = NSIndexPath.init(row: 1, section: 0) as IndexPath
        docustomerflowLayout.minimumInteritemSpacing = 20
        docustomerflowLayout.sectionInset=UIEdgeInsetsMake(0, 50, 10, 40)
        docustomer.reuseIdentifier = "CustomerollectionViewCell"
        docustomer.flowLayout =  docustomerflowLayout
        docustomer.objects = [["不定制":"黑卡没有姓名"] as AnyObject,["定制姓名":"你的专属黑卡"] as AnyObject]
        docustomer.delegate = self
        docustomer.tag = 10010
        
        bgView.addSubview(showBgview)
        showBgview.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.top.equalTo(docustomer.snp.bottom).offset(0)
            make.right.equalTo(0)
            make.height.equalTo(70)
        }
        showBgview.addSubview(nameTF)
        nameTF.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.top.equalTo(10)
            make.right.equalTo(-20)
            make.height.equalTo(40)
            
            
        }
       
        let tip = UILabel()
        showBgview.addSubview(tip)
        tip.text = "tips:定制黑卡因工序影响会出现部分延迟，请耐心等候"
        tip.font = UIFont.systemFont(ofSize: 10)
        tip.textColor = transferStringToColor("A6A6A6")
        tip.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.top.equalTo(nameTF.snp.bottom).offset(10)
            make.right.equalTo(-20)
            

        }
        bgView.addSubview(nextBtn)
         nextBtn.snp.makeConstraints { (make) in
            make.left.equalTo(15)
            make.top.equalTo(showBgview.snp.bottom).offset(30)
            make.right.equalTo(-15)
            make.height.equalTo(44)
        }
        
        
    }
    

   
    internal func didSelectedObject( tag: Int , selectRow : Int  ,object: AnyObject?){
    
        if tag == 10010 {
            
            if selectRow == 1{
                doCustomerNameClick()
                
            }
            if selectRow == 0{
                
                customerNameClick()
            }
            
            
        }
    }
  

}
