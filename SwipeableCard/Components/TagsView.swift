//
//  TagsView.swift
//  SwipeableCard
//
//  Created by Đoàn Văn Khoan on 16/11/24.
//

import SwiftUI

struct TagsView: View {
    
    let items: [TagResponse]
    let spacing: CGFloat
    let horizontalSpacing: CGFloat
    let verticalSpacing: CGFloat
    
    @State private var totalHeight: CGFloat = .zero
    
    var body: some View {
        GeometryReader { geometry in
            self.generateContent(in: geometry)
        }
        .frame(height: totalHeight)
    }
    
    private func generateContent(in geometry: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        
        return ZStack(alignment: .topLeading) {
            ForEach(self.items) { item in
                self.item(for: item)
                    .padding([.horizontal], self.horizontalSpacing)
                    .padding([.vertical], self.verticalSpacing)
                    .alignmentGuide(.leading) { d in
                        if (abs(width - d.width) > geometry.size.width) {
                            width = 0
                            height -= d.height
                        }
                        
                        let result = width
                        if item == self.items.last {
                            width = 0 /// last item
                        } else {
                            width -= d.width
                        }
                        return result
                    }
                    .alignmentGuide(.top) { _ in
                        let result = height
                        if item == self.items.last {
                            height = 0 /// last item
                        }
                        return result
                    }
            }
        }
        .background(viewHeightReader())
    }
    
    private func item(for item: TagResponse) -> some View {
        Text(item.name)
            .font(.headline)
            .fontWeight(.semibold)
            .padding(.horizontal, 20)
            .padding(.vertical, 6)
            .background(Color.gray.opacity(0.7))
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
    
    private func viewHeightReader() -> some View {
        GeometryReader { geometry -> Color in
            DispatchQueue.main.async {
                self.totalHeight = geometry.size.height
            }
            return .clear
        }
    }
}
