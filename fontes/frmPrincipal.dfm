object FormPrincipal: TFormPrincipal
  Left = 0
  Top = 0
  Caption = 
    'work here delphi - Delphi Tokyo 10.2.3 Community Edition, ACBR, ' +
    'FastReport, FortesReport'
  ClientHeight = 410
  ClientWidth = 746
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object stbRodape: TStatusBar
    Left = 0
    Top = 376
    Width = 746
    Height = 34
    Panels = <
      item
        Width = 550
      end
      item
        Width = 230
      end>
  end
  object MainMenu1: TMainMenu
    Left = 32
    Top = 8
    object CadastroCRUD1: TMenuItem
      Caption = 'CRUD para a entidade Cliente'
      object Clientes1: TMenuItem
        Caption = 'Clientes'
        OnClick = Clientes1Click
      end
    end
    object EmissoNFE1: TMenuItem
      Caption = 'Tela de Leitura e Lan'#231'amento'
      object EmissoNFE2: TMenuItem
        Caption = 'Nota Fiscal Eletr'#244'nica de Produto (NF-e)'
        OnClick = EmissoNFE2Click
      end
      object NotaFiscalEletrnicadeServioNFSe1: TMenuItem
        Caption = 'Nota Fiscal Eletr'#244'nica de Servi'#231'o (NFS-e)'
        OnClick = NotaFiscalEletrnicadeServioNFSe1Click
      end
    end
    object Reports1: TMenuItem
      Caption = 'Relat'#243'rios'
      object relNFe: TMenuItem
        Caption = 'Relat'#243'rio de NF-e'
        OnClick = relNFeClick
      end
      object relNFSe: TMenuItem
        Caption = 'Relat'#243'rio de NFS-e'
        OnClick = relNFSeClick
      end
      object relProdVlMedio: TMenuItem
        Caption = 'Relat'#243'rio de Produtos - Vlr. Un. M'#233'dio'
        OnClick = relProdVlMedioClick
      end
      object relServVlMedio: TMenuItem
        Caption = 'Relat'#243'rio de Servi'#231'o - Vlr. Un. M'#233'dio'
        OnClick = relServVlMedioClick
      end
      object relRankingCli: TMenuItem
        Caption = 'Relat'#243'rio Ranking - Clientes - Top 3'
        OnClick = relRankingCliClick
      end
      object relRankingProd: TMenuItem
        Caption = 'Relat'#243'rio Ranking - Produtos - Top 3'
        Enabled = False
      end
      object relRankingServ: TMenuItem
        Caption = 'Relat'#243'rio Ranking - Servi'#231'os - Top 3'
        Enabled = False
      end
      object VendorLibTeste1: TMenuItem
        Caption = 'VendorLibTeste'
        OnClick = VendorLibTeste1Click
      end
    end
  end
  object dbsRelNFe: TfrxDBDataset
    UserName = 'dbsRelNFe'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CLIENTEID=CLIENTEID'
      'NOMECLIENTE=NOMECLIENTE'
      'ESTADO=ESTADO'
      'CIDADE=CIDADE'
      'NOTAFISCALID=NOTAFISCALID'
      'DATA=DATA'
      'VALORTOTAL=VALORTOTAL'
      'PRODUTOID=PRODUTOID'
      'NOMEPRODUTO=NOMEPRODUTO'
      'QUANTIDADE=QUANTIDADE'
      'VALORUNITARIO=VALORUNITARIO')
    DataSet = qryNFe
    BCDToCurrency = False
    Left = 544
    Top = 72
  end
  object frxReport: TfrxReport
    Version = '5.3.14'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43359.487121273200000000
    ReportOptions.LastChange = 43359.556170416700000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 328
    Top = 24
    Datasets = <
      item
        DataSetName = 'dbsRelNFSe'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 30.236240000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Top = 5.000000000000000000
          Width = 718.110700000000000000
          Height = 22.677167800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Fill.BackColor = 52376
          HAlign = haCenter
          Memo.UTF8W = (
            'Nota Fiscal Eletr'#244'nica de Servi'#231'o (NFS-e)')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 510.236550000000000000
        Width = 718.110700000000000000
        object Page: TfrxMemoView
          Left = 631.181510000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Page#]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 287.244280000000000000
        Width = 718.110700000000000000
        DataSetName = 'dbsRelNFSe'
        RowCount = 0
        object dbsRelNFSeSERVICOID: TfrxMemoView
          Left = 45.354360000000000000
          Top = 3.779530000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          DataField = 'SERVICOID'
          DataSetName = 'dbsRelNFSe'
          Memo.UTF8W = (
            '[dbsRelNFSe."SERVICOID"]')
        end
        object dbsRelNFSeNOMESERVICO: TfrxMemoView
          Left = 102.047310000000000000
          Top = 3.779530000000000000
          Width = 226.771800000000000000
          Height = 18.897650000000000000
          DataField = 'NOMESERVICO'
          DataSetName = 'dbsRelNFSe'
          Memo.UTF8W = (
            '[dbsRelNFSe."NOMESERVICO"]')
        end
        object dbsRelNFSeQUANTIDADE: TfrxMemoView
          Left = 332.598640000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'QUANTIDADE'
          DataSetName = 'dbsRelNFSe'
          Memo.UTF8W = (
            '[dbsRelNFSe."QUANTIDADE"]')
        end
        object dbsRelNFSeVALORUNITARIO: TfrxMemoView
          Left = 419.527830000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSetName = 'dbsRelNFSe'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Memo.UTF8W = (
            '[dbsRelNFSe."VALORUNITARIO"]')
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Height = 79.370130000000000000
        Top = 109.606370000000000000
        Width = 718.110700000000000000
        Condition = 'dbsRelNFSe."CLIENTEID"'
        object dbsRelNFeCLIENTEID: TfrxMemoView
          Left = 7.559060000000000000
          Top = 30.236240000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = dbsRelNFe
          DataSetName = 'dbsRelNFe'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[dbsRelNFSe."CLIENTEID"]')
          ParentFont = False
        end
        object dbsRelNFeNOMECLIENTE: TfrxMemoView
          Left = 94.488250000000000000
          Top = 30.236240000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          DataSet = dbsRelNFe
          DataSetName = 'dbsRelNFe'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dbsRelNFSe."NOMECLIENTE"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 7.559060000000000000
          Top = 7.559060000000000000
          Width = 283.464750000000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Cliente')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 294.803340000000000000
          Top = 30.236240000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = dbsRelNFe
          DataSetName = 'dbsRelNFe'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[dbsRelNFSe."CIDADE"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 294.803340000000000000
          Top = 7.559060000000000000
          Width = 79.370130000000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Cidade')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 26.456710000000000000
          Top = 56.692950000000000000
          Width = 79.370130000000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Nota Fiscal ')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 113.385900000000000000
          Top = 56.692950000000000000
          Width = 79.370130000000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Data')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 200.315090000000000000
          Top = 56.692950000000000000
          Width = 79.370130000000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Valor Total')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 377.953000000000000000
          Top = 30.236240000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = dbsRelNFe
          DataSetName = 'dbsRelNFe'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[dbsRelNFSe."ESTADO"]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 377.953000000000000000
          Top = 7.559060000000000000
          Width = 79.370130000000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'UF')
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 336.378170000000000000
        Width = 718.110700000000000000
        object Memo19: TfrxMemoView
          Left = 283.464750000000000000
          Width = 215.433210000000000000
          Height = 18.897650000000000000
          DataSet = dbsRelNFe
          DataSetName = 'dbsRelNFe'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            
              'Total por Nota: [SUM(<dbsRelNFSe."VALORUNITARIO">, MasterData1,1' +
              ')]')
          ParentFont = False
        end
      end
      object GroupHeader2: TfrxGroupHeader
        FillType = ftBrush
        Height = 52.913420000000000000
        Top = 211.653680000000000000
        Width = 718.110700000000000000
        Condition = 'dbsRelNFSe."NOTAFISCALID"'
        object dbsRelNFeNOTAFISCALID: TfrxMemoView
          Left = 26.456710000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = dbsRelNFe
          DataSetName = 'dbsRelNFe'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[dbsRelNFSe."NOTAFISCALID"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 113.385900000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = dbsRelNFe
          DataSetName = 'dbsRelNFe'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[dbsRelNFSe."DATA"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 200.315090000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = dbsRelNFe
          DataSetName = 'dbsRelNFe'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[dbsRelNFSe."VALORTOTAL"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 45.354360000000000000
          Top = 26.456710000000000000
          Width = 283.464750000000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'SERVI'#199'O')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 332.598640000000000000
          Top = 26.456710000000000000
          Width = 79.370130000000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Qtd')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 419.527830000000000000
          Top = 26.456710000000000000
          Width = 79.370130000000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Valor Un.')
          ParentFont = False
        end
      end
      object GroupFooter2: TfrxGroupFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 381.732530000000000000
        Width = 718.110700000000000000
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 427.086890000000000000
        Width = 718.110700000000000000
        object Memo6: TfrxMemoView
          Left = 283.464750000000000000
          Width = 215.433210000000000000
          Height = 18.897650000000000000
          DataSet = dbsRelNFe
          DataSetName = 'dbsRelNFe'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'Total Geral: [SUM(<dbsRelNFSe."VALORUNITARIO">, MasterData1,1)]')
          ParentFont = False
        end
      end
    end
  end
  object qryNFSe: TFDQuery
    Connection = DM.FDConnection
    SQL.Strings = (
      'select'
      
        '  cli.clienteid, cli.nome as NomeCliente, cli.estado, cli.cidade' +
        ','
      '  nf.notafiscalid, nf.data, nf.valortotal,'
      
        '  nfs.servicoid, s.nome as NomeServico, nfs.quantidade, nfs.valo' +
        'runitario'
      'from'
      '  notafiscal nf'
      '  inner join cliente as cli on (cli.clienteid = nf.clienteid)'
      
        '  inner join notafiscalservico as nfs on (nfs.notafiscalid = nf.' +
        'notafiscalid)'
      '  inner join servico as s on (s.servicoid = nfs.servicoid)')
    Left = 608
    Top = 24
    object qryNFSeCLIENTEID: TIntegerField
      FieldName = 'CLIENTEID'
      Origin = 'CLIENTEID'
      Required = True
    end
    object qryNFSeNOMECLIENTE: TStringField
      FieldName = 'NOMECLIENTE'
      Origin = 'NOMECLIENTE'
      Required = True
      Size = 60
    end
    object qryNFSeESTADO: TIntegerField
      FieldName = 'ESTADO'
      Origin = 'ESTADO'
      Required = True
    end
    object qryNFSeCIDADE: TIntegerField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Required = True
    end
    object qryNFSeNOTAFISCALID: TIntegerField
      FieldName = 'NOTAFISCALID'
      Origin = 'NOTAFISCALID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryNFSeDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
    end
    object qryNFSeVALORTOTAL: TBCDField
      FieldName = 'VALORTOTAL'
      Origin = 'VALORTOTAL'
      Required = True
      Precision = 18
      Size = 2
    end
    object qryNFSeSERVICOID: TIntegerField
      FieldName = 'SERVICOID'
      Origin = 'SERVICOID'
      Required = True
    end
    object qryNFSeNOMESERVICO: TStringField
      FieldName = 'NOMESERVICO'
      Origin = 'NOMESERVICO'
      Required = True
      Size = 60
    end
    object qryNFSeQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      Required = True
    end
    object qryNFSeVALORUNITARIO: TBCDField
      FieldName = 'VALORUNITARIO'
      Origin = 'VALORUNITARIO'
      Required = True
      Precision = 18
      Size = 2
    end
  end
  object dbsRelNFSe: TfrxDBDataset
    UserName = 'dbsRelNFSe'
    CloseDataSource = False
    DataSet = qryNFSe
    BCDToCurrency = False
    Left = 608
    Top = 72
  end
  object qryNFe: TFDQuery
    Connection = DM.FDConnection
    SQL.Strings = (
      'select'
      
        '  cli.clienteid, cli.nome as NomeCliente, cli.estado, cli.cidade' +
        ','
      '  nf.notafiscalid, nf.data, nf.valortotal,'
      
        '  nfp.produtoid, p.nome as NomeProduto, nfp.quantidade, nfp.valo' +
        'runitario'
      'from'
      '  notafiscal nf'
      '  inner join cliente as cli on (cli.clienteid = nf.clienteid)'
      
        '  inner join notafiscalproduto as nfp on (nfp.notafiscalid = nf.' +
        'notafiscalid)'
      '  inner join produto as p on (p.produtoid = nfp.produtoid)')
    Left = 544
    Top = 24
    object qryNFeCLIENTEID: TIntegerField
      FieldName = 'CLIENTEID'
      Origin = 'CLIENTEID'
      Required = True
    end
    object qryNFeNOMECLIENTE: TStringField
      FieldName = 'NOMECLIENTE'
      Origin = 'NOMECLIENTE'
      Required = True
      Size = 60
    end
    object qryNFeESTADO: TIntegerField
      FieldName = 'ESTADO'
      Origin = 'ESTADO'
      Required = True
    end
    object qryNFeCIDADE: TIntegerField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Required = True
    end
    object qryNFeNOTAFISCALID: TIntegerField
      FieldName = 'NOTAFISCALID'
      Origin = 'NOTAFISCALID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryNFeDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
    end
    object qryNFeVALORTOTAL: TBCDField
      FieldName = 'VALORTOTAL'
      Origin = 'VALORTOTAL'
      Required = True
      Precision = 18
      Size = 2
    end
    object qryNFePRODUTOID: TIntegerField
      FieldName = 'PRODUTOID'
      Origin = 'PRODUTOID'
      Required = True
    end
    object qryNFeNOMEPRODUTO: TStringField
      FieldName = 'NOMEPRODUTO'
      Origin = 'NOMEPRODUTO'
      Required = True
      Size = 60
    end
    object qryNFeQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      Required = True
    end
    object qryNFeVALORUNITARIO: TBCDField
      FieldName = 'VALORUNITARIO'
      Origin = 'VALORUNITARIO'
      Required = True
      Precision = 18
      Size = 2
    end
  end
  object qryRelProdVlMed: TFDQuery
    Connection = DM.FDConnection
    SQL.Strings = (
      'select'
      
        '  nfp.data, nfp.produtoid, p.nome as NomeProduto, nfp.quantidade' +
        ', nfp.valorunitario, nfp.valortotal'
      'From'
      '  notafiscalproduto as nfp'
      '  inner join produto as p on (p.produtoid = nfp.produtoid)'
      'order by produtoid')
    Left = 472
    Top = 24
    object qryRelProdVlMedDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
    end
    object qryRelProdVlMedPRODUTOID: TIntegerField
      FieldName = 'PRODUTOID'
      Origin = 'PRODUTOID'
      Required = True
    end
    object qryRelProdVlMedNOMEPRODUTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOMEPRODUTO'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object qryRelProdVlMedQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      Required = True
    end
    object qryRelProdVlMedVALORUNITARIO: TBCDField
      FieldName = 'VALORUNITARIO'
      Origin = 'VALORUNITARIO'
      Required = True
      Precision = 18
      Size = 2
    end
    object qryRelProdVlMedVALORTOTAL: TBCDField
      FieldName = 'VALORTOTAL'
      Origin = 'VALORTOTAL'
      Required = True
      Precision = 18
      Size = 2
    end
  end
  object dbsRelProdVlMed: TfrxDBDataset
    UserName = 'dbsRelProdVlMed'
    CloseDataSource = False
    DataSet = qryRelProdVlMed
    BCDToCurrency = False
    Left = 472
    Top = 72
  end
  object qryRelSerVlMed: TFDQuery
    Connection = DM.FDConnection
    SQL.Strings = (
      'select'
      
        '  nfs.data, nfs.servicoid, s.nome as NomeServico, nfs.quantidade' +
        ', nfs.valorunitario, nfs.valortotal'
      'From'
      '  notafiscalservico as nfs'
      '  left join servico as s on (s.servicoid = nfs.servicoid)'
      'order by servicoid')
    Left = 680
    Top = 24
    object qryRelSerVlMedDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
    end
    object qryRelSerVlMedSERVICOID: TIntegerField
      FieldName = 'SERVICOID'
      Origin = 'SERVICOID'
      Required = True
    end
    object qryRelSerVlMedNOMESERVICO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOMESERVICO'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object qryRelSerVlMedQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      Required = True
    end
    object qryRelSerVlMedVALORUNITARIO: TBCDField
      FieldName = 'VALORUNITARIO'
      Origin = 'VALORUNITARIO'
      Required = True
      Precision = 18
      Size = 2
    end
    object qryRelSerVlMedVALORTOTAL: TBCDField
      FieldName = 'VALORTOTAL'
      Origin = 'VALORTOTAL'
      Required = True
      Precision = 18
      Size = 2
    end
  end
  object dbsRelSerVlMed: TfrxDBDataset
    UserName = 'dbsRelSerVlMed'
    CloseDataSource = False
    DataSet = qryRelSerVlMed
    BCDToCurrency = False
    Left = 680
    Top = 72
  end
  object qryRankCli: TFDQuery
    Connection = DM.FDConnection
    SQL.Strings = (
      'select first 3'
      '  cli.clienteid, cli.nome as NomeCliente'
      '  ,sum(nf.valortotal) as valortotal'
      'from'
      '  notafiscal nf'
      '  left join cliente as cli on (cli.clienteid = nf.clienteid)'
      'group by'
      '  cli.clienteid, cli.nome')
    Left = 392
    Top = 24
    object qryRankCliCLIENTEID: TIntegerField
      FieldName = 'CLIENTEID'
      Origin = 'CLIENTEID'
    end
    object qryRankCliNOMECLIENTE: TStringField
      FieldName = 'NOMECLIENTE'
      Origin = 'NOMECLIENTE'
      Size = 60
    end
    object qryRankCliVALORTOTAL: TBCDField
      FieldName = 'VALORTOTAL'
      Origin = 'VALORTOTAL'
      Precision = 18
      Size = 2
    end
  end
  object dbsRankCli: TfrxDBDataset
    UserName = 'dbsRankCli'
    CloseDataSource = False
    DataSet = cdsRankCli
    BCDToCurrency = False
    Left = 392
    Top = 168
  end
  object cdsRankCli: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CLIENTEID'
        DataType = ftInteger
      end
      item
        Name = 'NOMECLIENTE'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'VALORTOTAL'
        DataType = ftBCD
        Precision = 18
        Size = 2
      end>
    IndexDefs = <
      item
        Name = 'idxValorTotal'
        Fields = 'VALORTOTAL'
        Options = [ixDescending]
      end>
    IndexName = 'idxValorTotal'
    Params = <>
    ProviderName = 'dspRankCli'
    StoreDefs = True
    Left = 392
    Top = 120
    object cdsRankCliCLIENTEID: TIntegerField
      FieldName = 'CLIENTEID'
      Origin = 'CLIENTEID'
    end
    object cdsRankCliNOMECLIENTE: TStringField
      FieldName = 'NOMECLIENTE'
      Origin = 'NOMECLIENTE'
      Size = 60
    end
    object cdsRankCliVALORTOTAL: TBCDField
      FieldName = 'VALORTOTAL'
      Origin = 'VALORTOTAL'
      Precision = 18
      Size = 2
    end
  end
  object dspRankCli: TDataSetProvider
    DataSet = qryRankCli
    Left = 392
    Top = 72
  end
end
