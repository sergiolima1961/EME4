object fCadCliente: TfCadCliente
  Left = 0
  Top = 0
  Caption = 'Cadastro de Cliente'
  ClientHeight = 459
  ClientWidth = 744
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl2: TPageControl
    Left = 0
    Top = 0
    Width = 744
    Height = 459
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 662
    object TabSheet1: TTabSheet
      Caption = 'Detalhe'
      ExplicitWidth = 654
      object GroupBox2: TGroupBox
        Left = 0
        Top = 0
        Width = 736
        Height = 431
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 654
        object Panel2: TPanel
          Left = 2
          Top = 44
          Width = 732
          Height = 213
          Align = alTop
          TabOrder = 0
          ExplicitTop = 42
          object Label2: TLabel
            Left = 50
            Top = 20
            Width = 25
            Height = 13
            Caption = 'CNPJ'
            FocusControl = DBEdit2
          end
          object Label1: TLabel
            Left = 19
            Top = 44
            Width = 60
            Height = 13
            Caption = 'Raz'#227'o Social'
            FocusControl = DBEdit1
          end
          object Label3: TLabel
            Left = 31
            Top = 73
            Width = 47
            Height = 13
            Caption = 'Fantansia'
            FocusControl = DBEdit3
          end
          object Label4: TLabel
            Left = 2
            Top = 98
            Width = 83
            Height = 13
            Caption = 'Natureza Juridica'
            FocusControl = DBEdit4
          end
          object Label12: TLabel
            Left = -6
            Top = 126
            Width = 87
            Height = 13
            Caption = 'Ultima Atualizacao'
          end
          object Label13: TLabel
            Left = 237
            Top = 124
            Width = 67
            Height = 13
            Caption = 'Data Situa'#231#227'o'
            FocusControl = DBEdit13
          end
          object Label14: TLabel
            Left = 15
            Top = 156
            Width = 63
            Height = 13
            Caption = 'capital_social'
            FocusControl = DBEdit14
          end
          object Label15: TLabel
            Left = 271
            Top = 155
            Width = 26
            Height = 13
            Caption = 'porte'
            FocusControl = DBEdit15
          end
          object Label17: TLabel
            Left = 453
            Top = 126
            Width = 42
            Height = 13
            Caption = 'abertura'
            FocusControl = DBEdit16
          end
          object Label18: TLabel
            Left = 55
            Top = 182
            Width = 24
            Height = 13
            Caption = 'email'
            FocusControl = DBEdit17
          end
          object Label19: TLabel
            Left = 456
            Top = 184
            Width = 40
            Height = 13
            Caption = 'telefone'
            FocusControl = DBEdit18
          end
          object DBEdit2: TDBEdit
            Left = 88
            Top = 15
            Width = 158
            Height = 21
            DataField = 'numero_fiscal'
            DataSource = DS_CLIENTE
            TabOrder = 0
            OnKeyPress = DBEdit2KeyPress
          end
          object Button6: TButton
            Left = 280
            Top = 11
            Width = 89
            Height = 25
            Caption = 'Consulta CNPJ'
            Enabled = False
            TabOrder = 1
            OnClick = Button6Click
          end
          object DBEdit1: TDBEdit
            Left = 88
            Top = 42
            Width = 540
            Height = 21
            DataField = 'nome'
            DataSource = DS_CLIENTE
            TabOrder = 2
          end
          object DBEdit3: TDBEdit
            Left = 88
            Top = 70
            Width = 540
            Height = 21
            DataField = 'fantansia'
            DataSource = DS_CLIENTE
            TabOrder = 3
          end
          object DBEdit4: TDBEdit
            Left = 88
            Top = 97
            Width = 194
            Height = 21
            DataField = 'natureza_juridica'
            DataSource = DS_CLIENTE
            TabOrder = 4
          end
          object DBEdit13: TDBEdit
            Left = 311
            Top = 125
            Width = 134
            Height = 21
            DataField = 'data_situacao'
            DataSource = DS_CLIENTE
            TabOrder = 5
          end
          object DBEdit14: TDBEdit
            Left = 88
            Top = 155
            Width = 134
            Height = 21
            DataField = 'capital_social'
            DataSource = DS_CLIENTE
            TabOrder = 6
          end
          object DBEdit15: TDBEdit
            Left = 310
            Top = 153
            Width = 200
            Height = 21
            DataField = 'porte'
            DataSource = DS_CLIENTE
            TabOrder = 7
          end
          object DBEdit16: TDBEdit
            Left = 501
            Top = 126
            Width = 134
            Height = 21
            DataField = 'abertura'
            DataSource = DS_CLIENTE
            TabOrder = 8
          end
          object DBEdit17: TDBEdit
            Left = 88
            Top = 182
            Width = 360
            Height = 21
            DataField = 'email'
            DataSource = DS_CLIENTE
            TabOrder = 9
          end
          object DBEdit12: TDBEdit
            Left = 88
            Top = 126
            Width = 134
            Height = 21
            DataField = 'ultima_atualizacao'
            DataSource = DS_CLIENTE
            TabOrder = 10
          end
          object DBCheckBox1: TDBCheckBox
            Left = 392
            Top = 14
            Width = 97
            Height = 17
            Caption = 'status'
            DataField = 'status'
            DataSource = DS_CLIENTE
            TabOrder = 11
          end
          object DBEdit18: TDBEdit
            Left = 501
            Top = 180
            Width = 134
            Height = 21
            DataField = 'telefone'
            DataSource = DS_CLIENTE
            TabOrder = 12
          end
        end
        object Panel1: TPanel
          Left = 2
          Top = 15
          Width = 732
          Height = 29
          Align = alTop
          BevelInner = bvLowered
          Caption = 'Panel1'
          ShowCaption = False
          TabOrder = 1
          ExplicitWidth = 650
          object Label16: TLabel
            Left = 398
            Top = 8
            Width = 52
            Height = 13
            Caption = '0000/0000'
          end
          object Button1: TButton
            Left = 2
            Top = 2
            Width = 56
            Height = 25
            Align = alLeft
            Caption = 'Novo'
            TabOrder = 0
            OnClick = Button1Click
          end
          object Button2: TButton
            Left = 226
            Top = 2
            Width = 56
            Height = 25
            Align = alLeft
            Caption = 'Cancelar'
            Enabled = False
            TabOrder = 1
            OnClick = Button2Click
            ExplicitLeft = 232
            ExplicitTop = -2
          end
          object Button3: TButton
            Left = 170
            Top = 2
            Width = 56
            Height = 25
            Align = alLeft
            Caption = 'Gravar'
            Enabled = False
            TabOrder = 2
            OnClick = Button3Click
            ExplicitLeft = 164
            ExplicitTop = -2
          end
          object Button4: TButton
            Left = 58
            Top = 2
            Width = 56
            Height = 25
            Align = alLeft
            Caption = 'Editar'
            TabOrder = 3
            OnClick = Button4Click
            ExplicitLeft = 52
            ExplicitTop = -2
          end
          object Button5: TButton
            Left = 114
            Top = 2
            Width = 56
            Height = 25
            Align = alLeft
            Caption = 'Excluir'
            TabOrder = 4
            OnClick = Button5Click
          end
        end
        object GroupBox1: TGroupBox
          Left = 2
          Top = 257
          Width = 732
          Height = 134
          Align = alTop
          Caption = 'Endere'#231'o'
          TabOrder = 2
          ExplicitWidth = 650
          object Label5: TLabel
            Left = 46
            Top = 16
            Width = 19
            Height = 13
            Caption = 'CEP'
            FocusControl = DBEdit5
          end
          object Label6: TLabel
            Left = 45
            Top = 43
            Width = 19
            Height = 13
            Caption = 'Rua'
            FocusControl = DBEdit6
          end
          object Label7: TLabel
            Left = 46
            Top = 71
            Width = 29
            Height = 13
            Caption = 'Compl'
            FocusControl = DBEdit7
          end
          object Label8: TLabel
            Left = 546
            Top = 44
            Width = 37
            Height = 13
            Caption = 'Numero'
            FocusControl = DBEdit8
          end
          object Label9: TLabel
            Left = 332
            Top = 71
            Width = 28
            Height = 13
            Caption = 'Bairro'
            FocusControl = DBEdit9
          end
          object Label10: TLabel
            Left = 46
            Top = 104
            Width = 33
            Height = 13
            Caption = 'Cidade'
            FocusControl = DBEdit10
          end
          object Label11: TLabel
            Left = 551
            Top = 104
            Width = 40
            Height = 13
            Caption = 'ESTADO'
            FocusControl = DBEdit11
          end
          object DBEdit5: TDBEdit
            Left = 84
            Top = 14
            Width = 92
            Height = 21
            DataField = 'CEP'
            DataSource = DS_CLIENTE
            TabOrder = 0
            OnKeyPress = DBEdit11KeyPress
          end
          object DBEdit6: TDBEdit
            Left = 84
            Top = 41
            Width = 456
            Height = 21
            CharCase = ecUpperCase
            DataField = 'LOGRADOURO'
            DataSource = DS_CLIENTE
            ReadOnly = True
            TabOrder = 2
          end
          object DBEdit7: TDBEdit
            Left = 84
            Top = 69
            Width = 214
            Height = 21
            DataField = 'COMPLEMENTO'
            DataSource = DS_CLIENTE
            TabOrder = 3
          end
          object DBEdit8: TDBEdit
            Left = 602
            Top = 40
            Width = 61
            Height = 21
            DataField = 'NUMERO'
            DataSource = DS_CLIENTE
            TabOrder = 1
          end
          object DBEdit9: TDBEdit
            Left = 378
            Top = 69
            Width = 250
            Height = 21
            CharCase = ecUpperCase
            DataField = 'BAIRRO'
            DataSource = DS_CLIENTE
            ReadOnly = True
            TabOrder = 4
          end
          object DBEdit10: TDBEdit
            Left = 85
            Top = 96
            Width = 434
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CIDADE'
            DataSource = DS_CLIENTE
            ReadOnly = True
            TabOrder = 5
          end
          object DBEdit11: TDBEdit
            Left = 600
            Top = 101
            Width = 30
            Height = 21
            CharCase = ecUpperCase
            DataField = 'ESTADO'
            DataSource = DS_CLIENTE
            ReadOnly = True
            TabOrder = 6
          end
          object Button_Buscar_Cep: TButton
            Left = 209
            Top = 10
            Width = 89
            Height = 25
            Caption = 'Buscar CEP'
            Enabled = False
            TabOrder = 7
            OnClick = Button_Buscar_CepClick
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Visualia'#231#227'o'
      ImageIndex = 1
      ExplicitWidth = 654
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 736
        Height = 431
        Align = alClient
        DataSource = DS_CLIENTE
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
  end
  object DS_CLIENTE: TDataSource
    AutoEdit = False
    DataSet = DM_DB.FvCliente
    OnDataChange = DS_CLIENTEDataChange
    Left = 576
    Top = 48
  end
  object XMLDocument1: TXMLDocument
    FileName = 'http://www.receitaws.com.br/v1/cnpj/00650512000101'
    Left = 575
    Top = 97
  end
end
