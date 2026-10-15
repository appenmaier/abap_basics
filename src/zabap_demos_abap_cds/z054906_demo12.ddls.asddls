@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #MANDATORY
@EndUserText.label: 'Demo 12: Access Controls'
define view entity Z054906_Demo12
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
