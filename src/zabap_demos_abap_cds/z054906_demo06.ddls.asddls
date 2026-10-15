@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Demo 6: Aggregat Functions'

define view entity Z054906_Demo06
  as select from /dmo/flight

{
  key carrier_id                                                        as CarrierId,
  key connection_id                                                     as ConnectionId,

      count(*)                                                          as Flights,
      count(distinct plane_type_id)                                     as DifferentPlaneTypeIds,
      sum(seats_occupied)                                               as TotalOccupiedSeats,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      avg(price as abap.curr(16,2))                                     as AveragePrice,

      currency_code                                                     as CurrencyCode,
      min(seats_occupied)                                               as MinOccupiedSeats,
      max(seats_occupied)                                               as MaxOccupiedSeats,
      sum(case when seats_occupied / seats_max > 0.8 then 1 else 0 end) as MostlyBookedUpFlights
}

group by carrier_id,
         connection_id,
         currency_code

having sum(seats_occupied) > 333
