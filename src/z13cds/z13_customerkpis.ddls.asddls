@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Uebung 05'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z13_CustomerKPIs
  as select from Z13_TravelWithCustomer

{
  key CustomerId                      as CustomerId,
      CustomerName                    as CustomerName,
      Street                          as street,
      PostalCode                      as PostalCode,
      City                            as City,

      @Semantics.amount.currencyCode:'CurrencyCode'
      sum(TotalPrice + BookingFee)    as TotalRevenue,

      CurrencyCode2                   as CurrencyCode,

      avg(Duration as abap.dec(16,2)) as AverageDuration,

      count(distinct AgencyId)        as NumberOfDifferentAgencies
}

group by
  CustomerId,
  CustomerName,
  Street,
  PostalCode,
  City,
  CurrencyCode2
