extend view entity Z054906_Demo02 with

  association [1..1] to /dmo/airport as _ZZAirportFrom on $projection.AirportFromId = _ZZAirportFrom.airport_id
  association [1..1] to /dmo/airport as _ZZAirportTo on $projection.AirportToId = _ZZAirportTo.airport_id

{
  Carrier.currency_code as ZZCCarrierCurrencyCode,

  /* Associations */
  _ZZAirportFrom,
  _ZZAirportTo
}
