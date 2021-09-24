@AbapCatalog.sqlViewName: 'Z06CCUSTTP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: '2.0'
@VDM.viewType: #CONSUMPTION
@Search.searchable: true
@Metadata.allowExtensions: true 
@OData.publish: true

@ObjectModel.transactionalProcessingDelegated: true
@ObjectModel.compositionRoot: true
@ObjectModel.semanticKey: ['CustomerNumber']
@ObjectModel.createEnabled: true
@ObjectModel.updateEnabled: true
@ObjectModel.deleteEnabled: true


define view Z06_C_CUSTOMERTP_NEU as select from DS4_I_CUSTOMERTP 
    association[*] to Z06_C_BOOKINGTP as _Booking 
        on $projection.CustomerGuid = _Booking.CustomerGuid
        {
            key CustomerGuid,
            CustomerNumber,
            Form,
            @Search.defaultSearchElement: true
            @Search.fuzzinessThreshold: 0.8
            CustomerName,
            Street,
           
            PostCode,
            @Search.defaultSearchElement: true
            @Search.fuzzinessThreshold: 0.8
            City,
            Country,
            Email,
            Telephone,
            Discount,
            
            
            //Associations
             @ObjectModel.association.type: [#TO_COMPOSITION_CHILD]
            _Booking

        }
