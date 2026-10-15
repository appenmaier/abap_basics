@AbapCatalog.viewEnhancementCategory: [ #PROJECTION_LIST ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Demo 2: Inner Joins'

define view entity Z054906_Demo02
  as select from /dmo/connection as Connection

    inner join   /dmo/carrier    as Carrier
      on Connection.carrier_id = Carrier.carrier_id

    inner join   /dmo/flight     as flight
      on  Connection.carrier_id    = Carrier.carrier_id
      and Connection.connection_id = flight.connection_id

{
  key flight.carrier_id          as CarrierId,
  key flight.connection_id       as ConnectionId,
  key flight.flight_date         as FlightDate,

      Carrier.name               as Name,
      Connection.airport_from_id as AirportFromId,
      Connection.airport_to_id   as AirportToId,
      Connection.departure_time  as DepartureTime,
      Connection.arrival_time    as ArrivalTime,
      Connection.distance        as Distance,
      Connection.distance_unit   as DistanceUnit,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight.price               as Price,

      flight.currency_code       as CurrencyCode,
      flight.plane_type_id       as PlaneTypeId,
      flight.seats_max           as SeatsMax,
      flight.seats_occupied      as SeatsOccupied
}
