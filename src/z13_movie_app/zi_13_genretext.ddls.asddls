@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'GenreText'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_13_GenreText as select from zabap_movie_a as m

inner join   DDCDS_CUSTOMER_DOMAIN_VALUE_T( p_domain_name: 'ZABAP_GENRE' ) as Genre
      on  Genre.value_low   = m.genre
{
  m.genre as Kuerzel,
  Genre.text as Langweise
}

group by
  m.genre,
  Genre.text
