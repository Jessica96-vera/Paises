//
//  CellCountryTableViewCell.swift
//  wsPaises
//
//  Created by JESSICA AIDE VERA PEREZ  on 09/03/21.
//

import UIKit

class CellCountryTableViewCell: UITableViewCell {

    @IBOutlet weak var nameCountry: UILabel!
    @IBOutlet weak var imageCheck: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        imageCheck.isHidden = true
        
    }
    
}
