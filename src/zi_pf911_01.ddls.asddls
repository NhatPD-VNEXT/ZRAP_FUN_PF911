@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Subcontractor Safety Stock'
define root view entity ZI_PF911_01
  as select from zp91101t
  //  association [0..*] to I_ProductText   as _ProductText     on $projection.ProductForEdit = _ProductText.Product
  //  association [0..1] to I_Product       as _Product         on $projection.ProductForEdit = _Product.Product
  //  association [0..1] to I_Plant         as _Plant           on $projection.PlantForEdit = _Plant.Plant
  //  association [0..1] to I_Supplier      as _Supplier        on $projection.SubcontractorForedit = _Supplier.Supplier
  //  association [0..1] to I_User          as _UserCreatedBy   on $projection.CreatedBy = _UserCreatedBy.UserID
  //  association [0..1] to I_User          as _UserChangedBy   on $projection.LastUpdatedBy = _UserChangedBy.UserID
  //  association [0..1] to I_UnitOfMeasure as _UnitOfMeasure   on $projection.BaseUnit = _UnitOfMeasure.UnitOfMeasure
{
      //      @ObjectModel.foreignKey.association: '_Product'
  key product                       as Product,
      //      @ObjectModel.foreignKey.association: '_Plant'
  key plant                         as Plant,
  key subcontractor                 as Subcontractor,
      @Consumption.defaultValue: '20250101'
//  key date_from                     as DateFrom,

      //      @ObjectModel.foreignKey.association: '_Product'
      product                       as ProductForEdit,
      //      @ObjectModel.foreignKey.association: '_Plant'
      plant                         as PlantForEdit,
      subcontractor                 as SubcontractorForedit,
      date_from                     as DateFromForEdit,

      subcontractor_storage_bin     as SubcontractorStorageBin,
      @Semantics.quantity.unitOfMeasure : 'BaseUnit'
      safety_stock_quantity         as SafetyStockQuantity,
      base_unit                     as BaseUnit,
      //      @Semantics.quantity.unitOfMeasure : 'SampleQuantityUnit'
      sample_quantity               as SampleQuantity,
      sample_quantity_unit          as SampleQuantityUnit,
      inspection_index_code         as InspectionIndexCode,
      notes_internal                as NotesInternal,
      @Semantics.user.createdBy: true
      created_by                    as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at                    as CreatedAt,
      @Semantics.user.localInstanceLastChangedBy: true
      last_updated_by               as LastUpdatedBy,
      @Semantics.systemDateTime.lastChangedAt: true
      last_updated_at               as LastUpdatedAt,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_updated_at         as LocalLastUpdatedAt,

      cast('UTC' as abap.char(30) ) as TimeZoneUTC

      //    _association_name // Make association public
      //      _ProductText,
      //      _Product,
      //      _Plant,
      //      _Supplier,
      //      _UserCreatedBy,
      //      _UserChangedBy,
      //      _UnitOfMeasure
}
