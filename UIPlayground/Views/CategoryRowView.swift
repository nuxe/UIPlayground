//
//  Untitled.swift
//  UIPlayground
//
//  Created by Kush Agrawal on 6/7/25.
//

import SwiftUI

struct CategoryRowView: View {
    
    let category: UICategory
    
    var body: some View {
        HStack {
            Image(systemName: category.icon)
                .foregroundStyle(.cyan)
            
            VStack(alignment: .leading) {
                Text(category.name)
                
                Text(category.components.joined(separator: ", "))
                    .font(.caption)
            }
        }
    }
}

#Preview {
    CategoryRowView(category: UICategory.fake())
}
