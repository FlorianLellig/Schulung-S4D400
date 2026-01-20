@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ABAP CDS 07'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z13_CUSTOMERWITHTRAVELS as select from Z13_Customer
  association [0..*] to Z13_Travel as _Travels on  $projection.CustomerID = _Travels.CustomerId
{
  key CustomerId as CustomerID,
  FirstName as FirstName,
  LastName as LasName,
  Title as Title,
  Street as Street,
  PostalCode as PostalCode,
  City as City,
  
  /* Associations */
  _Travels
}

where CountryCode = 'DE'
