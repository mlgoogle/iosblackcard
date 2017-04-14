//
//  RegistVC.swift
//  iosblackcard
//
//  Created by sum on 2017/4/13.
//  Copyright © 2017年 YunDian. All rights reserved.
//

import UIKit

import SnapKit
class ImgCollectView: UICollectionViewCell {
    
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        let line = UIImageView()
        self.addSubview(line)
        line.backgroundColor = UIColor.gray
       
        line.snp.makeConstraints { (make) in
        
            make.height.equalTo(self.frame.size.width )
            
            make.width.equalTo(self.frame.size.height )
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        
    }
    
    func update(object: AnyObject, hiddle: Bool) {
        
    }
}

class RegistVC: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource {

    var reuseIdentifier: String? {
        didSet{
            if reuseIdentifier == nil {
                return
            }
            
        }
    }
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
    lazy var clouDown: UIButton = {
        let clouDown = UIButton()
        
        clouDown.setTitleColor(transferStringToColor("434343") , for: .normal)
        let name = String.diverseStringOriginalStr(original : "云栖会员\n199.00",conversionStr : "199.00",withFont : UIFont.systemFont(ofSize: 12),withColor: UIColor.red)
        clouDown.setTitle("云栖会员\n199.00", for: .normal)
        clouDown.titleLabel?.attributedText = name
        clouDown.titleLabel?.textAlignment = .center
        clouDown.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        clouDown.titleLabel?.numberOfLines = 0
//        clouDown.backgroundColor = UIColor.red
        return clouDown
    }()
    lazy var cloudCenter: UIButton = {
        let cloudCenter = UIButton()
        cloudCenter.setTitle("云翼会员\n199.00", for: .normal)
        cloudCenter.titleLabel?.textAlignment = .center
        cloudCenter.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        cloudCenter.backgroundColor = UIColor.yellow
        
        cloudCenter.titleLabel?.numberOfLines = 0
        return cloudCenter
    }()
    lazy var cloudUp: UIButton = {
        let cloudUp = UIButton()
        //diverseStringOriginalStr
        
        cloudUp.setTitle("云栖会籍\n199.00", for: .normal)
        cloudUp.titleLabel?.numberOfLines = 0
        cloudUp.titleLabel?.textAlignment = .center
        cloudUp.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        cloudUp.backgroundColor = UIColor.gray
        return cloudUp
    }()
    lazy var doCustomerName: UIButton = {
        let doCustomerName = UIButton()
        doCustomerName.setTitle("定制姓名 +100\n 您的专属黑卡", for: .normal)
        doCustomerName.titleLabel?.numberOfLines = 0
        doCustomerName.titleLabel?.textAlignment = .center
        doCustomerName.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        doCustomerName.backgroundColor = UIColor.gray
        doCustomerName.addTarget(self , action: #selector(doCustomerNameClick), for: .touchUpInside)
        return doCustomerName
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
                make.top.equalTo(self.doCustomerName.snp.bottom).offset(5)
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
      
        showBgview.snp.updateConstraints { (make) in
            make.top.equalTo(doCustomerName.snp.bottom).offset(5)
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(1)
        }
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
        bgView.addSubview(clouDown)
        bgView.addSubview(cloudUp)
        bgView.addSubview(cloudCenter)
        bannerImg.snp.makeConstraints { (make) in
            make.top.equalTo(15)
            make.left.equalTo(15)
            make.height.equalTo(180)
            make.right.equalTo(-15)
        
        }
        clouDown.snp.makeConstraints { (make) in
            make.top.equalTo(bannerImg.snp.bottom).offset(30)
            make.left.equalTo(30)
            make.height.equalTo(60)
            make.width.equalTo(cloudCenter.snp.width);
          
        }
        cloudCenter.snp.makeConstraints { (make) in
            make.top.equalTo(bannerImg.snp.bottom).offset(30)
            make.left.equalTo(clouDown.snp.right).offset(15)
            make.height.equalTo(60)
//            make.width.equalTo(cloudUp.snp.width);
            
            
        }
        cloudUp.snp.makeConstraints { (make) in
            make.top.equalTo(bannerImg.snp.bottom).offset(30)
            make.width.equalTo(cloudCenter.snp.width);

            make.left.equalTo(cloudCenter.snp.right).offset(15)
            make.height.equalTo(60)
            make.right.equalTo(-30)
        }
        let titlt = UILabel()
        titlt.text = "云栖会籍专属特权"
        bgView.addSubview(titlt)
        titlt.font = UIFont.systemFont(ofSize: 15)
        titlt.snp.makeConstraints { (make) in
            make.top.equalTo(cloudUp.snp.bottom).offset(10)
            make.left.equalTo(0)
            make.right.equalTo(0)
            
        }
        titlt.textColor = UIColor.red
        titlt.textAlignment = .center
       
        let line = UILabel()
        line.text = ""
        bgView.addSubview(line)
        line.backgroundColor = UIColor.gray
        line.font = UIFont.systemFont(ofSize: 15)
        line.snp.makeConstraints { (make) in
            make.top.equalTo(titlt.snp.bottom).offset(10)
            make.left.equalTo(17)
            make.right.equalTo(17)
            make.height.equalTo(0.5)
        }
//        line.textColor = UIColor.red
        line.textAlignment = .center
        let bgview = UIView.init()
        bgView.addSubview(bgview)
        bgview.snp.makeConstraints { (make) in
            make.top.equalTo(line.snp.bottom).offset(10)
            make.left.equalTo(17)
            make.right.equalTo(17)
            make.height.equalTo(((self.view.frame.size.width - 50 - 40)/4)*2 + 40)
        }
        
        let flowLayout : UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        flowLayout.itemSize = CGSize.init(width: (self.view.frame.size.width - 50 - 40)/4, height: (self.view.frame.size.width - 50 - 34)/4)
        flowLayout.minimumLineSpacing = 10
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumInteritemSpacing = 5
        flowLayout.sectionInset=UIEdgeInsetsMake(10, 10, 5, 10)
        let collectView = UICollectionView.init(frame: CGRect.init(x: 0, y: 0 , width: self.view.frame.size.width - 34, height: ((self.view.frame.size.width - 50 - 40)/4)*2 + 40), collectionViewLayout: flowLayout)
        
 
        collectView.collectionViewLayout = flowLayout
        collectView.register(ImgCollectView.self, forCellWithReuseIdentifier: "MyCell")
        collectView.backgroundColor = UIColor.clear
        collectView.delegate = self
        collectView.dataSource = self
        bgview.addSubview(collectView)
//
        
        let more = UILabel()
        bgView.addSubview(more)
        more.text = "更多特权。。。"
        bgView.addSubview(more)
        more.font = UIFont.systemFont(ofSize: 15)
        more.snp.makeConstraints { (make) in
            make.top.equalTo(bgview.snp.bottom).offset(5)
            make.left.equalTo(0)
            make.right.equalTo(0)
            
        }
//        more.textColor = UIColor.red
        more.textAlignment = .center
        bgView.addSubview(doCustomerName)
        bgView.addSubview(customerName)
        customerName.snp.makeConstraints { (make) in
            make.top.equalTo(more.snp.bottom).offset(15)
            make.left.equalTo(30)
            
            make.width.equalTo(doCustomerName.snp.width);
        }

        doCustomerName.snp.makeConstraints { (make) in
            make.top.equalTo(more.snp.bottom).offset(15)
            make.left.equalTo(customerName.snp.right).offset(30)
            make.right.equalTo(-30)
            make.width.equalTo(customerName.snp.width);
            
        }
//        bgScrollView.addSubview(nextBtn)
        bgView.addSubview(showBgview)
        showBgview.snp.makeConstraints { (make) in
            make.top.equalTo(doCustomerName.snp.bottom).offset(5)
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(100)
        }
//        showBgview.backgroundColor = UIColor.red
        showBgview.addSubview(nameTF)
        nameTF.snp.makeConstraints { (make) in
            make.top.equalTo(5)
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(30)
            
            
        }
       
//
        let newline = UILabel()
        showBgview.addSubview(newline)
        newline.text = ""
      
        newline.font = UIFont.systemFont(ofSize: 15)
        newline.snp.makeConstraints { (make) in
            make.top.equalTo(nameTF.snp.bottom).offset(5)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(0.5)
            
        }
        
        let tips = UILabel()
        showBgview.addSubview(tips)
        tips.text = "TIPS：定制卡因工序影响会出现部分延迟，请耐心等待。"
        tips.numberOfLines = 0
        tips.textColor = transferStringToColor("A6A6A6")
        tips.font = UIFont.systemFont(ofSize: 12)
        tips.snp.makeConstraints { (make) in
            make.top.equalTo(newline.snp.bottom).offset(5)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(30)
            
        }
        newline.backgroundColor = UIColor.gray

        bgView.addSubview(nextBtn)
        
        nextBtn.snp.makeConstraints { (make) in
            make.top.equalTo(showBgview.snp.bottom).offset(5)
            make.left.equalTo(15)
            make.right.equalTo(-15)

            make.height.equalTo(30)
            

            
        }
    
        
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
