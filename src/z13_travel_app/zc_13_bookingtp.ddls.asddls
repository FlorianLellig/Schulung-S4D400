@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking'

define view entity ZC_13_BookingTP
  as projection on ZR_13_BookingTP
{
  key TravelId,
  key BookingId,
      BookingDate,
      CustomerId,
      CarrierId,
      ConnectionId,
      FlightDate,
      FlightPrice,
      CurrencyCode,
      
      /* Associations */
      _Travel : redirected to parent ZC_13_TravelTP
}
