object DmConexao: TDmConexao
  OldCreateOrder = False
  Height = 150
  Width = 215
  object FDConn: TFDConnection
    Params.Strings = (
      'DriverID=FB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Database=C:\TESTE EXTRADIGITAL\BASE\DADOS.FDB')
    Connected = True
    LoginPrompt = False
    Left = 80
    Top = 64
  end
end
