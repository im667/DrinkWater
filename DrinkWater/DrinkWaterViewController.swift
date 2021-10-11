//
//  DrinkWaterViewController.swift
//  DrinkWater
//
//  Created by mac on 2021/10/09.
//

import UIKit



class DrinkWaterViewController: UIViewController ,SendDataDelegate{

    
    @IBOutlet var todayWater: UILabel!
    var Water:Int = 0
    
    @IBOutlet var percent: UILabel!
    
    @IBOutlet var GetNicknameLb: UILabel!
    
    @IBOutlet weak var IsClickedImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        todayWater.text = String(Water)
        
        GetNicknameLb.adjustsFontSizeToFitWidth = true
        
        IsClickedImage.isUserInteractionEnabled = true
        
        IsClickedImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "ClickImg:"))
        
        
    }
   func ClickImg(sender: UITapGestureRecognizer){
       if(sender.state == .ended){
        Water += 500
        todayWater.text = String(Water)
        
        let ud = UserDefaults.standard
        ud.set(self.todayWater.text, forKey: "todayWater")
        ud.set(self.percent.text, forKey: "percent")
    }
   }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "show"{
            let viewController : ProfileViewController = segue.destination as! ProfileViewController
            viewController.delegate = self
        }
    }
    
    
    
    func sendData(data: String) {
        GetNicknameLb.text = "\(data)님의 하루 물 권장량은 2000ml 입니다."
    }
  
}
