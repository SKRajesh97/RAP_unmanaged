@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Travel BO View'

define root view entity ZI_RAP_TRAVEL1_1234
  as select from zrap_atrav1_1234 as Travel

  composition [0..*] of ZI_RAP_Booking1_1234 as _Booking

  association [0..1] to /DMO/I_Agency        as _Agency   on $projection.AgencyId = _Agency.AgencyID
  association [0..1] to /DMO/I_Customer      as _Customer on $projection.CustomerId = _Customer.CustomerID
  association [0..1] to I_Currency           as _Currency on $projection.CurrencyCode = _Currency.Currency
{
  key travel_uuid           as TravelUuid,
      travel_id             as TravelId,
      agency_id             as AgencyId,
      customer_id           as CustomerId,
      begin_date            as BeginDate,
      end_date              as EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      booking_fee           as BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      total_price           as TotalPrice,
      currency_code         as CurrencyCode,
      description           as Description,
      overall_status        as OverallStatus,
      @Semantics.user.createdBy: true
      created_by            as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at            as CreatedAt,
      @Semantics.user.lastChangedBy: true
      last_changed_by       as LastChangedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,

      _Booking,
      _Agency,
      _Customer,
      _Currency
}
