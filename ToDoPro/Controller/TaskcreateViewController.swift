//
//  TaskcreateViewController.swift
//  ToDoPro
//
//  Created by Simon Cubalevski on 6/20/19.
//  Copyright © 2019 Simon Cubalevski. All rights reserved.
//

import UIKit
import StoreKit

class TaskcreateViewController: UIViewController {
    
    
    //MARK: - Outlets
    
    @IBOutlet weak var taskcreatetextfield: UITextField!
    
    
    //MARK: - App lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(TaskcreateViewController.keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.taskcreatetextfield.text  = ""
        taskcreatetextfield.becomeFirstResponder()
        print("child controller is being called")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: - Actions
    
    @IBAction func closebuttonAction(_ sender: Any) {
        self.willMove(toParentViewController: nil)
        self.removeFromParentViewController()
        self.view.removeFromSuperview()
        NotificationCenter.default.post(name: .removechildcontroller, object: nil)
        if #available( iOS 10.3,*){
            SKStoreReviewController.requestReview()
        }
    }
    
    
    //MARK: - Functions
    
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            print(keyboardHeight)
        }
    }
    
    deinit {
        print("I am being deinitialized")
    }
    
    func hideKeyboard(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(TaskcreateViewController.dismissKeyboard))
        
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
}
