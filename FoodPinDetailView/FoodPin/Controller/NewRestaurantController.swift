//
//  NewRestaurantController.swift
//  FoodPin
//
//  Created by BankPro on 2021/7/5.
//  Copyright © 2021 AppCoda. All rights reserved.
//

import UIKit

class NewRestaurantController: UITableViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let appearance = navigationController?.navigationBar.standardAppearance{
            if let customFont = UIFont(name: "Nunito-Bold", size: 40.0){
                appearance.titleTextAttributes  = [.foregroundColor:UIColor(named: "NavigationBarTitle")!]
                appearance.largeTitleTextAttributes = [.foregroundColor:UIColor(named: "NavigationBarTitle")!, .font: customFont
                ]}
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.compactAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
            }
        //取得父視圖佈局
        let margins = photoImageView.superview!.layoutMarginsGuide
        //停用自動調整大小的遮罩,以編寫程式的方式來使用自動佈局
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        //將圖片視圖的前緣固定到邊界的前緣
        photoImageView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        //將圖片視圖的前緣固定到邊界的後緣
        photoImageView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        //將圖片視圖的前緣固定到頂部的邊緣
        photoImageView.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        //將圖片視圖的前緣固定到底部的邊緣
        photoImageView.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
        
        //影藏鍵盤
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        }
    
    @IBOutlet var nameTextField: RoundedTextField! {
        didSet{
            nameTextField.tag = 1
            nameTextField.becomeFirstResponder()
            nameTextField.delegate = self as! UITextFieldDelegate
        }
    }
    
    @IBOutlet var typeTextField: RoundedTextField!{
        didSet{
            typeTextField.tag = 2
            typeTextField.delegate = self as! UITextFieldDelegate
        }
    }
    @IBOutlet var addressTextField: RoundedTextField!{
        didSet{
            addressTextField.tag = 3
            addressTextField.delegate = self as! UITextFieldDelegate
        }
    }
    @IBOutlet var phoneTextField: RoundedTextField!{
        didSet{
            phoneTextField.tag = 4
            phoneTextField.delegate = self as! UITextFieldDelegate
        }
    }
    @IBOutlet var descriptionTextView: UITextView?{
        didSet{
            descriptionTextView?.tag = 5
            descriptionTextView?.layer.cornerRadius = 10.0
            descriptionTextView?.layer.masksToBounds = true
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            
            let photoSourceRequestController = UIAlertController(title: "", message: "Choose your photo source", preferredStyle: .actionSheet)
            let camraAction = UIAlertAction(title: "Camera", style: .default, handler: {(action) in
                if UIImagePickerController.isSourceTypeAvailable(.camera){
                    let imagePicker = UIImagePickerController()
                    imagePicker.allowsEditing = false
                    imagePicker.sourceType = .camera
                    imagePicker.delegate = self
                    
                    self.present(imagePicker,animated: true,completion: nil)
            }
        })
            
            let photoLibraryAction = UIAlertAction(title: "Photo library", style: .default, handler: {(action)in
                if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                    let imagePicker = UIImagePickerController()
                    imagePicker.allowsEditing = false
                    imagePicker.sourceType = .photoLibrary
                    imagePicker.delegate = self
                    
                    self.present(imagePicker,animated: true,completion: nil)
                }
            })
            photoSourceRequestController.addAction(camraAction)
            photoSourceRequestController.addAction(photoLibraryAction)
            
            //對於ipad
            if let popoverController = photoSourceRequestController.popoverPresentationController{
                if let cell = tableView.cellForRow(at: indexPath){
                    popoverController.sourceView = cell
                    popoverController.sourceRect = cell.bounds
                }
            }
            present(photoSourceRequestController,animated: true,completion: nil)
    }
    }
    @IBOutlet var photoImageView: UIImageView!{
        didSet{
            photoImageView.layer.cornerRadius = 10.0
            photoImageView.layer.masksToBounds = true
        }
    }
}

extension NewRestaurantController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextTextField = view.viewWithTag(textField.tag + 1 ){
            textField.resignFirstResponder()
            nextTextField.becomeFirstResponder()
        }
        return true
    }
    
}
extension NewRestaurantController:UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            photoImageView.image = selectedImage
            photoImageView.contentMode = .scaleAspectFill
            photoImageView.clipsToBounds = true
        }
        dismiss(animated: true, completion: nil)}
}
