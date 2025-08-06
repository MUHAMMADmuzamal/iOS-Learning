//
//  Double + Extension.swift
//  Tidoy
//
//  Created by Muhammad Muzamal on 05/05/2025.
//

import Foundation

extension Double {
    static let nearByCardHeight: Double = 236
    static let nearByCardWidth: Double = 165
    
    /// Returns a responsive value based on design dimensions and current screen size.
    func responsive(basedOn designDimension: CGFloat, current actualDimension: CGFloat) -> CGFloat {
        return (self / designDimension) * actualDimension
    }
}


struct Responsive {
    // Design dimensions (set these to your design specs)
    static let designWidth: CGFloat = 1206  // iPhone 13 width
    static let designHeight: CGFloat = 2622 // iPhone 13 height
    
    // Get current screen size
    static var screenSize: CGSize {
        #if os(iOS)
        return UIScreen.main.bounds.size
        #else
        return NSScreen.main?.visibleFrame.size ?? .zero
        #endif
    }
    
    // Calculate responsive width
    static func width(_ pixels: CGFloat) -> CGFloat {
        (pixels / designWidth) * screenSize.width
    }
    
    // Calculate responsive height
    static func height(_ pixels: CGFloat) -> CGFloat {
        (pixels / designHeight) * screenSize.height
    }
    
    // Get scale factor
    static var scaleFactor: CGFloat {
        screenSize.width / designWidth
    }
}

// View modifiers
extension View {
    func responsiveWidth(_ width: CGFloat) -> some View {
        frame(width: Responsive.width(width))
    }
    
    func responsiveHeight(_ height: CGFloat) -> some View {
        frame(height: Responsive.height(height))
    }
    
    func responsiveFrame(width: CGFloat? = nil, height: CGFloat? = nil) -> some View {
        frame(
            width: width.map { Responsive.width($0) },
            height: height.map { Responsive.height($0) }
        )
    }
    
    func responsivePadding(_ edges: Edge.Set = .all, _ length: CGFloat) -> some View {
        padding(edges, Responsive.width(length))
    }
    
    func responsiveFont(size: CGFloat, weight: Font.Weight = .regular) -> some View {
        font(.system(size: size * Responsive.scaleFactor, weight: weight))
    }
}

// MARK: - Usage Examples
/*
 
 // 1. Basic Responsive Sizing
 Rectangle()
     .responsiveFrame(width: 200, height: 100)  // Design size: 200×100
     .responsivePadding(.all, 16)               // 16pt padding in design
 
 // 2. Responsive Text
 Text("Hello World")
     .responsiveFont(size: 18)                 // 18pt in design
     .responsivePadding(.bottom, 8)            // 8pt bottom padding in design
 
 // 3. Responsive Button
 Button(action: {}) {
     Text("Submit")
         .responsiveFont(size: 16)
         .responsivePadding(.horizontal, 20)
         .responsiveFrame(height: 50)          // 50pt tall in design
 }
 .background(Color.blue)
 
 // 4. Responsive Stack with Spacing
 VStack(spacing: Responsive.height(20)) {      // 20pt spacing in design
     Text("Item 1")
     Text("Item 2")
 }
 .responsivePadding(.horizontal, 16)
 
 // 5. Responsive Image Card
 Image("profile")
     .resizable()
     .responsiveFrame(width: 120, height: 120)
     .cornerRadius(Responsive.width(12))       // 12pt radius in design
 
 // 6. Full-Width Responsive Element
 Rectangle()
     .responsiveHeight(200)                   // 200pt tall in design
     .responsivePadding(.horizontal, 16)      // 16pt side margins
     .frame(maxWidth: .infinity)               // Expands to full available width
 
 // 7. Responsive Grid Layout
 let columns = [
     GridItem(.flexible(), spacing: Responsive.width(16)),  // 16pt gap in design
     GridItem(.flexible(), spacing: Responsive.width(16))
 ]
 LazyVGrid(columns: columns, spacing: Responsive.height(20)) { /* ... */ }
 
 // 8. Responsive Corner Radius
 RoundedRectangle(cornerRadius: Responsive.width(8))  // 8pt radius in design
     .responsiveFrame(width: 300, height: 150)
 
 // 9. Complex Responsive Layout Example
 VStack(spacing: Responsive.height(24)) {
     Text("Title")
         .responsiveFont(size: 24, weight: .bold)
     
     HStack(spacing: Responsive.width(16)) {
         Button("Cancel") { /* ... */ }
             .responsiveFrame(height: 44)
             .frame(maxWidth: .infinity)
         
         Button("Confirm") { /* ... */ }
             .responsiveFrame(height: 44)
             .frame(maxWidth: .infinity)
     }
 }
 .responsivePadding(.horizontal, 20)
 
 // 10. Responsive System Icons
 Image(systemName: "heart.fill")
     .responsiveFont(size: 24)                // Scales SF Symbols appropriately
 
 */
