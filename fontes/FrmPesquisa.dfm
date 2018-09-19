object FormPesquisa: TFormPesquisa
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = ' Pesquisa'
  ClientHeight = 426
  ClientWidth = 601
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object gbxFiltro: TGroupBox
    Left = 0
    Top = 0
    Width = 601
    Height = 426
    Align = alClient
    Caption = ' Pesquisa: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object pnlBotoes1: TPanel
      Left = 2
      Top = 396
      Width = 597
      Height = 28
      Hint = 'Clique aqui para Minimizar/Maximizar dados de contatos'
      Align = alBottom
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Color = clWhite
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      object btnSelecionar: TSpeedButton
        Left = 0
        Top = 0
        Width = 121
        Height = 28
        Cursor = crHandPoint
        Align = alLeft
        Caption = 'F2 - Selecionar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
          FFFFFFFFFFFFBBE4C270CF8527B7471EBA401EBA4027B74770CF85BBE4C2FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFDFA4FB96219C1401FCE4C24DC5827
          DD5C27DD5C24DC581FCE4C19C1404FB962FAFDFAFFFFFFFFFFFFFFFFFFFBFDFB
          21A93A1ED04E21D45420D05304B62A18C4401DCE4A18C84420D15121D4541ED0
          4E21A93AFBFDFBFFFFFFFFFFFF4EB15B1ECE4D22D45615C9481CAC2F9DD2A137
          AF4614C13B1FD24E1ECE4B1ECD4A20D2531ECE4D4EB15BFFFFFFBDDEBE17BA3F
          21D85A13C64612A826F2F4ECFFFFFFEAF2E626AA380DC03920D24F1ECE491DCD
          4D20D75817BA3FBDDEBE6ABC7418D15214CB4E0BA01EF2F4ECFFFBFFFFFAFFFF
          FFFFEAF2E623A8350BC03A1ED3591CCF531ED25818CF516ABC7430A03F2DE172
          1BA82DF2F4ECFFF8FFEAF2E6A9D5A4EEF2EBFFFFFFD0EBD323A8340AC24218D6
          6213CF5430E17330A14130A34365EAA158B25CEAF2E6EAF2E60EB42F00BF303A
          B649F2F4ECFFFFFFEAF2E623A83307C13D24D86973F0B130A14223953778F4BC
          49CD7A74BF7F2DB64C24D3672ED87219CC5A48B558EAF2E6FFFFFFEAF2E626A7
          3125D06077F6BE23953533933D71F2B561E4A84CDB955BE1A561DEA563DDA463
          E2AB4DDA964FB860EEF2E8FFFFFFEAF2E62AB3436DF0B333933D67AB6686E3B5
          62E7A95DE2A460E2A65FE1A65FE1A65EE1A563E5AD4CDA954DB75EEAF0E5FFFF
          FF61BC6580DFAE67AB66B9D4B94EB068A8FCE15FE1A257E09F5BE0A35DE1A45D
          E1A45DE1A461E5AB4EDC9748BA605DC27096EABF4EB068B9D4B9FFFFFF458945
          7BDBA7B0FCE876E5B562E3AA5EE0A65EE1A65EE1A65EE0A566E6B06FE3AFA7F9
          E07ADCA8458945FFFFFFFFFFFFFAFDFA1572156DD6A3B3FDF0A4F5DF8CE9C78C
          E8C48AE7C28DE9C6A5F5DEB3FDF06DD6A3157215FAFDFAFFFFFFFFFFFFFFFFFF
          F9FCF945864538A75E7FE1B8A9FFECB9FFFBB9FFFBA9FFEC7FE1B838A75E4586
          45F9FCF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7CEB767A567247D3328
          8738288738247D3367A567B7CEB7FFFFFFFFFFFFFFFFFFFFFFFF}
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = btnSelecionarClick
        ExplicitLeft = 2
        ExplicitTop = 4
        ExplicitHeight = 22
      end
      object btnFechar: TSpeedButton
        Left = 492
        Top = 0
        Width = 105
        Height = 28
        Cursor = crHandPoint
        Align = alRight
        Caption = 'ESC - Fechar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          76050000424D7605000000000000360000002800000015000000150000000100
          18000000000040050000120B0000120B00000000000000000000C8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
          D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D400C8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
          D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D400C8D0D4C8D0D4
          C8D0D4C9D1D5D9E1E4DDE2E4DDE2E4DDE2E4DDE2E4DDE2E4DDE2E4DDE2E4DDE2
          E4DDE2E4DDE2E4DDE2E4D9E1E4C9D1D5C8D0D4C8D0D4C8D0D400C8D0D4C8D0D4
          C9D1D5CFD6E46379C75167BE546AC0556ABF556AC0546AC2536AC35068C54E67
          C54C65C34A64C54862C35E74C3CED5E2C9D1D5C8D0D4C8D0D400C8D0D4C8D0D4
          D9E1E4637DDB1439CC1D41CD2547CF2648CF2447D02247D01E46D21944D51441
          D60E3DD50738D60232D2002AC15E74C3D9E1E4C8D0D4C8D0D400C8D0D4C8D0D4
          DDE2E4526FE41F45DD2C50DF3557E03659E1395CE13F64E33E65E5345FE62354
          E6154BE60C44E6053BE30131D34861C2DDE2E4C8D0D4C8D0D400C8D0D4C8D0D4
          DDE2E45774E72C4FE1395BE34262E4637EE9B3C0F4E0E6FBEEF1FDDDE4FBA3B9
          F63D6CED124BEA0941E60435D64963C5DDE2E4C8D0D4C8D0D400C8D0D4C8D0D4
          DDE2E45C78E83558E34363E46A83EAD1D9F8CBD5F8849CEF5F81EC7D9AF1C6D3
          F9C0D0F93868ED0F46E60A3AD64C65C5DDE2E4C8D0D4C8D0D400C8D0D4C8D0D4
          DDE2E4627DE93F60E4516DE6BBC6F5CAD3F75876E85374E997ADF2416BEA3D6A
          EBC4D2F99EB4F61C4FE61240D74F68C5DDE2E4C8D0D4C8D0D400C8D0D4C8D0D4
          DDE2E46882EA4967E55F79E9E5E9FB899CEF4C6BE6627FEAFFFFFF5176EB2858
          E77191F0DAE2FB2B59E61A45D6536BC5DDE2E4C8D0D4C8D0D400C8D0D4C8D0D4
          DDE2E46D86EA516DE76880EAEEF1FD6F86EB4C69E6627DE9FFFFFF5073E92854
          E54C71EAECF0FD355EE52048D5566DC4DDE2E4C8D0D4C8D0D400C8D0D4C8D0D4
          DDE2E4738BEB5A75E86B83EAE7EAFC889BEE4C69E5627CE9FFFFFF5070E82851
          E36F8BEDDDE3FB365CE4264AD4596EC4DDE2E4C8D0D4C8D0D400C8D0D4C8D0D4
          DDE2E4778EEC647DE96C84EAC5CEF7C8D0F75872E7536EE698A9F04162E43C5F
          E4C2CDF7A9B9F33055E1294CD35B70C4DDE2E4C8D0D4C8D0D400C8D0D4C8D0D4
          DDE2E47C91ED6E87EA7088EB8498EED8DEF9C8D0F77D92EC607AE9788FECC2CC
          F6CAD3F8506FE72E52E02B4CD25B70C3DDE2E4C8D0D4C8D0D400C8D0D4C8D0D4
          DDE2E48196ED7D94ED7E94ED6F87EB8397EDC5CEF7E4E8FBECEFFCE2E7FBB7C3
          F55D78E83659E23255E02B4CD15A6FC2DDE2E4C8D0D4C8D0D400C8D0D4C8D0D4
          DDE2E4899DEE91A4F091A3F07C93ED7089EB6E86EA7087EA6F86EA6881EA5B76
          E84E6CE64565E53859E1284AD1566BC1DDE2E4C8D0D4C8D0D400C8D0D4C8D0D4
          D9E1E493A7F08CA0EF8DA1EF788FEC6D86EA6680E9617BE95E78E85A76E85572
          E74E6CE64465E53557E02345CF687DC9D9E1E4C8D0D4C8D0D400C8D0D4C8D0D4
          C9D1D5D4DBE993A6F0869BEE7F94ED7A90ED758CEC758CEB738BEB7088EB6D86
          EA6A83EA6680E95E79E66C84DFD0D6E4C9D1D5C8D0D4C8D0D400C8D0D4C8D0D4
          C8D0D4C9D1D5D9E1E4DDE2E4DDE2E4DDE2E4DDE2E4DDE2E4DDE2E4DDE2E4DDE2
          E4DDE2E4DDE2E4DDE2E4D9E1E4C9D1D5C8D0D4C8D0D4C8D0D400C8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
          D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D400C8D0D4C8D0D4
          C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
          D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D400}
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = btnFecharClick
        ExplicitLeft = 498
        ExplicitTop = -8
      end
      object Label3: TLabel
        Left = 135
        Top = 8
        Width = 76
        Height = 13
        Caption = 'Ordenar por: '
      end
      object btnLimpar: TSpeedButton
        Left = 393
        Top = 0
        Width = 99
        Height = 28
        Cursor = crHandPoint
        Align = alRight
        Caption = 'Limpar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          EE000000424DEE000000000000007600000028000000100000000F0000000100
          04000000000078000000CE0E0000D80E00001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777777777777777777000000077777777077777700777777707777770307
          77777077777703307777770FBFBFB03307777770FBFBFB03307777770FBFBFB0
          3307777770FBFBFB03077777770FBFBFB00777777770FBFBFB07777777770000
          007777777777777777777777777777777777}
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = btnLimparClick
        ExplicitLeft = 352
        ExplicitTop = 4
        ExplicitHeight = 22
      end
      object cmbOrdenar: TComboBox
        Left = 215
        Top = 4
        Width = 156
        Height = 21
        Cursor = crHandPoint
        Hint = 'Selecione um item para filtrar.'
        Style = csDropDownList
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemIndex = 1
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Text = 'Descri'#231#227'o'
        OnChange = cmbOrdenarChange
        Items.Strings = (
          'C'#243'digo'
          'Descri'#231#227'o'
          '')
      end
    end
    object edtCodigo: TEdit
      Left = 14
      Top = 15
      Width = 77
      Height = 19
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
      OnKeyDown = edtCodigoKeyDown
      OnKeyPress = edtCodigoKeyPress
    end
    object edtDescricao: TEdit
      Left = 90
      Top = 15
      Width = 387
      Height = 19
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 2
      OnKeyDown = edtDescricaoKeyDown
      OnKeyPress = edtDescricaoKeyPress
    end
    object grdPesquisa: TDBGrid
      Left = 2
      Top = 33
      Width = 597
      Height = 363
      Cursor = crHandPoint
      Align = alBottom
      Ctl3D = False
      DataSource = dsDados
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlue
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      OnDblClick = grdPesquisaDblClick
      OnTitleClick = grdPesquisaTitleClick
      Columns = <
        item
          Expanded = False
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clBlack
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 385
          Visible = True
        end>
    end
  end
  object dsDados: TDataSource
    DataSet = cdsDados
    Left = 231
    Top = 232
  end
  object dspDados: TDataSetProvider
    Left = 232
    Top = 104
  end
  object cdsDados: TClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive, foNoPartialCompare]
    Params = <>
    ProviderName = 'dspDados'
    AfterOpen = cdsDadosAfterOpen
    Left = 232
    Top = 168
  end
end
