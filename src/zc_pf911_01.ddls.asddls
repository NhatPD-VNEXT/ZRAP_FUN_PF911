@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Subcontractor Safety Stock'

@Metadata.allowExtensions: true

define root view entity ZC_PF911_01
  provider contract transactional_query
  as projection on ZI_PF911_01

{
          @UI.hidden: true
  key     Product,
          @UI.hidden: true
  key     Plant,
          @UI.hidden: true
  key     Subcontractor,

          @UI.hidden: true
//  key     DateFrom,

          //          @Consumption.valueHelpDefinition: [
          //            { qualifier: 'ProductStdVH',
          //              entity: { name: 'I_ProductStdVH', element: 'Product' }
          //            },
          //            { qualifier: 'ProductPlantStdVH1',
          //              entity: { name: 'I_ProductPlantStdVH', element: 'Product' },
          //              additionalBinding: [ { element: 'Plant', localElement: 'PlantForEdit' } ]
          //            }
          //          ]
          @EndUserText.label: '{@i18n>Product}'
          @UI.lineItem: [ { position: 10 } ]
          @UI.selectionField: [ { position: 10 } ]
          //          @ObjectModel.text.element: [ 'ProductName' ]
          ProductForEdit,

          //          @Consumption.valueHelpDefinition: [
          //            { qualifier: 'PlantVH',
          //              entity: { name: 'I_PlantStdVH', element: 'Plant' }
          //            },
          //            { qualifier: 'ProductPlantStdVH2',
          //              entity: { name: 'I_ProductPlantStdVH', element: 'Plant' },
          //              additionalBinding: [ { element: 'Product', localElement: 'ProductForEdit' } ]
          //            }
          //          ]
          @EndUserText.label: '{@i18n>Plant}'
          @UI.lineItem: [ { position: 20 } ]
          @UI.selectionField: [ { position: 20 } ]
          //          @ObjectModel.text.element: [ 'PlantName' ]
          PlantForEdit,

          //          @Consumption.valueHelpDefinition: [ { entity: { name: 'I_Supplier_VH', element: 'Supplier' } } ]
          @EndUserText.label: '{@i18n>Subcontractor}'
          @UI.lineItem: [ { position: 30 } ]
          @UI.selectionField: [ { position: 30 } ]
          //          @ObjectModel.text.element: [ 'SupplierName' ]
          SubcontractorForedit,
          DateFromForEdit,

          //          @EndUserText.label: '{@i18n>SubcontractorStorageBin}'
          //          @UI.lineItem: [ { position: 40 } ]
          //          SubcontractorStorageBin,
          //
          //          @EndUserText.label: '{@i18n>SafetyStockQuantity}'
          //          @Semantics.quantity.unitOfMeasure: 'BaseUnit'
          //          @UI.lineItem: [ { position: 50 } ]
          //          SafetyStockQuantity,
          //
          //          @Consumption.valueHelpDefinition: [ { qualifier: 'UnitOfMeasure', entity: { name: 'I_UnitOfMeasureStdVH', element: 'UnitOfMeasure' } },
          //                                              { qualifier: 'ProductUnitsOfMeasure', entity: { name: 'I_ProductUnitsOfMeasure', element: 'AlternativeUnit' },
          //                                                additionalBinding: [ { element: 'Product', localElement: 'ProductForEdit' } ]
          //                                              }
          //                                            ]
          //          @EndUserText.label: '{@i18n>BaseUnit}'
          //          @UI.lineItem: [ { position: 60 } ]
          //          //          @ObjectModel.text.element: [ 'BaseUnitOfMeasureName' ]
          //          BaseUnit,
          //
          //          @EndUserText.label: '{@i18n>SampleQuantity}'
          //          @UI.lineItem: [ { position: 70 } ]
          //          SampleQuantity,
          //
          //          @EndUserText.label: '{@i18n>SampleQuantityUnit}'
          //          @UI.lineItem: [ { position: 80 } ]
          //          //          @Consumption.valueHelpDefinition: [ { qualifier: 'UnitOfMeasure2', entity: { name: 'I_UnitOfMeasureStdVH', element: 'UnitOfMeasure_E' } } ]
          //          SampleQuantityUnit,
          //
          //          @UI.lineItem: [ { position: 90 } ]
          //          InspectionIndexCode,

          //          @EndUserText.label: '{@i18n>ProductTextJA}'
          //          @UI.lineItem: [ { position: 100 } ]
          //          _ProductText[1: Language = 'J'].ProductName as ProductNameJA,
          //
          //          @EndUserText.label: '{@i18n>ProductTextEN}'
          //          @UI.lineItem: [ { position: 110 } ]
          //          _ProductText[1: Language = 'E'].ProductName as ProductNameEN,


          //          @EndUserText.label: '{@i18n>NotesInternal}'
          //          @UI.lineItem: [ { position: 95 } ]
          //          NotesInternal,
          //
          //          @EndUserText.label: '{@i18n>CreatedBy}'
          //          //          @ObjectModel.text.element: [ 'CreatedByDescription' ]
          //          @Consumption.valueHelpDefinition: [{ entity: { name: 'I_BusinessUserVH', element: 'UserID'} }]
          //          CreatedBy,
          //
          //          @EndUserText.label: '{@i18n>CreatedAt}'
          //          @Consumption.filter.selectionType: #INTERVAL
          //          @Semantics.timeZoneReference: 'TimeZoneUTC'
          //          CreatedAt,
          //
          //          @EndUserText.label: '{@i18n>LastUpdatedBy}'
          //          //          @ObjectModel.text.element: [ 'LastUpdatedByDescription' ]
          //          @Consumption.valueHelpDefinition: [{ entity: { name: 'I_BusinessUserVH', element: 'UserID'} }]
          //          LastUpdatedBy,
          //
          //          @EndUserText.label: '{@i18n>LastUpdatedAt}'
          //          @Consumption.filter.selectionType: #INTERVAL
          //          @Semantics.timeZoneReference: 'TimeZoneUTC'
          //          LastUpdatedAt,
          //
          //          @EndUserText.label: '{@i18n>LocalLastUpdatedAt}'
          //          @Consumption.filter.selectionType: #INTERVAL
          //          LocalLastUpdatedAt,
          /* Associations */

          //          @EndUserText.label: 'Created by (Description)'
          //          @UI.hidden: true
          //          _UserCreatedBy.UserDescription              as CreatedByDescription,
          //
          //          @EndUserText.label: 'Last Updated by (Description)'
          //          @UI.hidden: true
          //          _UserChangedBy.UserDescription              as LastUpdatedByDescription,
          //
          //          @UI.hidden: true
          //          _Supplier.SupplierName,

          //          @UI.hidden: true
          //          _Plant.PlantName,

          //          @UI.hidden: true
          //          TimeZoneUTC,

          //          @UI.hidden: true
          //          _ProductText[1: Language = $session.system_language].ProductName,
          //          @UI.hidden: true
          //          _UnitOfMeasure._Text[1:Language = $session.system_language].UnitOfMeasureName as BaseUnitOfMeasureName,


          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_PF911_04'
          @EndUserText.label: 'Hide Key Field'
          @UI.hidden: true
  virtual hideKeyField : abap_boolean

          //          _Plant,
          //          _Product,
          //          //    _ProductText,
          //          _Supplier,
          //          _UserChangedBy,
          //          _UserCreatedBy
}
