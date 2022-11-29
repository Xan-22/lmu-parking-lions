//
//  MapInfo.swift
//  ParkingLions
//
//  Created by Xan on 11/8/22.
//

import SwiftUI
import CoreLocation
import MapKit

struct MapInfo {
    
    static let allAnnotations: [ParkingAnnotation] = [drollingerAnnotation, hannonAnnotation,
                                                      delRayAnnotation, rosecransAnnotation,
                                                      universityHallAnnotation, eastQuadAnnotation,
                                                      burnsRecCenterAnnotation, gerstenPavilionAnnotation,
                                                      lifeSciencesAnnotation, charlesVanDerAheAnnotation,
                                                      mackayAnnotation, jesuitCommunityAnnotation,
                                                      leaveyCircleAnnotation, whelanLaneAnnotation,
                                                      xavierHallAnnotation]
    
    static let allOverlays: [MKPolygon] = [drollingerOverlay, hannonOverlay,
                                           delRayOverlay, rosecransOverlay,
                                           universityHallOverlay, eastQuadOverlay,
                                           burnsRecCenterOverlay, gerstenPavilionOverlay,
                                           lifeSciencesOverlay, charlesVanDerAheOverlay,
                                           mackayOverlay, jesuitCommunityOverlay,
                                           leaveyCircleOverlay, whelanLaneOverlay,
                                           xavierHallOverlay]
    
    static let drollingerAnnotation = ParkingAnnotation(
        title: "Drollinger - Lot L",
        subtitle: "Visitor/Student/Faculty | Disabled Parking Available",
        coordinate: CLLocationCoordinate2D(latitude: 33.968949946590236, longitude:  -118.41940968881534))
    static let hannonAnnotation = ParkingAnnotation(
        title: "Hannon - Lot A",
        subtitle: "Visitor/Student/Faculty | Disabled Parking Available",
        coordinate: CLLocationCoordinate2D(latitude: 33.966918903880305, longitude:  -118.41766890138892))
    static let delRayAnnotation = ParkingAnnotation(
        title: "Del Ray - Lot H",
        subtitle: "Visitor/Student/Faculty | Disabled Parking Available",
        coordinate: CLLocationCoordinate2D(latitude: 33.97284727488996, longitude:  -118.41425415384418))
    static let rosecransAnnotation = ParkingAnnotation(
        title: "Rosecrans - Lot R",
        subtitle: "Student/Faculty",
        coordinate: CLLocationCoordinate2D(latitude: 33.9713753039926, longitude:  -118.41463738453956))
    static let universityHallAnnotation = ParkingAnnotation(
        title: "University Hall - Lot U",
        subtitle: "Visitor/Student/Faculty | Disabled Parking Available",
        coordinate: CLLocationCoordinate2D(latitude: 33.966507605178464, longitude:  -118.42279162513734))
    static let eastQuadAnnotation = ParkingAnnotation(
        title: "East Quad - Lot E",
        subtitle: "Student/Faculty",
        coordinate: CLLocationCoordinate2D(latitude: 33.970216757048, longitude:  -118.41379978132211))
    static let burnsRecCenterAnnotation = ParkingAnnotation(
        title: "Burns Rec Center - Lot C",
        subtitle: "Student/Faculty | Disabled Parking Available",
        coordinate: CLLocationCoordinate2D(latitude: 33.96817766729448, longitude:  -118.41637009156322))
    static let gerstenPavilionAnnotation = ParkingAnnotation(
        title: "Gersten Pavilion - Lot B",
        subtitle: "Student/Faculty | Disabled Parking Available",
        coordinate: CLLocationCoordinate2D(latitude: 33.96772053444992, longitude:  -118.41637411487682))
    static let lifeSciencesAnnotation = ParkingAnnotation(
        title: "Life Sciences Building - Lot D",
        subtitle: "Student/Faculty | Disabled Parking Available",
        coordinate: CLLocationCoordinate2D(latitude: 33.969474105832965, longitude:  -118.4156995772962))
    static let charlesVanDerAheAnnotation = ParkingAnnotation(
        title: "Charles Van der Ahe - Lot M",
        subtitle: "Faculty Parking Only",
        coordinate: CLLocationCoordinate2D(latitude: 33.969955316282906, longitude:  -118.41764476150689))
    static let mackayAnnotation = ParkingAnnotation(
        title: "Mackay - Lot K",
        subtitle: "Faculty Parking Only",
        coordinate: CLLocationCoordinate2D(latitude: 33.96881417180847, longitude:  -118.41861840337964))
    static let jesuitCommunityAnnotation = ParkingAnnotation(
        title: "Jesuit Community - Lot J",
        subtitle: "Faculty Parking Only",
        coordinate: CLLocationCoordinate2D(latitude: 33.972273149349185, longitude:  -118.41796930878952))
    static let leaveyCircleAnnotation = ParkingAnnotation(
        title: "Leavey Circle - Lot O",
        subtitle: "Faculty Parking Only",
        coordinate: CLLocationCoordinate2D(latitude: 33.969081107564634, longitude:  -118.42074568251651))
    static let whelanLaneAnnotation = ParkingAnnotation(
        title: "Whelan Lane - Lot W",
        subtitle: "Faculty Parking Only",
        coordinate: CLLocationCoordinate2D(latitude: 33.972480016212565, longitude:  -118.41600621917866))
    static let xavierHallAnnotation = ParkingAnnotation(
        title: "Xavier Hall - Lot I",
        subtitle: "Visitor Parking",
        coordinate: CLLocationCoordinate2D(latitude: 33.9723732462781, longitude:  -118.41747338750952))
    
    
    static let drollingerOverlay =  MKPolygon(coordinates: [
        CLLocationCoordinate2D(latitude: 33.969747814141556, longitude: -118.41911572749991),
        CLLocationCoordinate2D(latitude: 33.969747814141556, longitude: -118.41880395034723),
        CLLocationCoordinate2D(latitude: 33.96840694911493, longitude: -118.41880395034723),
        CLLocationCoordinate2D(latitude: 33.96840694911493, longitude: -118.42048557760448),
        CLLocationCoordinate2D(latitude: 33.96862443243661, longitude: -118.42048557760448)
    ], count: 5)
    static let hannonOverlay =  MKPolygon(coordinates: [
        CLLocationCoordinate2D(latitude: 33.96745961982408, longitude: -118.41861762008476),
        CLLocationCoordinate2D(latitude: 33.96749794112521, longitude: -118.41696446630911),
        CLLocationCoordinate2D(latitude: 33.966131137377054, longitude: -118.41694906425529),
        CLLocationCoordinate2D(latitude: 33.96611419080552, longitude: -118.41862748311024)
    ], count: 4)
    static let delRayOverlay =  MKPolygon(coordinates: [
        CLLocationCoordinate2D(latitude: 33.97297419541852, longitude: -118.41506008586772),
        CLLocationCoordinate2D(latitude: 33.97320410805662, longitude: -118.41401788022655),
        CLLocationCoordinate2D(latitude: 33.97237812272103, longitude: -118.41373037522207),
        CLLocationCoordinate2D(latitude: 33.97143291315329, longitude: -118.413709839151),
        CLLocationCoordinate2D(latitude: 33.971445686325445, longitude: -118.41421810692677),
        CLLocationCoordinate2D(latitude: 33.97218226934151, longitude: -118.4142540450523)
    ], count: 6)
    static let rosecransOverlay =  MKPolygon(coordinates: [
        CLLocationCoordinate2D(latitude: 33.97145427019354, longitude: -118.41492035759252),
        CLLocationCoordinate2D(latitude: 33.971455382393025, longitude: -118.41426455748396),
        CLLocationCoordinate2D(latitude: 33.97127298148232, longitude: -118.41425516975235),
        CLLocationCoordinate2D(latitude: 33.971282991298544, longitude: -118.41492035759252)
    ], count: 4)
    static let universityHallOverlay =  MKPolygon(coordinates: [
        CLLocationCoordinate2D(latitude: 33.96599373756995, longitude: -118.42347290623171),
        CLLocationCoordinate2D(latitude: 33.96790237306604, longitude: -118.42232223856307),
        CLLocationCoordinate2D(latitude: 33.9676332091201, longitude: -118.42163559305062),
        CLLocationCoordinate2D(latitude: 33.96569564843752, longitude: -118.42283454048301)
    ], count: 4)
    static let eastQuadOverlay =  MKPolygon(coordinates: [
        CLLocationCoordinate2D(latitude: 33.97059690373107, longitude: -118.413881591397),
        CLLocationCoordinate2D(latitude: 33.97059590442218, longitude: -118.41372159367626),
        CLLocationCoordinate2D(latitude: 33.968984512228715, longitude: -118.41372906171713),
        CLLocationCoordinate2D(latitude: 33.96895805874805, longitude: -118.41438295054327),
        CLLocationCoordinate2D(latitude: 33.96974636887784, longitude: -118.41430639770512),
        CLLocationCoordinate2D(latitude: 33.969809248599134, longitude: -118.41391155278912)
    ], count: 6)
    static let burnsRecCenterOverlay =  MKPolygon(coordinates: [
        CLLocationCoordinate2D(latitude: 33.96849131905871, longitude: -118.41645189893882),
        CLLocationCoordinate2D(latitude: 33.968497992487926, longitude: -118.416262803202),
        CLLocationCoordinate2D(latitude: 33.96805865727962, longitude: -118.41626950872458),
        CLLocationCoordinate2D(latitude: 33.96805865727962, longitude: -118.41646262777495)
    ], count: 4)
    static let gerstenPavilionOverlay =  MKPolygon(coordinates: [
        CLLocationCoordinate2D(latitude: 33.967948545051605, longitude: -118.41646933329748),
        CLLocationCoordinate2D(latitude: 33.96794520831551, longitude: -118.4162668265155),
        CLLocationCoordinate2D(latitude: 33.96746471694455, longitude: -118.41628157866501),
        CLLocationCoordinate2D(latitude: 33.967475839460555, longitude: -118.41647603881992)
    ], count: 4)
    static let lifeSciencesOverlay =  MKPolygon(coordinates: [
        CLLocationCoordinate2D(latitude: 33.96992164544563, longitude: -118.415887293944),
        CLLocationCoordinate2D(latitude: 33.96991163546915, longitude: -118.41543668282648),
        CLLocationCoordinate2D(latitude: 33.969198273487685, longitude: -118.41545147296065),
        CLLocationCoordinate2D(latitude: 33.96907147928688, longitude: -118.41592756506402)
    ], count: 4)
    static let charlesVanDerAheOverlay =  MKPolygon(coordinates: [
        CLLocationCoordinate2D(latitude: 33.97002088459065, longitude: -118.417747068868),
        CLLocationCoordinate2D(latitude: 33.97002088459065, longitude: -118.41751639889115),
        CLLocationCoordinate2D(latitude: 33.96983848060303, longitude: -118.41745202587437),
        CLLocationCoordinate2D(latitude: 33.969860725012715, longitude: -118.41773634003188)
    ], count: 4)
    static let mackayOverlay =  MKPolygon(coordinates: [
        CLLocationCoordinate2D(latitude: 33.96901098442038, longitude: -118.41862146901158),
        CLLocationCoordinate2D(latitude: 33.96901098442038, longitude: -118.41858928250319),
        CLLocationCoordinate2D(latitude: 33.96860168226113, longitude: -118.41857855366705),
        CLLocationCoordinate2D(latitude: 33.96861502910174, longitude: -118.41863756226579)
    ], count: 4)
    static let jesuitCommunityOverlay =  MKPolygon(coordinates: [
        CLLocationCoordinate2D(latitude: 33.97225780385178, longitude: -118.41830122942226),
        CLLocationCoordinate2D(latitude: 33.97251138256272, longitude: -118.41786134714083),
        CLLocationCoordinate2D(latitude: 33.97237792017753, longitude: -118.41768432134467),
        CLLocationCoordinate2D(latitude: 33.97205316083192, longitude: -118.41808128828153)
    ], count: 4)
    static let leaveyCircleOverlay =  MKPolygon(coordinates: [
        CLLocationCoordinate2D(latitude: 33.96907693829547, longitude: -118.42090360895223),
        CLLocationCoordinate2D(latitude: 33.96914561690632, longitude: -118.42076982238542),
        CLLocationCoordinate2D(latitude: 33.96903884278894, longitude: -118.42063034751568),
        CLLocationCoordinate2D(latitude: 33.96896098657718, longitude: -118.42073227145892)
    ], count: 4)
    static let whelanLaneOverlay =  MKPolygon(coordinates: [
        CLLocationCoordinate2D(latitude: 33.9727085772252, longitude: -118.41608225743401),
        CLLocationCoordinate2D(latitude: 33.97269439143763, longitude: -118.41588187688339),
        CLLocationCoordinate2D(latitude: 33.97208034722103, longitude: -118.41596984883245),
        CLLocationCoordinate2D(latitude: 33.9720844003327, longitude: -118.4161800040441)
    ], count: 4)
    static let xavierHallOverlay =  MKPolygon(coordinates: [
        CLLocationCoordinate2D(latitude: 33.972467923065395, longitude: -118.41778836514611),
        CLLocationCoordinate2D(latitude: 33.97252513959906, longitude: -118.41763887969879),
        CLLocationCoordinate2D(latitude: 33.972479843179755, longitude: -118.41738302960626),
        CLLocationCoordinate2D(latitude: 33.972355873908825, longitude: -118.41732840992358),
        CLLocationCoordinate2D(latitude: 33.972155615473966, longitude: -118.41708693343178),
        CLLocationCoordinate2D(latitude: 33.972057870114256, longitude: -118.4172594166402)
    ], count: 6)
}

