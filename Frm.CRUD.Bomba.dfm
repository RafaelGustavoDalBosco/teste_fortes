inherited FrmCRUDBombas: TFrmCRUDBombas
  Caption = 'Bombas'
  TextHeight = 15
  inherited PnlMain: TPanel
    inherited GrbDados: TGroupBox
      inherited DBGridRecords: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Title.Caption = 'Descri'#231#227'o'
            Width = 160
            Visible = True
          end>
      end
    end
  end
end
