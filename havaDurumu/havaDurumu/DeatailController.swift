//
//  DeatailController.swift
//  havaDurumu
//
//  Created by Emir Altınsoy on 31.01.2023.
//

import UIKit

class DeatailController: UIViewController {
    var city = String()
    @IBOutlet weak var sehir: UILabel!
    
    @IBOutlet weak var sicaklik: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sehir.text = city
        getTodayResult(sehir: city)
    }
    
    func getTodayResult(sehir: String) {
        
        if let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(sehir)&appid=0f6112b1d663b03202ffabe9788c51ef") {
           
            
            let request = URLRequest(url: url)
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                
                if error == nil {
                    if let incomingData = data {
                         
                        do {
                            
                            let json = try JSONSerialization.jsonObject(with: incomingData, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                            //print(json)
                            
                            if let main = json["main"] as? NSDictionary {
                                if let temp = main["temp"] as? Double {
                                    let state = Int(temp - 273.15)
                                    DispatchQueue.main.sync {
                                        self.sicaklik.text = String(state)
                                        
                                    }
                                }
                            }
                            
                        } catch {
                            print("hata")
                        }
                        
                        
                    }
                    
                }
            }
            task.resume()
            
        }
    }
}
