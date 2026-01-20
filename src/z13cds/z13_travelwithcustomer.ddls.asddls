@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel with customer View'

define view entity Z13_TravelWithCustomer
  as select from /dmo/travel                                                   as t
    inner join   /dmo/customer                                                 as c on t.customer_id = c.customer_id
    inner join   DDCDS_CUSTOMER_DOMAIN_VALUE_T( p_domain_name:  '/DMO/STATUS') as s on  s.value_low = t.status
                                                                                    and s.language  = $session.system_language
{
  key t.travel_id                                                                    as TravelId,
      t.agency_id                                                                    as AgencyId,
      t.customer_id                                                                  as CustomerId,
      t.begin_date                                                                   as BeginDate,
      t.end_date                                                                     as EndDate,
      @EndUserText.label: 'Daration'
      @EndUserText.quickInfo: 'Duration'
      dats_days_between(t.begin_date, t.end_date) + 1                                as Duration,

      @Semantics.amount.currencyCode: 'CurrencyCode2'
      currency_conversion(amount => t.booking_fee,
                          source_currency => t.currency_code,
                          target_currency => cast('EUR' as abap.cuky),          //DATUM FALSCH
                          exchange_rate_date => $session.system_date)                as BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode2'
      currency_conversion(amount => t.total_price,
                          source_currency => t.currency_code,
                          target_currency => cast('EUR' as abap.cuky),      //DATUM FALSCH
                          exchange_rate_date => $session.system_date)                as TotalPrice,
      cast('EUR' as abap.cuky)                                                       as CurrencyCode2,
      t.description                                                                  as Description,
      s.text                                                                         as StatusText,
      concat_with_space(concat_with_space(c.title, c.first_name, 1), c.last_name, 1) as CustomerName,
      c.street                                                                       as Street,
      c.postal_code                                                                  as PostalCode,
      c.city                                                                         as City
}

where
  c.country_code = 'DE'
