@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Demo 7: Outer Joins and Union'

@Metadata.ignorePropagatedAnnotations: true

define view entity Z054906_Demo07
  as select from    /dmo/connection as Connection

    left outer join /dmo/carrier    as Carrier    on Connection.carrier_id = Carrier.carrier_id

{
  key Connection.carrier_id      as CarrierId,
  key Connection.connection_id   as ConnectionId,

      Connection.airport_from_id as AirportFromId,
      Connection.airport_to_id   as AirportToId,
      Connection.departure_time  as DepartureTime,
      Connection.arrival_time    as ArrivalTime,
      Connection.distance        as Distance,
      Connection.distance_unit   as DistanceUnit,
      Carrier.name               as Name
}

union
  select from        /dmo/connection as Connection

    right outer join /dmo/carrier    as Carrier    on Connection.carrier_id = Carrier.carrier_id

{
  key Connection.carrier_id      as CarrierId,
  key Connection.connection_id   as ConnectionId,


      Connection.airport_from_id as AirportFromId,
      Connection.airport_to_id   as AirportToId,
      Connection.departure_time  as DepartureTime,
      Connection.arrival_time    as ArrivalTime,
      Connection.distance        as Distance,
      Connection.distance_unit   as DistanceUnit,
      Carrier.name               as Name
}
