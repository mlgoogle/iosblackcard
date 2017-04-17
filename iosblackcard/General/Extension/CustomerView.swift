//
//  CustomerView.swift
//  iosblackcard
//
//  Created by sum on 2017/4/14.
//  Copyright © 2017年 YunDian. All rights reserved.
//

import UIKit

class BaseCustomerCell: UICollectionViewCell {
    
    
//       var title : UILabel!
//       var account : UILabel!
      override init(frame: CGRect) {
//        
    super.init(frame: frame)
    }

    func update(model:AnyObject){
    
//        title.text = model.keys.first
//        account.text = model[model.keys.first!]
//        title.textAlignment = .center
//        account.textAlignment = .center
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        
    }
    
    func update(object: AnyObject, hiddle: Bool) {
        
    }
}
@objc protocol CustomerCollectionviewDelegate {
    func didSelectedObject(_ collectionView: UICollectionView, object: AnyObject?)
}
class CustomerView: UIView,UICollectionViewDelegate,UICollectionViewDataSource {

    
    
    var  collectView : UICollectionView!
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
        collectView.register(BaseCustomerCell.self, forCellWithReuseIdentifier:  reuseIdentifier ?? "MyCell")
           collectView.reloadData()
        }
    }
    var objects: [AnyObject]? {
        didSet{
            collectView.reloadData()
        }
    }
    var flowLayout: UICollectionViewLayout? {
        didSet{
            collectView.collectionViewLayout = flowLayout!
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func initUI(){
    
        let flowLayout : UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        flowLayout.itemSize = CGSize.init(width: (320 - 50 - 40)/4, height: (320 - 50 - 34)/4)
        flowLayout.minimumLineSpacing = 10
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumInteritemSpacing = 5
        flowLayout.sectionInset=UIEdgeInsetsMake(10, 10, 5, 10)
        
        self.collectView = UICollectionView.init(frame: CGRect.init(x: 0, y: 0 , width: self.frame.size.width, height: self.frame.size.height), collectionViewLayout: flowLayout)
        
        self.addSubview(collectView)
    
        collectView.collectionViewLayout = flowLayout
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

        cell.update(model: (objects?[indexPath.row])!)
//        cell.update(model: )
        return cell
        
    }

}
