object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Teste Extra Digital'
  ClientHeight = 201
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 40
    Top = 48
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object Empresa1: TMenuItem
        Caption = 'Empresa'
        OnClick = Empresa1Click
      end
    end
  end
end
