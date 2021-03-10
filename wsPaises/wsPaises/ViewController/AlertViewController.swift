//
//  AlertViewController.swift
//  wsPaises
//
//  Created by JESSICA AIDE VERA PEREZ  on 09/03/21.
//

import UIKit

class AlertViewController: UIViewController {
    
    // MARK: - Oulets
    @IBOutlet weak var imageAlert: UIImageView!
    @IBOutlet weak var subTitleAlert: UILabel!
    @IBOutlet weak var titleAlert: UILabel!
    
    var listCountry = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Configuration
    func setUpView(){
        let testFrame = CGRect(x: 45, y: 250, width: 300, height: 300)
        let testView : UIView = UIView(frame: testFrame)
        testView.backgroundColor = UIColor(ciColor: .white)
        testView.alpha = 0.5
        self.view.cornerRadius(cornerRadius: 5)
        self.view.addSubview(testView)
    }

}

extension UIView {
    func cornerRadius(cornerRadius:CGFloat?){
        self.layer.masksToBounds = true
        self.layer.cornerRadius = cornerRadius ?? self.frame.height/2
    }
}
