//
//  PlanningRepository.swift
//  Weducate
//
//  Created by Arifin Firdaus on 19/03/20.
//  Copyright © 2020 Weducate. All rights reserved.
//

import Foundation


class PlanningRepository {
    
    func fetchPlannings() -> [Planning] {
        var plannings = [Planning]()
        
        plannings.append(Planning(id: 1, title: "Learn English", detail: "TOEFL 500", status: .todo))
        plannings.append(Planning(id: 2, title: "Learn Communication Skill", detail: "Can guide the team", status: .todo))
        plannings.append(Planning(id: 3, title: "Nilai Rapor Sains", detail: "A", status: .doing))
        plannings.append(Planning(id: 4, title: "Nilai Rapor Design Thinking", detail: "A", status: .doing))
        plannings.append(Planning(id: 5, title: "Belajar SCRUM", detail: "https://www.scrum.org", status: .done))
        plannings.append(Planning(id: 6, title: "Belajar HIG", detail: "https://developer.apple.com/design/", status: .done))
        
        return plannings
    }
    
}

