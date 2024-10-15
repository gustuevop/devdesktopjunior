program consultaCepProj;

uses
  Vcl.Forms,
  consultaCep in 'consultaCep.pas' {frm_consultaCep},
  unDados in 'unDados.pas' {DmDados: TDataModule},
  unConexao in 'unConexao.pas' {DmConexao: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrm_consultaCep, frm_consultaCep);
  Application.CreateForm(TDmDados, DmDados);
  Application.CreateForm(TDmConexao, DmConexao);
  Application.Run;
end.
