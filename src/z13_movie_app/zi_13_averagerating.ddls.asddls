@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Average Rating View'
define view entity ZI_13_AverageRating
  as select from zabap_rating_a
{
  
      movie_uuid as movie_uuid,

      avg(rating as abap.dec(16, 2)) as AverageRating,

      case
        when avg(rating as abap.dec(16, 2)) > 6.7 then 3
        when avg(rating as abap.dec(16, 2)) > 3.4 then 2
        when avg(rating as abap.dec(16, 2)) > 0   then 1
        else 0
        end                          as AverageRatingCriticality

}

group by
  movie_uuid
