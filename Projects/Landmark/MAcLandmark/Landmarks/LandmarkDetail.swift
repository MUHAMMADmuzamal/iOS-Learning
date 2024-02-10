//
//  LandmarkDetail.swift
//  MAcLandmark
//
//  Created by Codes Orbit on 10/02/2024.
//

import SwiftUI

struct LandmarkDetail: View {
    @Binding var modelData: ModelData
    var landmark: Landmark


    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }


    var body: some View {
        
        ScrollView {
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                Image("turtlerock_feature")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 300)


                Button("Open in Maps") {
              
                }
                .padding()
            }


            VStack(alignment: .leading, spacing: 20) {
                HStack(spacing: 24) {
                    CircleImage(image: landmark.image.resizable())
                        .frame(width: 160, height: 160)


                    VStack(alignment: .leading) {
                        HStack {
                            Text(landmark.name)
                                .font(.title)
                            FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                                .buttonStyle(.plain)
                        }


                        VStack(alignment: .leading) {
                            Text(landmark.park)
                            Text(landmark.state)
                        }
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    }
                }


                Divider()


                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
            .frame(maxWidth: 700)
            .offset(y: -50)
        }
        .navigationTitle(landmark.name)
    }
}


#Preview {
    let modelData = ModelData()
    return LandmarkDetail(modelData: .constant(modelData), landmark: modelData.landmarks[0])
        .frame(width: 850, height: 700)
}
