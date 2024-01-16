//
//  Modifiers.swift
//  ToDueList
//
//  Created by Matthew Low on 2024-01-15.
//

import Foundation
import SwiftUI

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View{
        content
            .font(Font.system(size: 30, weight: .bold, design: .rounded))
            
    }
}
