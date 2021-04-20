object FCadUsuario: TFCadUsuario
  Left = 0
  Top = 0
  Caption = 'Cadastro de Usuario'
  ClientHeight = 464
  ClientWidth = 527
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
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 612
    Height = 464
    Align = alLeft
    AutoSize = True
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = 56
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 610
      Height = 32
      Align = alTop
      BevelInner = bvLowered
      Caption = 'Panel1'
      ShowCaption = False
      TabOrder = 0
      ExplicitTop = 0
      object Label16: TLabel
        Left = 360
        Top = 8
        Width = 52
        Height = 13
        Caption = '0000/0000'
      end
      object Button1: TButton
        Left = 2
        Top = 2
        Width = 48
        Height = 28
        Align = alLeft
        Caption = 'Novo'
        TabOrder = 0
        OnClick = Button1Click
        ExplicitLeft = 64
        ExplicitTop = 3
        ExplicitHeight = 25
      end
      object Button2: TButton
        Left = 202
        Top = 2
        Width = 48
        Height = 28
        Align = alLeft
        Caption = 'Cancelar'
        Enabled = False
        TabOrder = 1
        OnClick = Button2Click
        ExplicitLeft = 226
        ExplicitTop = 8
      end
      object Button3: TButton
        Left = 154
        Top = 2
        Width = 48
        Height = 28
        Align = alLeft
        Caption = 'Gravar'
        Enabled = False
        TabOrder = 2
        OnClick = Button3Click
        ExplicitLeft = 160
      end
      object Button4: TButton
        Left = 50
        Top = 2
        Width = 48
        Height = 28
        Align = alLeft
        Caption = 'Editar'
        TabOrder = 3
        OnClick = Button4Click
        ExplicitLeft = 34
      end
      object Button5: TButton
        Left = 98
        Top = 2
        Width = 56
        Height = 28
        Align = alLeft
        Caption = 'Desativar'
        TabOrder = 4
        OnClick = Button5Click
        ExplicitLeft = 90
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 33
      Width = 610
      Height = 157
      Align = alTop
      TabOrder = 1
      ExplicitLeft = 0
      ExplicitTop = 37
      object Label2: TLabel
        Left = 7
        Top = 55
        Width = 36
        Height = 13
        Caption = 'Usuario'
        FocusControl = DBEdit2
      end
      object Label1: TLabel
        Left = 16
        Top = 24
        Width = 11
        Height = 13
        Caption = 'ID'
      end
      object Label3: TLabel
        Left = 16
        Top = 79
        Width = 25
        Height = 13
        Caption = 'Login'
        FocusControl = DBEdit3
      end
      object Label4: TLabel
        Left = 13
        Top = 108
        Width = 30
        Height = 13
        Caption = 'Senha'
        FocusControl = DBEdit4
      end
      object DBEdit2: TDBEdit
        Left = 49
        Top = 48
        Width = 400
        Height = 21
        CharCase = ecUpperCase
        DataField = 'Usuario'
        DataSource = dsUsuario
        TabOrder = 1
      end
      object DBEdit1: TDBEdit
        Left = 49
        Top = 21
        Width = 49
        Height = 21
        DataField = 'ID'
        DataSource = dsUsuario
        TabOrder = 0
      end
      object DBEdit3: TDBEdit
        Left = 49
        Top = 77
        Width = 264
        Height = 21
        CharCase = ecUpperCase
        DataField = 'Login'
        DataSource = dsUsuario
        TabOrder = 2
      end
      object DBEdit4: TDBEdit
        Left = 49
        Top = 104
        Width = 264
        Height = 21
        DataField = 'Senha'
        DataSource = dsUsuario
        TabOrder = 3
      end
      object DBCheckBox1: TDBCheckBox
        Left = 50
        Top = 134
        Width = 97
        Height = 17
        Caption = 'Situacao'
        DataField = 'STATUS'
        DataSource = dsUsuario
        TabOrder = 4
      end
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 190
      Width = 610
      Height = 273
      Align = alClient
      DataSource = dsUsuario
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object dsUsuario: TDataSource
    DataSet = DM_DB.FvUsuario
    Left = 392
    Top = 40
  end
end
