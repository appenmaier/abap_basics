@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Demo 9: Associations'

define view entity Z054906_Demo09
  as select from /dmo/connection

  association [1] to    /dmo/carrier as _Carrier
    on $projection.CarrierId = _Carrier.carrier_id

  association [0..*] to /dmo/flight  as _Flights
    on  $projection.CarrierId    = _Flights.carrier_id
    and $projection.ConnectionId = _Flights.connection_id

{
  key carrier_id      as CarrierId,
  key connection_id   as ConnectionId,

      airport_from_id as AirportFromId,
      airport_to_id   as AirportToId,
      departure_time  as DepartureTime,
      arrival_time    as ArrivalTime,
      distance        as Distance,
      distance_unit   as DistanceUnit,

      /* Associations */
      _Carrier,
      _Flights
}
