object frm_consultaCep: Tfrm_consultaCep
  Left = 715
  Top = 312
  Caption = 'Consulta CEP'
  ClientHeight = 438
  ClientWidth = 413
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  TextHeight = 15
  object lbl_buscarCep: TLabel
    Left = 8
    Top = 11
    Width = 59
    Height = 15
    Caption = 'Buscar CEP'
  end
  object edt_consultarCep: TEdit
    Left = 8
    Top = 32
    Width = 297
    Height = 23
    TabOrder = 0
  end
  object btn_buscar: TButton
    Left = 328
    Top = 32
    Width = 75
    Height = 23
    Caption = 'Buscar'
    TabOrder = 1
    OnClick = btn_buscarClick
  end
  object gb_dadosEndereco: TGroupBox
    Left = 8
    Top = 61
    Width = 395
    Height = 368
    Caption = 'Endere'#231'o'
    TabOrder = 2
    object lbl_cep: TLabel
      Left = 16
      Top = 24
      Width = 21
      Height = 15
      Caption = 'CEP'
    end
    object lbl_logradouro: TLabel
      Left = 16
      Top = 72
      Width = 62
      Height = 15
      Caption = 'Logradouro'
    end
    object lbl_complemento: TLabel
      Left = 16
      Top = 120
      Width = 77
      Height = 15
      Caption = 'Complemento'
    end
    object lbl_bairro: TLabel
      Left = 16
      Top = 170
      Width = 31
      Height = 15
      Caption = 'Bairro'
    end
    object lbl_localidade: TLabel
      Left = 16
      Top = 220
      Width = 57
      Height = 15
      Caption = 'Localidade'
    end
    object lbl_uf: TLabel
      Left = 16
      Top = 268
      Width = 14
      Height = 15
      Caption = 'UF'
    end
    object lbl_ibge: TLabel
      Left = 84
      Top = 268
      Width = 24
      Height = 15
      Caption = 'IBGE'
    end
    object lbl_gia: TLabel
      Left = 152
      Top = 268
      Width = 19
      Height = 15
      Caption = 'GIA'
    end
    object lbl_ddd: TLabel
      Left = 220
      Top = 268
      Width = 24
      Height = 15
      Caption = 'DDD'
    end
    object lbl_siafi: TLabel
      Left = 288
      Top = 268
      Width = 26
      Height = 15
      Caption = 'SIAFI'
    end
    object edt_cep: TEdit
      Left = 16
      Top = 45
      Width = 297
      Height = 23
      TabOrder = 0
    end
    object edt_logradouro: TEdit
      Left = 16
      Top = 93
      Width = 297
      Height = 23
      TabOrder = 1
    end
    object edt_complemento: TEdit
      Left = 16
      Top = 141
      Width = 297
      Height = 23
      TabOrder = 2
    end
    object edt_bairro: TEdit
      Left = 16
      Top = 191
      Width = 297
      Height = 23
      TabOrder = 3
    end
    object edt_localidade: TEdit
      Left = 16
      Top = 239
      Width = 297
      Height = 23
      TabOrder = 4
    end
    object edt_uf: TEdit
      Left = 16
      Top = 289
      Width = 62
      Height = 23
      TabOrder = 5
    end
    object edt_ibge: TEdit
      Left = 84
      Top = 289
      Width = 62
      Height = 23
      TabOrder = 6
    end
    object edt_gia: TEdit
      Left = 152
      Top = 289
      Width = 62
      Height = 23
      TabOrder = 7
    end
    object edt_ddd: TEdit
      Left = 220
      Top = 289
      Width = 62
      Height = 23
      TabOrder = 8
    end
    object edt_siafi: TEdit
      Left = 288
      Top = 289
      Width = 62
      Height = 23
      TabOrder = 9
    end
  end
end
