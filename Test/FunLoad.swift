//
//  FunLoad.swift
//  Test
//
//  Created by Роман Зобнин on 24.01.2021.
//

import Foundation

protocol funLoaderDelegate {
    func loader(funs:[Chak])
}

let baseUrl = "http://api.icndb.com/jokes/random/"
var newUrl = baseUrl

  class FunLoader {
    var delegate: funLoaderDelegate?
    
    func loadFuns(){
        //let url  = URL(string: "http://api.icndb.com/jokes/random/3")!
        let url = URL(string: newUrl)!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data,
               let json = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments),
               let jsonDict = json as? Dictionary<String, Any> {
                var funs:[Chak] = []
                if let array = jsonDict["value"] as? [Dictionary <String, Any>] {
                    for i in array {
                        let newJoke = Chak(data: i)
                        funs.append(newJoke!)
                    }
                }
                DispatchQueue.main.async{
                self.delegate?.loader(funs: funs)
                }
            }
            }
        task.resume()
        }
}



