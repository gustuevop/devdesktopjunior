object DmConexao: TDmConexao
  Height = 480
  Width = 640
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=TspdCep'
      'User_Name=postgres'
      'Password=postgres'
      'DriverID=PG')
    Connected = True
    Left = 144
    Top = 152
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 'C:\Program Files (x86)\psqlODBC\1700\bin\libpq.dll'
    Left = 256
    Top = 160
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from TspdCep;')
    Left = 408
    Top = 176
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 512
    Top = 208
  end
end
