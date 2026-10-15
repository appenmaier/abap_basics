@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Demo 1: Projections and Selections'

define view entity Z054906_Demo01 // Name of View Entity
  as select from /dmo/connection

{
      /* Key Fields */
  key carrier_id      as CarrierId,
  key connection_id   as ConnectionId,

      /* Fields */
      airport_from_id as AirportFromId,
      airport_to_id   as AirportToId,
      departure_time  as DepartureTime,
      arrival_time    as ArrivalTime,
      distance        as Distance,
      distance_unit   as DistanceUnit
}

where
  distance >= 1000
