object FormEmissaoNFe: TFormEmissaoNFe
  Left = 0
  Top = 0
  Caption = 'FormEmissaoNFe'
  ClientHeight = 440
  ClientWidth = 744
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 72
    Top = 137
    Width = 292
    Height = 39
    AutoSize = False
    Caption = '*** ACBR para gerar NFE e Imprimir a Danfe, com valores fixos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  inline FrameCliente1: TFrameCliente
    Left = 1
    Top = 40
    Width = 377
    Height = 46
    TabOrder = 0
    ExplicitLeft = 1
    ExplicitTop = 40
  end
  object pnlCabecalho: TPanel
    Left = 0
    Top = 0
    Width = 744
    Height = 25
    Align = alTop
    TabOrder = 1
    object pnlTitulo: TPanel
      Left = 1
      Top = 1
      Width = 264
      Height = 23
      Align = alLeft
      BevelInner = bvLowered
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Caption = 'Nota Fiscal Eletr'#244'nica de Produto (NF-e)'
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
  end
  object pnlBotoes1: TPanel
    Left = 0
    Top = 412
    Width = 744
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
    TabOrder = 2
    object btnGravar: TSpeedButton
      Left = 113
      Top = 0
      Width = 113
      Height = 28
      Cursor = crHandPoint
      Align = alLeft
      Caption = 'Imprimir Danfe'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = btnGravarClick
      ExplicitLeft = 0
    end
    object btnLimpar: TSpeedButton
      Left = 645
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
      ExplicitLeft = 352
      ExplicitTop = 4
      ExplicitHeight = 22
    end
    object SpeedButton1: TSpeedButton
      Left = 0
      Top = 0
      Width = 113
      Height = 28
      Cursor = crHandPoint
      Align = alLeft
      Caption = 'Gerar NFE'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton1Click
      ExplicitLeft = -6
    end
  end
  object PageControl1: TPageControl
    Left = 463
    Top = 31
    Width = 273
    Height = 321
    ActivePage = tsEmitente
    TabOrder = 3
    object tsEmitente: TTabSheet
      Caption = 'Emitente'
      object Label12: TLabel
        Left = 8
        Top = 4
        Width = 25
        Height = 13
        Caption = 'CNPJ'
      end
      object Label13: TLabel
        Left = 136
        Top = 4
        Width = 43
        Height = 13
        Caption = 'Insc.Est.'
      end
      object Label14: TLabel
        Left = 8
        Top = 44
        Width = 60
        Height = 13
        Caption = 'Raz'#227'o Social'
      end
      object Label15: TLabel
        Left = 8
        Top = 84
        Width = 41
        Height = 13
        Caption = 'Fantasia'
      end
      object Label16: TLabel
        Left = 8
        Top = 164
        Width = 55
        Height = 13
        Caption = 'Logradouro'
      end
      object Label17: TLabel
        Left = 208
        Top = 164
        Width = 37
        Height = 13
        Caption = 'N'#250'mero'
      end
      object Label18: TLabel
        Left = 8
        Top = 204
        Width = 65
        Height = 13
        Caption = 'Complemento'
      end
      object Label19: TLabel
        Left = 136
        Top = 204
        Width = 28
        Height = 13
        Caption = 'Bairro'
      end
      object Label20: TLabel
        Left = 8
        Top = 244
        Width = 62
        Height = 13
        Caption = 'C'#243'd. Cidade '
      end
      object Label21: TLabel
        Left = 76
        Top = 244
        Width = 33
        Height = 13
        Caption = 'Cidade'
      end
      object Label22: TLabel
        Left = 225
        Top = 244
        Width = 13
        Height = 13
        Caption = 'UF'
      end
      object Label23: TLabel
        Left = 136
        Top = 124
        Width = 19
        Height = 13
        Caption = 'CEP'
      end
      object Label24: TLabel
        Left = 8
        Top = 124
        Width = 24
        Height = 13
        Caption = 'Fone'
      end
      object edtEmitCNPJ: TEdit
        Left = 8
        Top = 20
        Width = 123
        Height = 21
        TabOrder = 0
        Text = '08733388000141'
      end
      object edtEmitIE: TEdit
        Left = 137
        Top = 20
        Width = 123
        Height = 21
        TabOrder = 1
        Text = '1838252083'
      end
      object edtEmitRazao: TEdit
        Left = 8
        Top = 60
        Width = 252
        Height = 21
        TabOrder = 2
        Text = 'Lu'#237's e Augusto Lavanderia Ltda'
      end
      object edtEmitFantasia: TEdit
        Left = 8
        Top = 100
        Width = 252
        Height = 21
        TabOrder = 3
        Text = 'Lavanderia Ltda'
      end
      object edtEmitFone: TEdit
        Left = 8
        Top = 140
        Width = 125
        Height = 21
        TabOrder = 4
        Text = '4228351039'
      end
      object edtEmitCEP: TEdit
        Left = 137
        Top = 140
        Width = 123
        Height = 21
        TabOrder = 5
        Text = '84174060'
      end
      object edtEmitLogradouro: TEdit
        Left = 8
        Top = 180
        Width = 196
        Height = 21
        TabOrder = 6
        Text = 'Rua Jair Rolim de Moura'
      end
      object edtEmitNumero: TEdit
        Left = 208
        Top = 180
        Width = 50
        Height = 21
        TabOrder = 7
        Text = '788'
      end
      object edtEmitComp: TEdit
        Left = 8
        Top = 220
        Width = 123
        Height = 21
        TabOrder = 8
        Text = 'Loja bloco C'
      end
      object edtEmitBairro: TEdit
        Left = 136
        Top = 220
        Width = 123
        Height = 21
        TabOrder = 9
        Text = 'Invernada do Matadouro'
      end
      object edtEmitCodCidade: TEdit
        Left = 8
        Top = 260
        Width = 61
        Height = 21
        TabOrder = 10
        Text = '4104907'
      end
      object edtEmitCidade: TEdit
        Left = 76
        Top = 260
        Width = 142
        Height = 21
        TabOrder = 11
        Text = 'Castro'
      end
      object edtEmitUF: TEdit
        Left = 225
        Top = 260
        Width = 35
        Height = 21
        TabOrder = 12
        Text = 'PR'
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Geral'
      ImageIndex = 1
      object Label29: TLabel
        Left = 3
        Top = 8
        Width = 86
        Height = 13
        Caption = 'Forma de Emiss'#227'o'
      end
      object cbFormaEmissao: TComboBox
        Left = 3
        Top = 24
        Width = 248
        Height = 21
        ItemIndex = 0
        TabOrder = 0
        Text = 'teNormal '
        Items.Strings = (
          'teNormal '
          'teContingencia '
          'teSCAN '
          'teDPEC '
          'teFSDA '
          'teSVCAN'
          'teSVCRS'
          'teSVCSP'
          'teOffLine')
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 672
    Top = 168
  end
  object ACBrNFe1: TACBrNFe
    Configuracoes.Geral.SSLLib = libNone
    Configuracoes.Geral.SSLCryptLib = cryNone
    Configuracoes.Geral.SSLHttpLib = httpNone
    Configuracoes.Geral.SSLXmlSignLib = xsNone
    Configuracoes.Geral.FormaEmissao = teContingencia
    Configuracoes.Geral.FormatoAlerta = 'TAG:%TAGNIVEL% ID:%ID%/%TAG%(%DESCRICAO%) - %MSG%.'
    Configuracoes.Geral.VersaoDF = ve200
    Configuracoes.Geral.AtualizarXMLCancelado = True
    Configuracoes.Geral.VersaoQRCode = veqr000
    Configuracoes.Arquivos.OrdenacaoPath = <>
    Configuracoes.WebServices.UF = 'SP'
    Configuracoes.WebServices.AguardarConsultaRet = 15000
    Configuracoes.WebServices.AjustaAguardaConsultaRet = True
    Configuracoes.WebServices.TimeOut = 20000
    Configuracoes.WebServices.QuebradeLinha = '|'
    DANFE = ACBrNFeDANFeRL1
    Left = 674
    Top = 227
  end
  object ACBrNFeDANFeRL1: TACBrNFeDANFeRL
    ACBrNFe = ACBrNFe1
    MostrarPreview = True
    MostrarStatus = True
    TipoDANFE = tiRetrato
    NumCopias = 1
    ImprimeNomeFantasia = False
    ImprimirDescPorc = False
    ImprimirTotalLiquido = True
    MargemInferior = 0.700000000000000000
    MargemSuperior = 0.700000000000000000
    MargemEsquerda = 0.700000000000000000
    MargemDireita = 0.700000000000000000
    CasasDecimais.Formato = tdetInteger
    CasasDecimais._qCom = 4
    CasasDecimais._vUnCom = 4
    CasasDecimais._Mask_qCom = '###,###,###,##0.00'
    CasasDecimais._Mask_vUnCom = '###,###,###,##0.00'
    ExibirResumoCanhoto = False
    FormularioContinuo = False
    TamanhoFonte_DemaisCampos = 10
    ProdutosPorPagina = 0
    ImprimirDetalhamentoEspecifico = True
    NFeCancelada = False
    ImprimirItens = True
    ViaConsumidor = True
    TamanhoLogoHeight = 0
    TamanhoLogoWidth = 0
    RecuoEndereco = 0
    RecuoEmpresa = 0
    LogoemCima = False
    TamanhoFonteEndereco = 0
    RecuoLogo = 0
    LarguraCodProd = 54
    ExibirEAN = False
    QuebraLinhaEmDetalhamentoEspecifico = True
    ExibeCampoFatura = False
    ImprimirUnQtVlComercial = iuComercial
    ImprimirDadosDocReferenciados = True
    Left = 675
    Top = 291
  end
end
