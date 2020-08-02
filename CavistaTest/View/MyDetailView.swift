//
//  MyDetailView.swift
//  CavistaTest
//
//  Created by apple on 02/08/20.
//  Copyright © 2020 Proximate. All rights reserved.
//

import UIKit

class MyDetailView: UIView {

   lazy var labelsView : UIView = {
       let view = UIView()
       return view
   }()
   
   lazy var lblId: UILabel = {
       let label = UILabel()
      label.textColor = .black
      label.backgroundColor = .clear
      label.font = UIFont(name : "Futura-Bold", size: 16.0)
      
      label.translatesAutoresizingMaskIntoConstraints = false
       return label
   }()
   
   lazy var lblType : UILabel = {
       let label = UILabel()
     label.textColor = .black
     label.backgroundColor = .clear
     label.font = UIFont(name : "Futura-Bold", size: 16.0)
     label.translatesAutoresizingMaskIntoConstraints = false
     return label
   }()
   
   lazy var lblDate : UILabel = {
       let label = UILabel()
       label.textColor = .black
       label.backgroundColor = .clear
       label.font = UIFont(name : "Futura-Bold", size: 16.0)
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
   }()
   
   lazy var lblDataText : UILabel = {
       let label = UILabel()
       label.textColor = .black
       label.backgroundColor = .clear
       label.font = UIFont(name: "Futura-Bold", size: 16.0)
       label.numberOfLines = 0
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
   }()
   
   lazy var imageData : UIImageView = {
       let imageV = UIImageView()
       imageV.backgroundColor = .lightGray
       imageV.contentMode = .scaleToFill
       imageV.translatesAutoresizingMaskIntoConstraints = false
       imageV.layer.cornerRadius = 10
       imageV.clipsToBounds = true
       
       return imageV
   }()
   

}
