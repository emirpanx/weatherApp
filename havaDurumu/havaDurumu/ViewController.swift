//
//  ViewController.swift
//  havaDurumu
//
//  Created by Emir Altınsoy on 31.01.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var Button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func Button(_ sender: UIButton) {
        
        let city = textField.text ?? ""
        
        if city.isEmpty {
            
            let alert = UIAlertController(title: "HATA", message: "Şehir adı giriniz", preferredStyle: .alert)
            
            let cancelButton = UIAlertAction(title: "Cancel", style: .cancel)
            
            alert.addAction(cancelButton)
            self.present(alert, animated: true, completion: nil)
            
        } else {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailController") as! DeatailController
            vc.city = city
            self.show(vc, sender: nil)
        }
        
        
    }
    
}

