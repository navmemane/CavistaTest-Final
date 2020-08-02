//
//  DetailViewController.swift
//  CavistaTest
//
//  Created by apple on 01/08/20.
//  Copyright © 2020 Proximate. All rights reserved.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {
    
    var detailDataTypes : DataType?
    let cv = MyDetailView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        self.view.addSubview(cv.labelsView)
        cv.labelsView.addSubview(cv.lblId)
        cv.labelsView.addSubview(cv.lblType)
        cv.labelsView.addSubview(cv.lblDate)
        

        cv.labelsView.snp.makeConstraints { make in
            make.center.equalTo(self.view)
        }
        setUpIDView()
        setlblType()
        setlblDate()
        setDataType()
      

    }
    
    func setUpIDView()
    {
       
        cv.lblId.text = "ID : \(detailDataTypes?.id ?? "_")"
        cv.lblId.snp.makeConstraints { (make) in

            make.left.equalTo(self.view).offset(10.0)
            make.right.equalTo(self.view).offset(10.0)
            make.top.equalTo(self.view).offset(50)
            make.height.equalTo(25)
        }

    }
    
   func setlblType()
   {
        cv.lblType.text = "Type : \(detailDataTypes?.type ?? "_")"
        cv.lblType.snp.makeConstraints { (make) in
               make.left.equalTo(self.view).offset(10)
               make.right.equalTo(self.view).offset(-10)
               make.top.equalTo(cv.lblId.snp.bottom).offset(10)
               make.height.equalTo(25)
           }

   }
   func setlblDate()
    {

        cv.lblDate.text = "Date : \(detailDataTypes?.date ?? "_")"
        cv.lblDate.snp.makeConstraints { (make) in
               make.left.equalTo(self.view).offset(10)
               make.right.equalTo(self.view).offset(-10)
               make.top.equalTo(cv.lblType.snp.bottom).offset(10)
               make.height.equalTo(25)
           }
    }
    
    func setTextData (){

        cv.lblDataText.text = "Data : \(detailDataTypes?.data ?? " _")"
        cv.lblDataText.snp.makeConstraints {(make) in
            make.left.equalTo(self.view).offset(10)
            make.right.equalTo(self.view).offset(-10)
            make.top.equalTo(cv.lblDate.snp.bottom).offset(25)
        }
    }
    
    func setDataType()
    {
        if detailDataTypes?.type == "image"
          {
              cv.labelsView.addSubview(cv.imageData)
              setImageData()
          }
          else
          {
              cv.labelsView.addSubview(cv.lblDataText)
              setTextData()

          }
    }
    func setImageData()
    {

        cv.imageData.snp.makeConstraints {(make) in
            make.left.equalTo(self.view).offset(10)
            make.right.equalTo(self.view).offset(-10)
            make.top.equalTo(cv.lblDate.snp.bottom).offset(25)
            make.height.equalTo(200)
        }
        
        guard let urlString = detailDataTypes?.data else {
            return
        }
        
        let url = URL(string: urlString)
        if url == nil {return}
        cv.imageData.image = nil
        let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView.init(style: .whiteLarge)
        activityIndicator.startAnimating()
        cv.imageData.addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints{(make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }

        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
                   if error != nil {
                       print(error!)
                       return
                   }

                   DispatchQueue.main.async {
                       if let image = UIImage(data: data!) {
                        self.cv.imageData.image = image
                        activityIndicator.removeFromSuperview()

                       }
                   }

               }).resume()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
