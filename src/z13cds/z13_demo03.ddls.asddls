@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo 3: Arithmetic Operators, Cases and Built-In Functions'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z13_Demo03
  as select from /dmo/connection as c
    inner join   /dmo/flight     as f on  c.carrier_id    = f.carrier_id
                                      and c.connection_id = f.connection_id
{
  key c.carrier_id                                                   as CarrierID,
  key c.connection_id                                                as ConnectionID,
      'Hello World'                                                  as CharacterLiteral,
      42                                                             as NumberLiteral,
      0.1                                                            as FltpointNumbers,
      f.seats_max - f.seats_occupied                                 as FreeSeats,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      f.price                                                        as OldPrice,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      f.price * 2                                                    as DoublePrice,
      cast(f.price as abap.fltp) * 1.1                               as NewPrice,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      cast(f.price as abap.dec(16,2)) * cast('1.1' as abap.dec(4,1)) as NewPrice2,
      f.currency_code                                                as CurrencyCode,
      f.seats_occupied                                               as SeatsOccupied,
      f.seats_max                                                    as MaxSeats,
      f.seats_occupied / f.seats_max                                 as OccupancyRate,


      /* Cases */

      c.distance                                                     as Distance,
      c.distance_unit                                                as DistanceUnit,
      case when c.distance < 1000 then 'Kurzstreckenflug'
           when c.distance < 5000 then 'Mittelstreckenflug'
           else 'Langstreckenflug' end                               as DistanceText,
      case f.currency_code when 'EUR' then 'Euro'
                           when 'SGD' then 'Singapur Dollar'
                           when 'USD' then 'US-Dollar'
                           else 'was anderes' end                    as Currency,


      /* Built in Functions */

      division(f.seats_occupied, f.seats_max, 2)                     as OccupancyRate2,
      length('   ')                                                  as SpaceSpaceSpace,
      length('  X')                                                  as SpaceSpaceX,
      length('X  ')                                                  as XSpaceSpace,
      @Semantics.amount.currencyCode: 'CurrencyCode2'
      currency_conversion(amount => f.price,
                          source_currency => f.currency_code,
                          target_currency => cast('EUR' as abap.cuky),
                          exchange_rate_date => f.flight_date)       as ConvertedPrice,
      cast('EUR' as abap.cuky)                                       as CurrencyCode2
      




}
