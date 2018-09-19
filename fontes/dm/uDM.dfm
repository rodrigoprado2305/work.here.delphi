object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 213
  Width = 239
  object FDConnection: TFDConnection
    Params.Strings = (
      
        'Database=D:\Desenvolvimento\Prova Delphi\nfeExemplo\BD\AZDATABAS' +
        'E.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=FB')
    LoginPrompt = False
    Left = 56
    Top = 32
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 56
    Top = 88
  end
  object FDPhysFBDriverLink: TFDPhysFBDriverLink
    OnDriverCreated = FDPhysFBDriverLinkDriverCreated
    Left = 56
    Top = 144
  end
  object qryAux: TFDQuery
    Connection = FDConnection
    Left = 152
    Top = 32
  end
  object qryPesq: TFDQuery
    Connection = FDConnection
    Left = 152
    Top = 88
  end
  object cdsRest: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 151
    Top = 144
  end
end
