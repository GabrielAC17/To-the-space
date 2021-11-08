//
//  ContentView.swift
//  To the space
//
//  Created by Gabriel de Andrade Cordeiro on 07/11/21.
//

import SwiftUI

struct ContentView: View {
    @State var results = [SpaceXLaunch]()
    @State var stringHeader = ""

       var body: some View {
           List {

               Text(stringHeader).multilineTextAlignment(.center)
               ForEach(results) { result in
                   VStack(alignment: .leading) {

                       VStack(alignment: .leading, spacing: 16, content: {
                           AsyncImage(url: URL(string: result.links?.missionPatch ?? "")) { image in
                                      image
                                          .resizable()
                                          .aspectRatio(contentMode: .fit)
                                  } placeholder: {
                                      Image(systemName: "photo")
                                          .imageScale(.large)
                                          .foregroundColor(.gray)
                                  }.frame(idealHeight: UIScreen.main.bounds.width)

                           (Text("Mission: ").bold() + Text("\(result.missionName ?? "")"))
                               .font(.title)
                               .padding(.bottom)


                           VStack(alignment: .leading, spacing: 16, content: {
                               Text("Date/Time: ").bold() + Text("\(getFormattedDate(result.launchDateUTC))")
                                   .font(.body)
                                   .fontWeight(.light)

                               Text("Rocket: ").bold() + Text("\(result.rocket?.rocketName ?? "")/\(result.rocket?.rocketType ?? "")")
                                   .font(.body)
                                   .fontWeight(.light)

                               Text("\(getRelativeDaysTitle(result.launchDateUTC))").bold() + Text("\(getRelativeDays(result.launchDateUTC))")
                                   .font(.body)
                                   .fontWeight(.light)
                           })
                       })

                       Spacer()
                   }
                }
               .shadow(radius: 2)
               .cornerRadius(15)
           }
               .onAppear() {
                LaunchesViewModel().getSpaceXLaunches { (results) in
                    self.results = results
                }
                InfoViewModel().getSpaceXInfo { (result) in
                    self.stringHeader = result
                }
               }.navigationBarTitle("To the space")
       }

    func getFormattedDate(_ origin: String?) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        if let stringDate = origin, let launchDate = formatter.date(from: stringDate) {
            formatter.dateFormat = "dd/MM/yyyy' at 'HH:mm:ss"
            return formatter.string(from: launchDate)
        }
        return ""
    }

    func getRelativeDaysTitle(_ origin: String?) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        if let stringDate = origin, let launchDate = formatter.date(from: stringDate) {
            var finalString = "Days "
            finalString += launchDate < Date() ? "since" : "from"

            finalString += " now: "

            return finalString
        }
        return ""
    }

    func getRelativeDays(_ origin: String?) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        if let stringDate = origin, let launchDate = formatter.date(from: stringDate) {
            let calendar = Calendar.current
            let firstDate = launchDate < Date() ? launchDate : Date()
            let secondDate = launchDate < Date() ? Date() : launchDate
            var finalString = ""

            let date1 = calendar.startOfDay(for: firstDate)
            let date2 = calendar.startOfDay(for: secondDate)

            let components = calendar.dateComponents([.day], from: date1, to: date2)

            finalString += "\(components.day ?? 0)"

            return finalString
        }
        return ""
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
