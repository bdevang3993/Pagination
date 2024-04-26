//
//  DescriptionTableViewCell.swift
//  PaginationTest
//
//  Created by devang bhavsar on 26/04/24.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell {

    @IBOutlet weak var lblUserId: UILabel!
    @IBOutlet weak var lblTItle: UILabel!
    @IBOutlet weak var txtViewDescription: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
