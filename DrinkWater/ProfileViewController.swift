//
//  ProfileViewController.swift
//  DrinkWater
//
//  Created by mac on 2021/10/09.
//

import UIKit

protocol SendDataDelegate{
    func sendData(data: String)
}

class ProfileViewController: UIViewController {
    
    var delegate: SendDataDelegate?
    
    @IBOutlet var SetNickname: UITextField!
    
    @IBOutlet var SetHeight: UITextField!
    
    @IBOutlet var SetWeight: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        SetNickname.text = UserDefaults.standard.value(forKey: "Nickname") as! String?
        SetHeight.text = UserDefaults.standard.value(forKey:"Height") as! String?
        SetWeight.text = UserDefaults.standard.value(forKey: "Weight") as! String?
    }
    
  

    @IBAction func SaveBtn(_ sender: UIBarButtonItem) {
        let ud = UserDefaults.standard
        
        ud.set(self.SetNickname.text, forKey: "Nickname")
        ud.set(self.SetWeight.text!, forKey: "Weight")
        ud.set(self.SetHeight.text!, forKey: "Height")
        
        if let data = SetNickname.text{
            delegate?.sendData(data: data)
            dismiss(animated: true, completion: nil)
        }

}
}

