//
//  ViewController.swift
//  wsPaises
//
//  Created by JESSICA AIDE VERA PEREZ  on 09/03/21.
//

import UIKit

struct Country {
//    var id : String
    var nameCountry : String
}

class ViewController: UIViewController {
    
    // MARK: - IBOulets
    @IBOutlet weak var countryTable: UITableView!
    
    var countryArray = [Country]()
    var nameCountry = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countryTable.dataSource = self
        countryTable.delegate = self
        countryTable.register(UINib(nibName: "CellCountryTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        getJsonCountry()
        
    }
    
    // MARK: URL
    func getJsonCountry() -> [String] {
        let url = URL(string: urlBasic + endPoindCountry)!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let parameters: [String: Any] = [
            "cadena": ""
        ]
        
        print("-> URL: \(url)")
        
        let jsonBody = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        request.httpBody = jsonBody
        
        print("-> JsonBody : \(String(describing: jsonBody))")
        
        let task = URLSession.shared.dataTask(with: request) { [self] data, response, error in
            guard let data = data,
                  let response = response as? HTTPURLResponse,
                  error == nil else {
                print("Error en response")
                return
            }
            
            do {
                
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any], let jsonRespond = json["dsRespuesta"] as? [String:Any] {
                    if let jsonCountry = jsonRespond["Paises"] as? [[String:Any]] {
                        print("->jsonCountry -> \(jsonCountry)")
                        self.createArrayCountry(arrayData: jsonCountry)
                        
                    }
                }
            } catch let error {
                print(error.localizedDescription)
            }
            
        }
        task.resume()
        
        return []
    }
    

    
    func createArrayCountry(arrayData: [[String:Any]]) {
        var arrayCountryData : [String] = []
        for country in arrayData {
            let name = country["Pais"] as! String
            let id = country["idPais"] as! String
            
            let arrayCoun = Country(nameCountry: name)
            countryArray.append(arrayCoun)

        }
        DispatchQueue.main.async {
            self.countryTable.reloadData()
        }
    }
}


extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CellCountryTableViewCell
        let dataName = countryArray[indexPath.row]
        cell.nameCountry.text = dataName.nameCountry
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = AlertViewController()
        let name = countryArray[indexPath.row]
        let titleAlert = "Has dado click en el estado \(name)"
        vc.subTitleAlert?.text = titleAlert
        vc.setUpView()
    }
    
}

