@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ValueHelp for Customer'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_13_CustomerVH
  as select from /dmo/customer
{
  key customer_id   as CustomerId,
      first_name    as FirstName,
      last_name     as LastName,
      title         as Title,
      street        as Street,
      postal_code   as PostalCode,
      city          as City,
      country_code  as CountryCode,
      phone_number  as PhoneNumber,
      email_address as EmailAddress
}
