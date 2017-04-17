//
//  CustomerView.swift
//  iosblackcard
//
//  Created by sum on 2017/4/14.
//  Copyright © 2017年 YunDian. All rights reserved.
//

import UIKit

class BaseCustomerCell: UICollectionViewCell {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func update(model:AnyObject, withAnimal :Bool){
        
    }
   
}
@objc protocol CustomerCollectionviewDelegate {
    func didSelectedObject( tag: Int , selectRow : Int  ,object: AnyObject?)
}

class CustomerView: UIView,UICollectionViewDelegate,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{

    
    var selectIndexPath: IndexPath = IndexPath.init(row: 0, section: 0)
    var  collectView : UICollectionView!
    var  canChoose : Bool = false
    var  delegate : CustomerCollectionviewDelegate!
    override init(frame : CGRect){

        super.init(frame: frame)
         self.initUI()
      
    }
    var reuseIdentifier: String? {
        didSet{
            if reuseIdentifier == nil {
                return
            }
       
      let customer  =   stringClassFromString(className: reuseIdentifier!) as? UICollectionViewCell.Type
          collectView.register(customer.self, forCellWithReuseIdentifier:  reuseIdentifier ?? "MyCell")
           collectView.reloadData()
        }
    }
    //传进来的数据源
    var objects: [AnyObject]? {
        didSet{
            collectView.reloadData()
        }
    }
    //设置UICollectionViewLayout
    var flowLayout: UICollectionViewLayout? {
        didSet{
            collectView.collectionViewLayout = flowLayout!
            
        }
    }
     //设置cgsize optional
    var size : CGSize?
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func initUI(){
    
        let layout : UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize.init(width: (self.frame.size.width - 50 - 40)/4, height: (self.frame.size.width - 50 - 34)/4)
       
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 5
        layout.sectionInset=UIEdgeInsetsMake(10, 10, 5, 10)
        
        self.collectView = UICollectionView.init(frame: CGRect.init(x: 0, y: 0 , width: self.frame.size.width, height: self.frame.size.height), collectionViewLayout: layout)
        
        self.addSubview(collectView)
    
        collectView.collectionViewLayout = layout
        collectView.register(BaseCustomerCell.self, forCellWithReuseIdentifier: "MyCell")

        collectView.delegate = self
        collectView.backgroundColor = UIColor.clear
        collectView.dataSource = self
    }

    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  (objects?.count)! == 0 ? 0 : (objects?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier ?? "MyCell", for: indexPath) as! BaseCustomerCell

        if indexPath == selectIndexPath{
        
            cell.update(model:  (objects?[indexPath.row])!, withAnimal: canChoose)
        }else{
         cell.update(model:  (objects?[indexPath.row])!, withAnimal: false)
        }
       
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
      
        if canChoose {
            if indexPath == selectIndexPath{
                
                if (size != nil) {
                    return CGSize.init(width: (size?.width)! + 7, height: (size?.height)! + 7)
                }
                
                
                
            }
        }
        
      
        if (size != nil) {
             return size!
        }
        return CGSize.init(width: 0, height: 0)
       
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        selectIndexPath = indexPath
        if let delegate = delegate {
            let object = objects?[indexPath.row]
//            delegate.didSelectedObject(tag: self.tag, object: object)
            delegate.didSelectedObject(tag: self.tag, selectRow: indexPath.row, object: object)
        }
        collectionView.reloadData()
    }
    func stringClassFromString(className: String) -> AnyClass! {
        let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String;
        
        /// 根据命名空间传来的字符串先转换成anyClass
        let cls: AnyClass = NSClassFromString(namespace + "." + className)!;
        
      
        return cls;
    }
}
