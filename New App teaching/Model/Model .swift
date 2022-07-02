//
//  Model .swift
//  New App teaching
//
//  Created by Кирилл on 28.06.2022.
//

import Foundation

var articles : [Article] {
    let data = try? Data(contentsOf: urlToData)
    
    if data == nil {
        return []
    }
    
    let rootDictionaryAny = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
    
    if rootDictionaryAny == nil {
        return []
    }
    let rootDictionary = rootDictionaryAny as? Dictionary<String,Any>
    
    if rootDictionary == nil {
        return []
    }
    
    if let array = rootDictionary!["articles"] as? [Dictionary<String,Any>] {
        
        var returnArray : [Article] = []
        
        for dict in array {
            let newArtical = Article(dictionaty: dict)
            returnArray.append(newArtical)
    }
        return returnArray

    }
    return []
}


var urlToData : URL {
    let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0]+"/data.json"
       let urlPath = URL(fileURLWithPath: path)
    return urlPath
}
/*
 https://newsapi.org/v2/everything?q=apple&from=2022-06-27&to=2022-06-27&sortBy=popularity&apiKey=a49b2e6f869a433a944b06f4e9dbc52a
 */
func loadFunc(complationHandler : (()->Void)?) {
    let url = URL(string: "https://newsapi.org/v2/everything?q=apple&from=2022-06-27&to=2022-06-27&sortBy=popularity&apiKey=a49b2e6f869a433a944b06f4e9dbc52a")
    let session = URLSession(configuration: .default)
    let dowloadTask = session.downloadTask(with: url!) { urlFile , responce, error in
        if urlFile != nil {
            try? FileManager.default.copyItem(at: urlFile!, to: urlToData)
            complationHandler?()
        }
    }
    dowloadTask.resume()
}



//func parseJson () {
//    let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0]+"/date.json"
//    let urlPath = URL(fileURLWithPath: path)
//    
//    let data = try? Data(contentsOf: urlPath)
//    if data == nil {
//        return
//    }
//   let rootDictionaryAny = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
//    if rootDictionaryAny == nil {
//        return
//    }
//    let rootDictionary = rootDictionaryAny  as? Dictionary<String,Any>
//    if rootDictionary == nil {
//        return
//    }
//    
//    
//    if let array = rootDictionary!["articles"] as? [Dictionary<String,Any>] {
//        var  returnArray : [Article] = []
//        for dict in array {
//        let newAricler = Article(dictionaty: dict)
//
//            returnArray.append(newAricler)
//        }
//        artical = returnArray
//    }
//
//   
//}
//
//func loadNews () {
//    let session = URLSession(configuration: .default)
//    let url = URL(string: "https://newsapi.org/v2/everything?q=apple&from=2022-06-27&to=2022-06-27&sortBy=popularity&apiKey=a49b2e6f869a433a944b06f4e9dbc52a")
//    let dowloadTak = session.downloadTask(with: url!) { urlFile, responce, error in
//        if urlFile != nil {
//
//           let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0]+"/data.json"
//            let urlPath = URL(fileURLWithPath: path)
//           try? FileManager.default.copyItem(at: urlFile!, to: urlPath)
//
//            parseNews()
//            print(articles.count)
//        }
//    }
//    dowloadTak.resume()
//}
//
//
