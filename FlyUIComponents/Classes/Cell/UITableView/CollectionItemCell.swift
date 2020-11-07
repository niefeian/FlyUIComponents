//
//  CollectionItemCell.swift
//  AutoData
//
//  Created by 聂飞安 on 2020/5/20.
//

import UIKit
import SwiftProjects
import SnapKit
import NFAToolkit

public class CollectionItemCell: CusAutoCollectionCell {
    
    public var layoutType : LayoutType!{
        didSet{
            self.reloadUI()
        }
    }
    public var bgText : UIView!
    public var lineSpacing : CGFloat = 0
    public var indexPath: IndexPath!
    public var imageViews : UIImageView!
    public var cellText : UILabel!
    
    func reloadUI(){
        initializePage()
        initLayoutSubviews()
        initializeDelegate()
        initializeDraw()
        initializeData()
    }
    
    override public func initializePage() {
        switch layoutType {
        case .图文:
            addAutoView([(.imageView, 1),(.label, 1)])
        case .图: addAutoView([(.imageView, 1)])
        case .文字下滑块 :
            addAutoView([(.view , 2),(.label, 1)])
        case .文字:
            addAutoView([(.label, 1)])
        case .none:
            break
        }
        super.initializePage()
    }
    
    override public func initLayoutSubviews() {
        switch layoutType {
               case .图文:
                    getSubview(autoViewClass: .imageView, index: 1)?.snp.makeConstraints({ (make) in
                        make.centerX.equalToSuperview()
                        make.size.equalTo(75.pd6sW)
                    })

                    getSubview(autoViewClass: .label, index: 1)?.snp.makeConstraints({ (make) in
                        make.centerX.equalToSuperview()
                        make.top.equalTo( getSubview(autoViewClass: .imageView, index: 1)!.snp_bottom).offset(lineSpacing)
                        make.height.equalTo(12)
                        make.bottom.equalToSuperview().offset(-5)
                    })
                    imageViews = getView(autoViewClass: .imageView, index: 1)
           case .图:
                getSubview(autoViewClass: .imageView, index: 1)?.snp.makeConstraints({ (make) in
                    make.size.equalToSuperview()
                    make.center.equalToSuperview()
                })
                imageViews = getView(autoViewClass: .imageView, index: 1)
        case .文字下滑块:
            getSubview(autoViewClass: .label, index: 1)?.snp.makeConstraints({ (make) in
                make.center.equalToSuperview()
//                make.ce.equalTo(10)
            })
            
        getSubview(autoViewClass: .view, index: 2)?.snp.makeConstraints({ (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo( getSubview(autoViewClass: .label, index: 1)!.snp_bottom).offset(5.pd6sW)
            make.height.equalTo(4)
            make.width.equalTo(18)
        })

        getSubview(autoViewClass: .view, index: 1)?.snp.makeConstraints({ (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(1)
            make.bottom.equalTo(1)
            make.left.equalTo(1)
        })
        case .文字:
            getSubview(autoViewClass: .label, index: 1)?.snp.makeConstraints({ (make) in
                make.center.equalToSuperview()
                make.size.equalToSuperview()
            })
            bgText = getSubview(autoViewClass: .label, index: 1)
//            Tools.masksToBounds(cornerView: getSubview(autoViewClass: .label, index: 1)!, cornerRadius: 25.pd6sW/2, borderWidth: 1, borderColor: .initString("#D8D8D8"))
        case .none:
            break
        }
        super.initializePage()
        cellText = getSubview(autoViewClass: .label, index: 1) as? UILabel
    }
    
    public override func initializeDraw() {
        switch layoutType {        case .图文:
            break
        case .图:
            break
        case .文字下滑块:
            if let view = getSubview(autoViewClass: .view, index: 2){
                view.backgroundColor = .initString("#E67458")
                Tools.setCornerRadius(view, rate: 2)
            }
            getSubview(autoViewClass: .view, index: 1 , autoInit: true)?.isHidden = true
        case .none:
            break
        case .文字:
            break
        }
    }
    public func setInfo(_ image : String , title : String , imageUrl : String = ""){
        if imageUrl.count > 0 {
            imageViews?.setImageFromURL(imageUrl)
            imageViews.isHidden = false
        }else if image.count > 0{
            imageViews?.image = UIImage.init(named: image)
            imageViews.isHidden = false
        }
        else
        {
            imageViews.image = nil
            imageViews.isHidden = true
        }
        imageViews?.contentMode = .scaleAspectFit
        (getSubview(autoViewClass: .label, index: 1) as? UILabel)?.text = title
        (getSubview(autoViewClass: .label, index: 1) as? UILabel)?.setFont(12)
        (getSubview(autoViewClass: .label, index: 1) as? UILabel)?.textColor = .initString("#333333")
    }
    
    public func setInfo(_ title : String , showView : Bool){
        
        if let label = getSubview(autoViewClass: .label, index: 1  , autoInit: true) as? UILabel {
            label.font = UIFont.systemFont(ofSize: 12.pd6sW)
            label.textColor =  .initString("#343434")
            label.text = title
            label.numberOfLines = 0
            label.textAlignment = .center
            
        }
        
        (getSubview(autoViewClass: .view, index: 2 , autoInit: true))?.isHidden = !showView
    }
    
    
    
    public func setRichInfo(_ attributedText : NSAttributedString ){
        if let label = getSubview(autoViewClass: .label, index: 1  , autoInit: true) as? UILabel {
            label.setFont(13)
            label.textColor = .initString("#919399")
            label.attributedText = attributedText
            label.numberOfLines = 0
            label.textAlignment = .center
        }
        getSubview(autoViewClass: .view, index: 1 , autoInit: true)?.isHidden = false
        (getSubview(autoViewClass: .view, index: 2 , autoInit: true))?.isHidden = true
       
    }
    
    public  func reloadBgColor(_ select : Bool){
        if select {
            if let view  = getSubview(autoViewClass: .view, index: 1 , autoInit: true) {
                            view.backgroundColor = .initString("##FCEBE7")
                            Tools.masksToBounds(cornerView: view ,cornerRadius:5,borderWidth:1 , borderColor: .initString("#E67458"))
                            view.isHidden = false
                        }
        }else{
            if let view  = getSubview(autoViewClass: .view, index: 1 , autoInit: true) {
                view.backgroundColor = .initString("#F5F7FA")
                Tools.masksToBounds(cornerView: view ,cornerRadius:5,borderWidth:1 , borderColor: .initString("F5F7FA"))
                view.isHidden = false
            }
        }
        
    }
}
