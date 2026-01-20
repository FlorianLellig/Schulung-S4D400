@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo 5: Aggregation Functions'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z13_Demo05
  as select from /dmo/flight
{
  key carrier_id                                                        as CarrierId,
      count(*)                                                          as NumberOfFlights, //Zählt die Anzahl aller Flüge
      count(distinct plane_type_id)                                     as NumberOfDifferentPlaneTypeIds, //Doppelungen der Flugzeugtypen filtern
      max(seats_occupied)                                               as MaxOccupiedSeats,
      min(seats_occupied)                                               as MinOccupiedSeats,
      sum(seats_occupied)                                               as TotalOccupiedSeats,

      sum(case when seats_occupied / seats_max > 0.7 then 1 else 0 end) as NumberOfMostlyBookedUpFlights, //Anzahl der über 70Prozent ausgebuchten Flüge
      sum(case when seats_occupied = 0 then 1 else 0 end)               as NumberOfEmptyFlights,
      avg(seats_occupied as abap.dec(16,1))                             as AverageOccupied,

      @Semantics.amount.currencyCode:'CurrencyCode'
      avg(price as abap.curr(16,2))                                     as AverageFlightPrices,
      currency_code                                                     as CurrencyCode
}

group by
  carrier_id,
  currency_code
  
having avg(price as abap.curr(16,2)) < 5000
