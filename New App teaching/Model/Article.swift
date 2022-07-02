//
//  Article.swift
//  New App teaching
//
//  Created by Кирилл on 28.06.2022.
//

import Foundation
/*
 
 -"source": {
 "id": null,
 "name": "Lifehacker.com"
 },
 "author": "Meredith Dietz",
 "title": "Why Everyone Hates Landlords Now",
 "description": "Leeches. Parasites. Maybe even bed bugs? Landlords get called a lot of things—none of them favorable. This couple running a “15-Airbnb empire” went viral on Twitter last week, highlighting an increasingly common consensus online: Everyone hates landlords.Read…",
 "url": "https://lifehacker.com/why-everyone-hates-landlords-now-1849100799",
 "urlToImage": "https://i.kinja-img.com/gawker-media/image/upload/c_fill,f_auto,fl_progressive,g_center,h_675,pg_1,q_80,w_1200/1a9f53bfddf1b8486dd51e01339c1a80.jpg",
 "publishedAt": "2022-06-27T13:30:00Z",
 "content": "Leeches. Parasites. Maybe even bed bugs? Landlords get called a lot of thingsnone of them favorable. This couple running a 15-Airbnb empire went viral on Twitter last week, highlighting an increasing… [+4577 chars]"
 
*/


struct Article {
    
    var author : String
    var title : String
    var description : String
    var url : String
    var urlToImage : String
    var publishedAt : String
    var content : String
    
    var sourceName : String
    
    init(dictionaty: Dictionary<String, Any>){
        author = dictionaty["author"] as? String ??  ""
        title = dictionaty["title"] as? String ??  ""
        description = dictionaty["description"] as? String ??  ""
        url = dictionaty["url"] as? String ??  ""
        urlToImage = dictionaty["urlToImage"] as? String ??  ""
        publishedAt = dictionaty["publishedAt"] as? String ??  ""
        content = dictionaty["content"] as? String ??  ""
        
        sourceName = (dictionaty["source"] as? Dictionary<String,Any> ?? ["":""])["name"] as? String ?? ""
    }
}
