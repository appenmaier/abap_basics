@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Demo 10: Path Expressions'

define view entity Z054906_Demo10
  as select from Z054906_Demo09

{
  key CarrierId,
  key ConnectionId,

      AirportFromId,
      AirportToId,
      DepartureTime,
      ArrivalTime,
      Distance,
      DistanceUnit,

      _Carrier.name  as CarrierName,

      /* Associations */
      _Flights
}
