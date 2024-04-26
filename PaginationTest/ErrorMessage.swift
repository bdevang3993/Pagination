//
//  ErrorMessage.swift
//  PaginationTest
//
//  Created by devang bhavsar on 26/04/24.
//

import UIKit
enum ErrorMessages {
    case interNetCheck,serverSide,clientSide,urlSide
    func value() -> String {
        switch self {
        case .interNetCheck:
            return "Please check Internet Connection"
        case .serverSide:
            return "Server Side Error please check with server provider people"
        case .clientSide:
            return "Client Side error please check for passing parametter and it's type"
        case .urlSide:
            return "Please check URL Request issue in Parameter set up for URL"
        default:
            return "Please check Internet Connection"
        }
    }
}
struct Alert {
    func showAlert(message:String,viewController:UIViewController) {
        let alert = UIAlertController(title:"Pagination Test", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }
}
