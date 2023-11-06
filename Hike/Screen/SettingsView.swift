//
//  SettingsView.swift
//  Hike
//
//  Created by Nilam Shah on 06/11/23.
//

import SwiftUI

struct SettingsView: View {
    private let alternateAppIcons: [String] = [
        "AppIcon-Backpack",
        "AppIcon-MagnifyingGlass",
        "AppIcon-Map",
        "AppIcon-Mushroom",
        "AppIcon-Camera",
        "AppIcon-Campfire"
    ]
    
    var body: some View {
        List {
            //MARK: Header Section
            Section {
                SettingsHeaderSection()
            }
            .listRowSeparator(.hidden)
            
            Section(
                header: Text("Alternate App Icons")) {
                    ScrollView(.horizontal) {
                        HStack(spacing: 12) {
                            ForEach(alternateAppIcons.indices, id: \.self) { item in
                                Button {
                                    print("\(alternateAppIcons[item])-Preview Icon pressed")
                                    UIApplication.shared.setAlternateIconName(alternateAppIcons[item]) { error in
                                        if error != nil {
                                            print("Failed to update alternate app icon: \(String(describing: error?.localizedDescription))")
                                        } else {
                                            print("Success! You have changed app icon to \(alternateAppIcons[item])")
                                        }
                                    }
                                } label: {
                                    Image("\(alternateAppIcons[item])-Preview")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 80, height: 80)
                                        .cornerRadius(16)
                                }
                            .buttonStyle(.borderless)
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                    Text("Choose your favourite app icon from the collectio above.")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.secondary)
                        .font(.footnote)
                        .padding(.bottom, 12)
                }
                .listRowSeparator(.hidden)
            
            //MARK: Icons lists
            Section(
                header: Text("ABOUT THE APP"),
                footer: HStack {
                    Spacer()
                    Text("Copyright © All rights reserved")
                    Spacer()
                }
                    .padding(.vertical, 8)
            ) {
                CustomListRowView(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "Hike", rowTintColor: .blue)
                
                CustomListRowView(rowLabel: "Compatiblity", rowIcon: "info.circle", rowContent: "iOS, iPadOS", rowTintColor: .red)
                
                CustomListRowView(rowLabel: "Technology", rowIcon: "swift", rowContent: "Swift", rowTintColor: .orange)
                
                CustomListRowView(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: .purple)
                
                CustomListRowView(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "Nilam Shah", rowTintColor: .teal)
                
                CustomListRowView(rowLabel: "Designer", rowIcon: "paintpalette", rowContent: "Nilam", rowTintColor: .red)
                
                CustomListRowView(rowLabel: "Website", rowIcon: "globe", rowTintColor: .indigo, rowLinkLabel: "Apple", rowLinkUrl: "https://www.apple.com")
            }
        }
    }
}

#Preview {
    SettingsView()
}
