object DmDados: TDmDados
  Height = 318
  Width = 485
  PixelsPerInch = 120
  object FDPhysFBDriverLink: TFDPhysFBDriverLink
    Left = 240
    Top = 80
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 91
    Top = 120
  end
  object FDTransacao: TFDTransaction
    Connection = FDConnection
    Left = 266
    Top = 180
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=C:\PostoABC\DataBase\DATABASE.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Transaction = FDTransacao
    Left = 96
    Top = 24
  end
end
