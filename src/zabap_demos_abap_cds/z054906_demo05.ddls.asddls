@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Demo 5: Domain Fixed Values'

define view entity Z054906_Demo05
  as select from /dmo/supplement                               as Supplement

    inner join   DDCDS_CUSTOMER_DOMAIN_VALUE_T(
                   p_domain_name : '/DMO/SUPPLEMENT_CATEGORY') as Category
      on  Supplement.supplement_category = Category.value_low
      and Category.language              = $session.system_language

{
  key Supplement.supplement_id       as SupplementId,

      Supplement.supplement_category as SupplementCategory,

      @EndUserText.label: 'Supplemenet Category Text'
      @EndUserText.quickInfo: 'Supplemenet Category Text'
      Category.text                  as SupplementCategoryText
}
