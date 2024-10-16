unit consultaCep;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  Tfrm_consultaCep = class(TForm)
    edt_consultarCep: TEdit;
    btn_buscar: TButton;
    gb_dadosEndereco: TGroupBox;
    edt_cep: TEdit;
    lbl_cep: TLabel;
    edt_logradouro: TEdit;
    lbl_logradouro: TLabel;
    edt_complemento: TEdit;
    lbl_complemento: TLabel;
    lbl_buscarCep: TLabel;
    edt_bairro: TEdit;
    edt_localidade: TEdit;
    edt_uf: TEdit;
    lbl_bairro: TLabel;
    lbl_localidade: TLabel;
    lbl_uf: TLabel;
    edt_ibge: TEdit;
    edt_gia: TEdit;
    edt_ddd: TEdit;
    lbl_ibge: TLabel;
    lbl_gia: TLabel;
    lbl_ddd: TLabel;
    edt_siafi: TEdit;
    lbl_siafi: TLabel;
    procedure btn_buscarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
  TEndereco = class
  private
    cep: string;
    logradouro: string;
    complemento: string;
    bairro: string;
    localidade: string;
    uf: string;
    ibge: string;
    gia: string;
    ddd: string;
    siafi: string;
  public
    { Public declarations }
  end;

var
  frm_consultaCep: Tfrm_consultaCep;


implementation

{$R *.dfm}

uses unDados, unConexao;


function VerificarSeExiste(var Cep: String): Boolean;
var
  _Dao: TDmConexao;
begin
  try
    _Dao := TdmConexao.Create(nil);
    with _Dao do
    begin

      _Dao.FDQuery1.Close;
      _Dao.FDQuery1.SQL.Clear;
      _Dao.FDQuery1.SQL.Text := 'select * from TspdCep where cep = :Cep';
      _Dao.FDQuery1.ParamByName('Cep').AsString := Cep;
      _Dao.FDQuery1.Open;
      if _Dao.FDQuery1.FieldByName('cep').AsString = Cep then
        Result := true
      else
        Result := false;
    end;
  finally
    _Dao.free;
  end;
end;

function PopularPropriedadesClasse(const Dados: TDmDados): TEndereco;
var
  _Endereco: TEndereco;
begin
  _Endereco := TEndereco.Create;

  _Endereco.cep := Dados.FDMemTable1.FieldByName('cep').AsString;
  _Endereco.logradouro := Dados.FDMemTable1.FieldByName('logradouro').AsString;
  _Endereco.complemento := Dados.FDMemTable1.FieldByName('complemento').AsString;
  _Endereco.bairro := Dados.FDMemTable1.FieldByName('bairro').AsString;
  _Endereco.localidade := Dados.FDMemTable1.FieldByName('localidade').AsString;
  _Endereco.uf := Dados.FDMemTable1.FieldByName('uf').AsString;
  _Endereco.ibge := Dados.FDMemTable1.FieldByName('ibge').AsString;
  _Endereco.gia := Dados.FDMemTable1.FieldByName('gia').AsString;
  _Endereco.ddd := Dados.FDMemTable1.FieldByName('ddd').AsString;
  _Endereco.siafi := Dados.FDMemTable1.FieldByName('siafi').AsString;

  Result := _Endereco;
end;

procedure TransacionarBanco(const Endereco: TEndereco);
var
  _Dao: TDmConexao;
begin
  if VerificarSeExiste(Endereco.cep) then
  begin
    try
      _Dao := TdmConexao.Create(nil);
      with _Dao do
      begin
        _Dao.FDQuery1.Close;
        _Dao.FDQuery1.SQL.Clear;
        _Dao.FDQuery1.SQL.Text := 'update TspdCep set logradouro=:logradouro, complemento=:complemento, bairro=:bairro, localidade=:localidade, uf=:uf, ibge=:ibge, ddd=:ddd where cep = :cep';
        _Dao.FDQuery1.ParamByName('cep').AsString := Endereco.cep;
        _Dao.FDQuery1.ParamByName('logradouro').AsString := Endereco.logradouro;
        _Dao.FDQuery1.ParamByName('complemento').AsString := Endereco.complemento;
        _Dao.FDQuery1.ParamByName('bairro').AsString := Endereco.bairro;
        _Dao.FDQuery1.ParamByName('localidade').AsString := Endereco.localidade;
        _Dao.FDQuery1.ParamByName('uf').AsString := Endereco.uf;
        _Dao.FDQuery1.ParamByName('ibge').AsString := Endereco.ibge;
        _Dao.FDQuery1.ParamByName('ddd').AsString := Endereco.ddd;
        _Dao.FDQuery1.ExecSQL;
      end;
    finally
      _Dao.free;
    end;
  end
  else
  begin

    try
      _Dao := TdmConexao.Create(nil);
      with _Dao do
      begin
        _Dao.FDQuery1.Close;
        _Dao.FDQuery1.SQL.Clear;
        _Dao.FDQuery1.SQL.Text := 'insert into TspdCep (cep, logradouro, complemento, bairro, localidade, uf, ibge, ddd) values (:cep, :logradouro, :complemento, :bairro, :localidade, :uf, :ibge, :ddd)';
        _Dao.FDQuery1.ParamByName('cep').AsString := Endereco.cep;
        _Dao.FDQuery1.ParamByName('logradouro').AsString := Endereco.logradouro;
        _Dao.FDQuery1.ParamByName('complemento').AsString := Endereco.complemento;
        _Dao.FDQuery1.ParamByName('bairro').AsString := Endereco.bairro;
        _Dao.FDQuery1.ParamByName('localidade').AsString := Endereco.localidade;
        _Dao.FDQuery1.ParamByName('uf').AsString := Endereco.uf;
        _Dao.FDQuery1.ParamByName('ibge').AsString := Endereco.ibge;
        _Dao.FDQuery1.ParamByName('ddd').AsString := Endereco.ddd;
        _Dao.FDQuery1.ExecSQL;

      end;
    finally
      _Dao.free;
    end;
  end;
end;

procedure PreencherDadosTela(const Endereco: TEndereco);
begin
  frm_consultaCep.edt_cep.Text := Endereco.cep;
  frm_consultaCep.edt_logradouro.Text := Endereco.logradouro;
  frm_consultaCep.edt_complemento.Text := Endereco.complemento;
  frm_consultaCep.edt_bairro.Text := Endereco.bairro;
  frm_consultaCep.edt_localidade.Text := Endereco.localidade;
  frm_consultaCep.edt_uf.Text := Endereco.uf;
  frm_consultaCep.edt_ibge.Text := Endereco.ibge;
  frm_consultaCep.edt_gia.Text := Endereco.gia;
  frm_consultaCep.edt_ddd.Text := Endereco.ddd;
  frm_consultaCep.edt_siafi.Text := Endereco.siafi;
end;

procedure LimparDadosTela;
begin
  frm_consultaCep.edt_cep.Text := '';
  frm_consultaCep.edt_logradouro.Text := '';
  frm_consultaCep.edt_complemento.Text := '';
  frm_consultaCep.edt_bairro.Text := '';
  frm_consultaCep.edt_localidade.Text := '';
  frm_consultaCep.edt_uf.Text := '';
  frm_consultaCep.edt_ibge.Text := '';
  frm_consultaCep.edt_gia.Text := '';
  frm_consultaCep.edt_ddd.Text := '';
  frm_consultaCep.edt_siafi.Text := '';
end;

procedure ConsultarCep(const form: Tfrm_consultaCep);
var
  _Cep: String;
  _Endereco: TEndereco;
  _Dao: TDmConexao;
  _Dados: TDmDados;
begin
  _Dados := TDmDados.Create(nil);

  _Cep := form.edt_consultarCep.Text;
  _Cep := StringReplace(_Cep, '-', '', [RfReplaceAll]);

  _Dados.RESTClient1.BaseURL := 'https://viacep.com.br/ws/' + _Cep + '/json';

  try
    _Dados.RESTRequest1.Execute;
  except
    ShowMessage('CEP n�o encontrado');
  end;

  LimparDadosTela;
  if _Dados.RESTRequest1.Response.StatusCode = 200 then
  begin
    _Endereco := PopularPropriedadesClasse(_Dados);
    _Endereco.cep := StringReplace(_Endereco.cep, '-', '', [RfReplaceAll]);
    TransacionarBanco(_Endereco);
    PreencherDadosTela(_Endereco);
  end;

  _Endereco.Free;
  _Dados.Free;

end;


procedure Tfrm_consultaCep.btn_buscarClick(Sender: TObject);
begin
  ConsultarCep(frm_consultaCep);
end;



end.
