@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo 06: Outer Joins'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z13_DEMO06
  as select from /dmo/connection as c
    left outer join   /dmo/carrier    as a on c.carrier_id = a.carrier_id
    left outer join   /dmo/flight     as f on  f.carrier_id    = c.carrier_id
                                      and f.connection_id = c.connection_id
{
  key a.carrier_id      as CarrierId,
  key c.carrier_id      as CarrierId2,
  key c.connection_id   as ConnectionId,
  key f.carrier_id      as CarrierId3,
  key f.connection_id   as ConnectionId2,
  key f.flight_date     as FlightDate,
      a.name            as Name,
      c.airport_from_id as AirportFromId,
      c.airport_to_id   as AirportToId
}

