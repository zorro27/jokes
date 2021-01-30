//
//  ViewController.swift
//  Test
//
//  Created by Роман Зобнин on 24.01.2021.
//

import UIKit

class ViewController: UIViewController{
    
    var funs: [Chak] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.isHidden = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var myTextField: UITextField!
    @IBAction func myButton(_ sender: Any) {
        tableView.isHidden = false
        newUrl = baseUrl + (myTextField.text ?? "1")
        let loader = FunLoader()
        loader.delegate = self
        loader.loadFuns()
        }
    
    }

extension ViewController: funLoaderDelegate{
    func loader(funs:[Chak]) {
        self.funs = funs
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return funs.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! funTableViewCell
        
        let model = funs[indexPath.row]
        cell.funLabel.text = model.joke
        return cell
    }
}
