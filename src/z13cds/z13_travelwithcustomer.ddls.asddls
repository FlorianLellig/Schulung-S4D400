@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel with customer View'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z13_TravelWithCustomer
  as select from /dmo/travel   as t
    inner join   /dmo/customer as c on t.customer_id = c.customer_id
{
  key c.customer_id as CustomerId,
  key t.travel_id as TravelId,
  t.agency_id as AgencyId,
  t.customer_id as CustomerId2,
  t.begin_date as BeginDate,
  t.end_date as EndDate,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  t.booking_fee as BookingFee,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  t.total_price as TotalPrice,
  t.currency_code as CurrencyCode,
  t.description as Description,
  t.status as Status,
  c.first_name as FirstName,
  c.last_name as LastName,
  c.title as Title,
  c.street as Street,
  c.postal_code as PostalCode,
  c.city as City
}

where c.country_code = 'DE'
