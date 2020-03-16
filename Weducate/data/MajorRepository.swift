//
//  MajorRepository.swift
//  Weducate
//
//  Created by Arifin Firdaus on 15/03/20.
//  Copyright © 2020 Weducate. All rights reserved.
//

import Foundation

class MajorRepository {
    
    func fetchMajors() -> [Major] {
        var majors = [Major]()
        majors.append(Major(id: 1, name: "Computer Science", domain: "Science & Engineering", imageName: "ic_computer_science"))
        majors.append(Major(id: 2, name: "Music", domain: "Art", imageName: "ic_music"))
        majors.append(Major(id: 3, name: "Videography", domain: "Film & Television", imageName: "ic_videography"))
        majors.append(Major(id: 4, name: "Medical", domain: "Medical", imageName: "ic_medical"))
        majors.append(Major(id: 5, name: "Biology", domain: "Science", imageName: "ic_science"))
        majors.append(Major(id: 6, name: "Art", domain: "Fine Arts", imageName: "ic_art"))
        
        return majors
    }
    
}
