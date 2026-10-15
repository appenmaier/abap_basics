@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Demo 3: Cases and Arithemtic Expressions'

define view entity Z054906_Demo03
  as select from /dmo/flight

{
  key carrier_id                     as CarrierId,
  key connection_id                  as ConnectionId,
  key flight_date                    as FlightDate,

      /* Literals */
      42                             as IntLiteral,
      0.1                            as FltpLiteral,
      'Hello World'                  as StringLiteral,

      /* Arithmetic Expressions */
      5 + 3                          as Addition,
      5 - 3                          as Subtraction,
      5 * 5                          as Multiplication,
      5 / 3                          as Division,

      /* Cases */
      seats_max                      as MaxSeats,
      seats_occupied                 as OccupiedSeats,

      case when seats_occupied / seats_max > 0.8 then 'X'
           else ''
      end                            as IsMostlyBookedUp,

      plane_type_id                  as PlaneTypeId,

      case plane_type_id when 'A380-800' then 'Airbus'
                         when 'A340-600' then 'Airbus'
                         when 'A321-200' then 'Airbus'
                         when 'A320-200' then 'Airbus'
                         when '737-800' then 'Boeing'
                         when '747-400' then 'Boeing'
                         when '767-200' then 'Boeing'
                         else ''
      end                            as Manufacturer,

      /* Casts */
      cast(2 as abap.dec(16,2))      as FixedPointNumber,
      ' LH'                          as CarrierId1,
      cast(' LH' as /dmo/carrier_id) as CarrierId2
}
